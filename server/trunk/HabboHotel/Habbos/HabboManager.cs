using System;

using Ion.HabboHotel.Client;
using Ion.Storage;

namespace Ion.HabboHotel.Habbos
{
    /// <summary>
    /// Manages service users ('Habbo's') and provides methods for updating and retrieving accounts.
    /// </summary>
    public class HabboManager
    {
        #region Constructors

        #endregion

        #region Methods
        public Habbo GetHabbo(uint ID)
        {
            // Prefer active client over Database
            GameClient client = IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(ID);
            if (client != null)
            {
                return client.GetHabbo();
            }
            else
            {
                Habbo habbo = new Habbo();
                if (habbo.LoadByID(IonEnvironment.GetDatabase(), ID))
                {
                    return habbo;
                }
            }

            return null;
        }
        public Habbo GetHabbo(string sUsername)
        {
            // TODO: some sort of cache?

            Habbo habbo = new Habbo();
            if (habbo.LoadByUsername(IonEnvironment.GetDatabase(), sUsername))
            {
                return habbo;
            }

            return null;
        }

        public bool UpdateHabbo(Habbo habbo)
        {
            return IonEnvironment.GetDatabase().UPDATE(habbo);
        }
        public bool containsHabbo(uint ID)
        {
            GameClient client = IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(ID);
            if (client != null)
            {
                return true;
            }
            return false;
        }
        public bool containsHabbo(string sUsername)
        {
            GameClient client = IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(sUsername);
            if (client != null)
            {
                return true;
            }
            return false;
        }
        public bool isBanned(uint ID)
        {
            using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
            {
                dbClient.AddParamWithValue("@id", ID);
                if (dbClient.findResult("SELECT userid FROM user_bans WHERE userid = @id"))
                {
                    DateTime expires = DateTime.Parse(dbClient.ReadString("SELECT expires FROM user_bans WHERE userid = @id"));
                    if (DateTime.Now < expires)
                        return true;
                    else
                        dbClient.ExecuteQuery("DELETE FROM user_bans WHERE userid = @id");
                }
            }
            return false;
        }
        public string banReason(uint ID)
        {
            if (isBanned(ID))
            {
                using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
                {
                    dbClient.AddParamWithValue("@id", ID);
                    return dbClient.ReadString("SELECT reason FROM user_bans WHERE userid = @id");
                }
            }
            return null;
        }
        #endregion
    }
}
