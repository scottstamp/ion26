using System;
using System.Data;

using Ion.Storage;
using Ion.Net.Messages;
using Ion.HabboHotel.Habbos;
using Ion.HabboHotel.Navigator;
using Ion.HabboHotel.Rooms.Modeldata;
using System.Collections;

namespace Ion.HabboHotel.Rooms
{
    public class Room : ISerializableObject
    {
        #region Fields
        private uint mID;
        private uint mOwnerID;
        private string mOwnerName;

        private string mName;
        private string mDescription;
        private RoomAccessType mAccessType;
        private string mPassword;
        private uint mCategory;
        private int mRating;
        private bool mPublicRoom;

        private Model mModel;
        private string mLandscape;
        private ushort mWallpaper;
        private ushort mFloor;

        private ushort mVisitors;
        private ushort mMaxVisitors;

        private Hashtable mUsers;
        #endregion

        #region Properties
        public uint ID
        {
            get { return mID; }
        }
        public uint OwnerID
        {
            get { return mOwnerID; }
        }
        public string OwnerName
        {
            get { return mOwnerName; }
        }
        public string Name
        {
            get { return mName; }
            set
            {
                mName = value;
            }
        }
        public string Description
        {
            get { return mDescription; }
            set
            {
                mDescription = value;
            }
        }

        public ushort Visitors
        {
            get 
            { 
                mVisitors = (ushort)mUsers.Count;
                return mVisitors;
            }
        }
        public ushort MaxVisitors
        {
            get { return mVisitors; }
        }
        public RoomAccessType AccessType
        {
            get { return mAccessType; }
        }
        public string Password
        {
            get { return mPassword; }
        }
        public uint Category
        {
            get { return mCategory; }
        }
        public bool PublicRoom
        {
            get { return mPublicRoom; }
        }
        public int Rating
        {
            get { return mRating; }
        }
        public Model Model
        {
            get { return mModel; }
        }
        public string Landscape
        {
            get { return mLandscape; }
        }
        public ushort Wallpaper
        {
            get { return mWallpaper; }
        }
        public ushort Floor
        {
            get { return mFloor; }
        }
        #endregion

        #region Construction etc.
        public Room()
        {
            mUsers = new Hashtable();
        }
        public void Serialize(ServerMessage message)
        {
            message.AppendUInt32(mID);
            message.AppendBoolean(false);
            message.AppendString(mName);
            message.AppendString(mOwnerName);
            message.AppendInt32((int)mAccessType);
            message.AppendInt32((int)mVisitors);
            message.AppendInt32((int)mMaxVisitors);
            message.AppendString(mDescription);
            message.AppendBoolean(false); // All rights
            message.AppendBoolean(false); // Allow trading
        }
        public static Room Parse(DataRow row)
        {
            Room room = new Room();
            room.mID = Convert.ToUInt32(row["id"]);
            room.mOwnerID = Convert.ToUInt32(row["owner"]);
            Habbo Owner = new Habbo();
            Owner.LoadByID(IonEnvironment.GetDatabase(), room.mOwnerID);
            room.mOwnerName = Owner.Username;
            room.mName = (string)row["name"];
            room.mDescription = (string)row["description"];
            room.mAccessType = (RoomAccessType)Convert.ToUInt32(row["accesstype"]);
            room.mPassword = (string)row["password"];
            room.mMaxVisitors = Convert.ToUInt16(row["maxvisitors"]);
            room.mCategory = Convert.ToUInt32(row["category"]);
            room.mPublicRoom = (Convert.ToUInt32(row["type"]) == 2);

            room.mModel = IonEnvironment.GetHabboHotel().GetModels().getModel((string)row["model"]);
            room.mLandscape = (string)row["landscape"];
            room.mWallpaper = Convert.ToUInt16(row["wallpaper"]);
            room.mFloor = Convert.ToUInt16(row["floor"]);

            //Generate room rating
            using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
            {
                dbClient.AddParamWithValue("@roomid", room.ID);

                // Read + votes
                int plus = dbClient.ReadInt32("SELECT COUNT(*) FROM room_rates WHERE roomid = @roomid AND value = '+'");

                // Read - votes
                int minus = dbClient.ReadInt32("SELECT COUNT(*) FROM room_rates WHERE roomid = @roomid AND value = '+'");

                //Calculate final number
                room.mRating = plus - minus;
            }
            //room.mRating = Convert.ToUInt32(row["rating"]);
            return room;
        }
        public static Room Parse(NavigatorRoom nRoom)
        {
            Room room = new Room();
            room.mID = nRoom.ID;
            room.mOwnerID = nRoom.OwnerID;
            room.mOwnerName = nRoom.OwnerName;
            room.mName = nRoom.Name;
            room.mDescription = nRoom.Description;
            room.mAccessType = nRoom.AccessType;
            room.mPassword = nRoom.Password;
            room.mVisitors = 0;
            room.mMaxVisitors = nRoom.MaxVisitors;
            room.mCategory = nRoom.Category;
            room.mPublicRoom = nRoom.PublicRoom;
            room.mRating = nRoom.Rating;
            room.mModel = IonEnvironment.GetHabboHotel().GetModels().getModel(nRoom.Model);
            room.mLandscape = nRoom.Landscape;
            room.mWallpaper = nRoom.Wallpaper;
            room.mFloor = nRoom.Floor;
            return room;
        }
        #endregion

        #region Add & removing of habbos
        public void AddHabbo(Habbo habbo)
        {
            habbo.RoomUserID = GetFreeRoomUserID();
            habbo.X = Model.Door_X;
            habbo.Y = Model.Door_Y;
            habbo.Height = Model.Door_Height;
            mUsers.Add(habbo.RoomUserID, habbo);
            ServerMessage message = new ServerMessage(28); // "@\": [[#room_handler, #handle_users]]
            message.Append(habbo.RoomString());
            SendMessage(message);
        }
        #endregion

        #region Misc
        public uint GetFreeRoomUserID()
        {
            uint ID = 0;
            while (true)
            {
                if (!mUsers.Contains(ID))
                    return ID;
                else
                    ID++;
            }
        }
        #endregion

        #region Data sending
        public void SendMessage(ServerMessage message)
        {
            foreach (Habbo habbo in mUsers.Values)
                IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(habbo.ID).GetConnection().SendMessage(message);
        }
        #endregion

        public ICollection GetHabbos()
        {
            return mUsers.Values;
        }
        #region Storage
        public void UPDATE()
        {
            using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
            {
                // Add parameters
                dbClient.AddParamWithValue("@id", mID);
                dbClient.AddParamWithValue("@owner", mOwnerID);
                dbClient.AddParamWithValue("@name", mName);
                dbClient.AddParamWithValue("@description", mDescription);
                dbClient.AddParamWithValue("@accesstype", (uint)mAccessType);

                dbClient.AddParamWithValue("@password", mPassword);
                dbClient.AddParamWithValue("@category", mCategory);
                dbClient.AddParamWithValue("@type", mPublicRoom ? 2 : 0);

                dbClient.AddParamWithValue("@model", mModel);
                dbClient.AddParamWithValue("@landscape", mLandscape);
                dbClient.AddParamWithValue("@wallpaper", mWallpaper);

                dbClient.AddParamWithValue("@floor", mFloor);

                // Execute
                dbClient.ExecuteQuery("UPDATE rooms " +
                    "SET owner=@owner,name=@name,description=@description,accesstype=@accesstype,password=@password,category=@category,type=@type,model=@model,landscape=@landscape,wallpaper=@wallpaper,floor=@floor " +
                    "WHERE id = @id;");
            }
        }
        #endregion
    }
}
