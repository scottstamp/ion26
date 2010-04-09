using System;
using System.Data;
using System.Collections.Generic;

using Ion.Storage;

namespace Ion.HabboHotel.Messenger
{
    public class MessengerManager
    {
        public List<MessengerBuddy> SearchHabbos(string criteria)
        {
            List<MessengerBuddy> matches = new List<MessengerBuddy>();
            using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
            {
                dbClient.AddParamWithValue("@criteria", "%" + criteria + "%");
                foreach (DataRow row in dbClient.ReadDataTable("SELECT * FROM users WHERE username LIKE @criteria").Rows)
                {
                    MessengerBuddy match = MessengerBuddy.Parse(row);
                    if (match != null)
                    {
                            matches.Add(match);
                    }
                }
            }

            return matches;
        }
        //public bool isFriends(uint userID, uint friendID)
        //{
        //    using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
        //    {
        //        dbClient.AddParamWithValue("@userid", userID);
        //        dbClient.AddParamWithValue("@friendid", friendID);
        //        if (dbClient.ReadInt32("SELECT accepted FROM messenger_buddylist WHERE buddyid = @friendid AND userid = @buddy;") == 0)
        //            if (dbClient.ReadInt32("SELECT accepted FROM messenger_buddylist WHERE buddyid = @userid AND userid = @friendid;") == 0)
        //                return false;
        //            else
        //                return true;
        //        else
        //            return true;
        //    }
        //}
        public List<FriendRequest> getRequests(uint userID)
        {
            List<FriendRequest> matches = new List<FriendRequest>();
            using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
            {
                dbClient.AddParamWithValue("@userid", userID);
                DataTable dTable = dbClient.ReadDataTable("SELECT id, buddyid FROM messenger_buddylist WHERE userid = @userid AND accepted = 0;");

                foreach (DataRow dRow in dTable.Rows)
                {
                    dbClient.AddParamWithValue("@buddyid", dRow[1]);
                    DataRow row = dbClient.ReadDataRow("SELECT id,username,figure,motto,lastvisit FROM users WHERE id = @buddyid;");
                    MessengerBuddy match = MessengerBuddy.Parse(row);
                    if (match != null)
                    {
                        matches.Add(new FriendRequest(MessengerBuddy.Parse(row), userID, Convert.ToUInt32(dRow[0])));
                    }
                }
            }
            return matches;
        }
        public List<MessengerCategory> getCategories(uint userID)
        {
            List<MessengerCategory> Categories = new List<MessengerCategory>();
            using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
            {
                dbClient.AddParamWithValue("@userid", userID);
                DataTable table = dbClient.ReadDataTable("SELECT id,name FROM messenger_categories WHERE owner = @userid");
                foreach (DataRow row in table.Rows)
                {
                    List<MessengerBuddy> Buddies = new List<MessengerBuddy>();
                    dbClient.AddParamWithValue("@category", row["id"]);
                    DataTable dTable = dbClient.ReadDataTable("SELECT userid FROM messenger_buddies_categories WHERE categoryid = @category");
                    foreach (DataRow dRow in dTable.Rows)
                    {
                        dbClient.AddParamWithValue("@id", dRow["userid"]);
                        DataRow Info = dbClient.ReadDataRow("SELECT id,username,figure,motto,lastvisit FROM users WHERE id = @id");
                        Buddies.Add(MessengerBuddy.Parse(Info));
                    }
                    Categories.Add(new MessengerCategory(Buddies, (uint)row["id"], (string)row["name"]));
                }
            }
            return Categories;
        }
    }
}
