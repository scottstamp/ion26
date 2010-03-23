using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Ion.Net.Messages;
using System.Data;
using Ion.Storage;

namespace Ion.HabboHotel.Rooms
{
    public class PublicItem : ISerializableObject
    {
        #region Fields
        private uint mID;
        private uint mParent;
        private string mName;
        private string mDescription1;
        private string mDescription2;
        private string mIcon;
        private uint mType;
        private Room mRoom;
        #endregion

        #region Properties
        public uint ID
        {
            get { return mID; }
        }
        public uint Parent
        {
            get { return mParent; }
        }
        public string Name
        {
            get { return mName; }
        }
        public string Description1
        {
            get { return mDescription1; }
        }
        public string Description2
        {
            get { return mDescription2; }
        }
        public string Icon
        {
            get { return mIcon; }
        }
        public uint Type
        {
            get { return mType; }
        }
        public Room Room
        {
            get { return mRoom; }
        }
        #endregion

        #region Methods
        public static PublicItem Parse(DataRow row)
        {
            PublicItem item = new PublicItem();
            item.mID = Convert.ToUInt32(row["id"]);
            item.mName = (string)row["name"];
            item.mDescription1 = (string)row["description1"];
            item.mDescription2 = (string)row["description2"];
            item.mIcon = (string)row["icon"];
            item.mType = Convert.ToUInt32(row["type"]);
            item.mParent = Convert.ToUInt32(row["parent"]);
            if (item.mType == 3)
            {
                using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
                {
                    dbClient.AddParamWithValue("@roomid", row["roomid"]);
                    item.mRoom = Room.Parse(dbClient.ReadDataRow("SELECT * FROM rooms WHERE id = @roomid"));
                }
            }
            return item;
        }
        public void Serialize(ServerMessage message)
        {
            message.AppendUInt32(mID);
            message.AppendString(mName);// = Navigator room name
            message.AppendString(mDescription1);// = Navigator room description
            message.AppendBoolean(true);// = Description 2 enabled?
            message.AppendString(mDescription2);// = Description 2
            message.AppendString(mIcon);//= Navigator Icon
            message.AppendUInt32(mParent);// = Category id
            if (mType == 3)
                message.AppendUInt32(Room.Visitors);// = Visitors
            else
                message.AppendUInt32(0);
            message.AppendUInt32(mType);// = Room type
        }
        #endregion
    }
}
