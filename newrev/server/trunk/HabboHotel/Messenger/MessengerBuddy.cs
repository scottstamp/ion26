using System;
using System.Data;

using Ion.Storage;
using Ion.Net.Messages;

namespace Ion.HabboHotel.Messenger
{
    public class MessengerBuddy : ISerializableObject
    {
        #region Fields
        private uint mID;
        private string mUsername;
        private string mFigure;
        private string mMotto;
        private string mLastVisit;
        private uint mCategory;

        private bool mOnline()
        {
            return IonEnvironment.GetHabboHotel().GetHabbos().containsHabbo(mID);
        }
        private bool mInRoom()
        {
            if (mOnline()) // TODO: Check if user is in room.
                return true;
            else
                return false;
        }
        #endregion

        #region Properties
        public uint ID
        {
            get { return mID; }
        }
        public string Username
        {
            get { return mUsername; }
        }
        public string Figure
        {
            get { return mFigure; }
        }
        public string Motto
        {
            get { return mMotto; }
        }
        public string LastVisit
        {
            get { return mLastVisit; }
        }
        public bool Online
        {
            get
            { return mOnline(); }
        }
        public bool InRoom
        {
            get { return mInRoom(); }
        }
        public uint Category
        {
            get { return mCategory; } 
        }
        #endregion

        #region Methods
        public void Serialize(ServerMessage message)
        {
            message.AppendUInt32(mID);
            message.AppendString(mUsername);
            message.AppendBoolean(false);
            message.AppendBoolean(mOnline());
            message.AppendBoolean(mInRoom());
            if (mOnline())
                message.Append(mFigure);
            message.AppendChar(2);
            message.AppendUInt32(Category);
            if (mOnline())
                message.Append(mMotto);
            message.AppendChar(2);
            if (!mOnline())
                message.Append(mLastVisit);
            message.AppendChar(2);
            //message.AppendString(mMotto);
            //message.AppendChar(2);
        }

        public static MessengerBuddy Parse(DataRow row)
        {
            MessengerBuddy buddy = new MessengerBuddy();
            try
            {
                buddy.mID = Convert.ToUInt32(row["id"]);
                buddy.mUsername = Convert.ToString(row["username"]);
                buddy.mFigure = Convert.ToString(row["figure"]);
                buddy.mMotto = Convert.ToString(row["motto"]);
                buddy.mLastVisit = Convert.ToString(row["lastvisit"]);
                using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
                {
                    dbClient.AddParamWithValue("@userid", buddy.mID);
                    buddy.mCategory = Convert.ToUInt32(dbClient.ReadInt32("SELECT categoryid FROM messenger_buddies_categories WHERE userid = @userid"));
                }
                return buddy;
            }
            catch (Exception ex)
            {
                IonEnvironment.GetLog().WriteUnhandledExceptionError("MessengerBuddy.Parse", ex);
            }

            return null;
        }
        public static MessengerBuddy Parse(uint ID)
        {
            MessengerBuddy buddy = new MessengerBuddy();
            try
            {
                using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
                {
                    dbClient.AddParamWithValue("@userid", ID);
                    DataRow row = dbClient.ReadDataRow("SELECT * FROM users WHERE id = @userid");
                    buddy.mID = Convert.ToUInt32(row["id"]);
                    buddy.mUsername = Convert.ToString(row["username"]);
                    buddy.mFigure = Convert.ToString(row["figure"]);
                    buddy.mMotto = Convert.ToString(row["motto"]);
                    buddy.mLastVisit = Convert.ToString(row["lastvisit"]);
                    buddy.mCategory = Convert.ToUInt32(dbClient.ReadInt32("SELECT categoryid FROM messenger_buddies_categories WHERE userid = @userid"));
                }
                return buddy;
            }
            catch (Exception ex)
            {
                IonEnvironment.GetLog().WriteUnhandledExceptionError("MessengerBuddy.Parse", ex);
            }

            return null;
        }
        #endregion
    }
}
