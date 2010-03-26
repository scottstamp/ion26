using System;
using System.Data;

using Ion.Storage;
using Ion.Net.Messages;
using Ion.HabboHotel.Habbos;

namespace Ion.HabboHotel.Navigator
{
    public class NavigatorRoom : ISerializableObject
    {
        #region Fields
        private uint mID;
        private uint mOwnerID;
        private string mOwnerName;

        private string mName;
        private string mDescription;
        private ushort mAccessType;
        private string mPassword;
        private uint mCategory;
        private int mRating;
        private bool mPublicRoom;
        private string mShockwaveFiles;
        private string mModel;

        private ushort mVisitors;
        private ushort mMaxVisitors;
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
            get { return mVisitors; }
        }
        public ushort MaxVisitors
        {
            get { return mVisitors; }
        }
        public ushort AccessType
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
        public string ShockwaveFiles
        {
            get { return mShockwaveFiles; }
        }
        public string Model
        {
            get { return mModel; }
        }
        #endregion

        #region Methods
        public void Serialize(ServerMessage message)
        {
            message.AppendUInt32(mID);

            if (mPublicRoom)
            {
                message.AppendInt32(1);
                message.AppendString(mName);
                message.AppendUInt32(mVisitors); // TODO: Visitors
                message.AppendUInt32(mMaxVisitors);
                message.AppendUInt32(mCategory);
                message.AppendString(mDescription);
                message.AppendUInt32(mID);
                message.AppendInt32(0);
                message.AppendString(mShockwaveFiles);
                message.AppendInt32(0);
                message.AppendInt32(1);
            }
            else
            {
                message.AppendString(mName);
                message.AppendString(mOwnerName);
                message.AppendString("password");
                message.AppendUInt32(0); // TODO: Visitors
                message.AppendUInt32(mMaxVisitors);
                message.AppendString(mDescription);
            }
        }
        public static NavigatorRoom Parse(DataRow row)
        {
            NavigatorRoom room = new NavigatorRoom();
            room.mID = Convert.ToUInt32(row["id"]);
            room.mOwnerID = Convert.ToUInt32(row["owner"]);
            Habbo Owner = new Habbo();
            Owner.LoadByID(IonEnvironment.GetDatabase(), room.mOwnerID);
            room.mOwnerName = Owner.Username;
            room.mName = (string)row["name"];
            room.mDescription = (string)row["description"];
            room.mAccessType = Convert.ToUInt16(row["accesstype"]);
            room.mPassword = (string)row["password"];
            room.mVisitors = 0;
            room.mMaxVisitors = Convert.ToUInt16(row["maxvisitors"]);
            room.mCategory = Convert.ToUInt32(row["category"]);
            room.mPublicRoom = (Convert.ToUInt32(row["type"]) == 2);
            room.mShockwaveFiles = (string)row["shockwavefiles"];
            room.mModel = (string)row["model"];

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
        #region Storage
        public void INSERT(DatabaseManager database)
        {

        }
        public void DELETE(DatabaseManager database)
        {

        }
        #endregion
        #endregion
    }
}
