using System;
using System.Data;
using System.Collections.Generic;

using Ion.Storage;
using Ion.HabboHotel.Client;
using Ion.Net.Messages;
using System.Collections;

namespace Ion.HabboHotel.Messenger
{
    public class MessengerComponent
    {
        #region Fields
        private GameClient mClient;
        private Hashtable mBuddies;
        #endregion

        #region Constructors
        public MessengerComponent(GameClient client)
        {
            mClient = client;
            mBuddies = new Hashtable();
        }
        #endregion

        #region Methods
        public void ReloadBuddies()
        {
            mBuddies.Clear();
            using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
            {
                dbClient.AddParamWithValue("@userid", mClient.GetHabbo().ID);
                foreach (DataRow row in dbClient.ReadDataTable("SELECT id,username,figure,motto,lastvisit FROM users WHERE id IN(SELECT buddyid FROM messenger_buddylist WHERE userid = @userid AND accepted = 0x01) OR id IN(SELECT userid FROM messenger_buddylist WHERE buddyid = @userid AND accepted = 0x01);").Rows)
                {
                    MessengerBuddy buddy = MessengerBuddy.Parse(row);
                    if (buddy != null)
                    {
                        mBuddies.Add(buddy.ID, buddy);
                    }
                }
            }
        }
        public bool isFreinds(uint buddyID)
        {
            foreach (MessengerBuddy buddy in mBuddies.Values)
                if (buddy.ID == buddyID)
                    return true;
            return false;
        }
        public void AcceptRequest(uint buddyID)
        {
            using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
            {
                dbClient.AddParamWithValue("@userid", mClient.GetHabbo().ID);
                dbClient.AddParamWithValue("@buddyid", buddyID);
                dbClient.ExecuteQuery("UPDATE messenger_buddylist SET accepted = 1 WHERE userid = @userid AND buddyid = @buddyid");
            }
            addBuddy(buddyID);
        }
        public void DeleteBuddy(uint buddyID)
        {
            using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
            {
                dbClient.AddParamWithValue("@userid", mClient.GetHabbo().ID);
                dbClient.AddParamWithValue("@buddyid", buddyID);
                dbClient.ExecuteQuery("DELETE FROM messenger_buddylist WHERE (userid = @userid AND buddyid = @buddyid) OR (userid = @buddyid AND buddyid = @userid)");
            }
            deleteBuddy(buddyID);
        }
        public void addBuddy(uint buddyID)
        {
            if (!mBuddies.Contains(buddyID))
                mBuddies.Add(buddyID, MessengerBuddy.Parse(buddyID));
            ServerMessage Response = new ServerMessage(13); // "@M"
            Response.AppendInt32(0); // Categories?
            Response.AppendInt32(1); // Friends
            Response.AppendInt32(1); // ???
            Response.AppendObject(GetBuddy(buddyID));
            mClient.GetConnection().SendMessage(Response);
        }
        public void removeBuddy(uint buddyID)
        {
            if (!mBuddies.Contains(buddyID))
                mBuddies.Add(buddyID, MessengerBuddy.Parse(buddyID));
            ServerMessage Response = new ServerMessage(13); // "@M"
            Response.AppendInt32(0); // Categories?
            Response.AppendInt32(1); // Friends
            Response.AppendInt32(0); // ???
            Response.AppendUInt32(buddyID);
            mClient.GetConnection().SendMessage(Response);
        }
        internal void deleteBuddy(uint buddyID)
        {
            if(mBuddies.Contains(buddyID))
               mBuddies.Remove(buddyID);
            ServerMessage Response = new ServerMessage(13); // "@M"
            Response.AppendInt32(0); // Categories?
            Response.AppendInt32(1); // Friends
            Response.AppendInt32(-1); // ???
            Response.AppendUInt32(buddyID);
            mClient.GetConnection().SendMessage(Response);
        }
        public void DecelineRequest(uint buddyID)
        {
            using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
            {
                dbClient.AddParamWithValue("@userid", mClient.GetHabbo().ID);
                dbClient.AddParamWithValue("@buddyid", buddyID);
                dbClient.ExecuteQuery("DELETE FROM messenger_buddylist WHERE userid = @userid AND buddyid = @buddyid");
            }
        }
        public void sendRequest(string ReciverName)
        {
            using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
            {
                dbClient.AddParamWithValue("@name", ReciverName);
                uint reciverID = dbClient.ReadUInt32("SELECT id FROM users WHERE username = @name");
                dbClient.AddParamWithValue("@userid", reciverID);
                dbClient.AddParamWithValue("@buddyid", mClient.GetHabbo().ID);
                dbClient.ExecuteQuery("INSERT INTO messenger_buddylist(userid,buddyid,accepted) VALUES (@userid,@buddyid,0)");
            }
            if(IonEnvironment.GetHabboHotel().GetHabbos().containsHabbo(ReciverName))
            {
                ServerMessage Respone = new ServerMessage(ResponseOpcodes.NewBuddyRequest); // BD
                Respone.AppendUInt32(mClient.GetHabbo().ID);
                Respone.AppendString(mClient.GetHabbo().Username);
                Respone.Append(mClient.GetHabbo().ID);
                Respone.AppendChar(2);
                IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(IonEnvironment.GetHabboHotel().GetHabbos().GetHabbo(ReciverName).ID).GetConnection().SendMessage(Respone);
            }
        }
        public ServerMessage getUpdates()
        {
            ServerMessage Response = new ServerMessage(13); // @M
            List<MessengerCategory> Categories = IonEnvironment.GetHabboHotel().GetMessenger().getCategories(mClient.GetHabbo().ID);

            Response.AppendInt32(Categories.Count);
            foreach (MessengerCategory category in Categories)
            {
                Response.AppendUInt32(category.ID);
                Response.AppendString(category.Name);
            }

            Response.AppendInt32(GetBuddies().Count);
            Response.AppendBoolean(false);
            foreach (MessengerBuddy buddy in GetBuddies().Values)
            {
                Response.AppendObject(buddy);
            }
            return Response;
        }
        public void notifyFriends(bool goesOffline)
        {
            // Does the user have any friends online? Notify them about you logging on!
            ServerMessage notify = new ServerMessage(13); // @M

            notify.AppendUInt32(1); // Count of updates
            Hashtable Buddies = GetBuddies();
            using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
            {
                foreach (MessengerBuddy buddy in Buddies.Values)
                {
                    if (IonEnvironment.GetHabboHotel().GetHabbos().containsHabbo(buddy.ID))
                    {
                        List<MessengerCategory> Categories = IonEnvironment.GetHabboHotel().GetMessenger().getCategories(buddy.ID);
                        notify.AppendInt32(Categories.Count);
                        foreach (MessengerCategory category in Categories)
                        {
                            notify.AppendUInt32(category.ID);
                            notify.AppendString(category.Name);
                        }
                        notify.AppendUInt32(1); // Only one update, THIS USER!
                        notify.AppendUInt32(0);
                        dbClient.AddParamWithValue("@id", mClient.GetHabbo().ID);
                        MessengerBuddy me = MessengerBuddy.Parse(dbClient.ReadDataRow("SELECT id,username,figure,motto,lastvisit FROM users WHERE id = @id"));
                        notify.AppendUInt32(me.ID);
                        notify.AppendString(me.Username);
                        notify.AppendBoolean(false);
                        notify.AppendBoolean(!goesOffline);
                        notify.AppendBoolean(!goesOffline);
                        if (!goesOffline)
                            notify.Append(me.Figure);
                        notify.AppendChar(2);
                        notify.AppendUInt32(me.Category);
                        if (!goesOffline)
                            notify.Append(me.Motto);
                        notify.AppendChar(2);
                        if (goesOffline)
                            notify.Append(me.LastVisit);
                        notify.AppendChar(2);

                        IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(buddy.ID).GetConnection().SendMessage(notify);
                    }
                }
            }
        }
        public Hashtable GetBuddies()
        {
            return mBuddies;
        }

        public MessengerBuddy GetBuddy(uint buddyID)
        {
            lock (mBuddies)
            {
                foreach (MessengerBuddy buddy in mBuddies.Values)
                {
                    if (buddy.ID == buddyID)
                    {
                        return buddy;
                    }
                }
            }

            return null;
        }

        #endregion
    }
}
