using System;
using System.Data;

using Ion.Storage;
using Ion.Net.Messages;
using Ion.HabboHotel.Habbos;

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
        private ushort mAccessType;
        private string mPassword;
        private string mIcon;
        private uint mCategory;
        private bool mTrading;
        private uint mRating;

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
        public uint Category
        {
            get { return mCategory; }
        }
        public bool Trading
        {
            get { return mTrading; }
        }
        public uint Rating
        {
            get { return mRating; }
        }
        public string Icon
        {
            get { return mIcon; }
        }
        #endregion

        #region Methods
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
            room.mAccessType = Convert.ToUInt16(row["accesstype"]);
            room.mPassword = (string)row["password"];
            room.mIcon = (string)row["icon"];
            room.mVisitors = Convert.ToUInt16(row["visitors"]);
            room.mMaxVisitors = Convert.ToUInt16(row["maxvisitors"]);
            room.mCategory = Convert.ToUInt32(row["category"]);
            room.mTrading = (Convert.ToUInt32(row["trading"]) == 1);
            room.mRating = Convert.ToUInt32(row["rating"]);
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
