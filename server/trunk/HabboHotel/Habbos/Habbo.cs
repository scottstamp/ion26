using System;
using System.Text;
using System.Data;

using Ion.Storage;
using Ion.Net.Messages;

namespace Ion.HabboHotel.Habbos
{
    /// <summary>
    /// Represents a service user's account and avatar in the account and holds the information about the account.
    /// </summary>
    public class Habbo : IDataObject, ISerializableObject
    {
        #region Fields
        // Account
        private uint mID;
        private string mUsername;
        private string mPassword;
        private byte mRole;
        private DateTime mSignedUp;

        // Personal
        private string mEmail;
        private string mDateOfBirth;

        // Avatar
        private string mMotto;
        private string mFigure;
        private char mGender;

        // Valueables
        private uint mCoins;
        #endregion

        #region Properties
        /// <summary>
        /// Gets or sets the ID of this Habbo as a 32 bit unsigned integer.
        /// </summary>
        public uint ID
        {
            get { return mID; }
        }
        /// <summary>
        /// Gets or sets the username of this Habbo as a string. The username is shown to other Habbo's in the service, and is also used to login to the service.
        /// </summary>
        public string Username
        {
            get { return mUsername; }
            set { mUsername = value; }
        }
        /// <summary>
        /// Gets or sets the password of this Habbo as a string. (plaintext) The password is used in combination with the username when logging in to the service.
        /// </summary>
        public string Password
        {
            get { return mPassword; }
            set { mPassword = value; }
        }
        /// <summary>
        /// Gets the user role of this Habbo as a byte.
        /// </summary>
        public byte Role
        {
            get { return mRole; }
        }
        public DateTime SignedUp
        {
            get { return mSignedUp; }
            set { mSignedUp = value; }
        }

        public string Email
        {
            get { return mEmail; }
            set { mEmail = value; }
        }
        public string DateOfBirth
        {
            get { return mDateOfBirth; }
            set { mDateOfBirth = value; }
        }

        public string Motto
        {
            get { return mMotto; }
            set
            {
                // TODO: swear word filtering?
                mMotto = value;
            }
        }

        public string Figure
        {
            get { return mFigure; }
            set { mFigure = value; }
        }

        public char Gender
        {
            get { return mGender; }
            set { mGender = (value == 'M' || value == 'F') ? value : 'M'; }
        }

        public uint Coins
        {
            get { return mCoins; }
            set { mCoins = value; }
        }
        #endregion

        #region Methods
        public void Serialize(ServerMessage message)
        {
            message.AppendString(mID.ToString());
            message.AppendString(mUsername);
            message.AppendString(mFigure);
            message.AppendString(mGender.ToString());
            message.AppendString(mMotto.ToString());
            message.AppendBoolean(false);
            message.AppendString("");
            message.AppendBoolean(false);
            message.AppendBoolean(false);
            message.AppendBoolean(false);
            message.AppendBoolean(false);
        }

        #region Storage
        private void CheckinUserParams(ref DatabaseClient dbClient)
        {
            dbClient.AddParamWithValue("@id", mID);
            dbClient.AddParamWithValue("@username", mUsername);
            dbClient.AddParamWithValue("@password", mPassword);
            dbClient.AddParamWithValue("@role", mRole);
            dbClient.AddParamWithValue("@signedup", mSignedUp);

            dbClient.AddParamWithValue("@email", mEmail);
            dbClient.AddParamWithValue("@dob", mDateOfBirth);

            dbClient.AddParamWithValue("@motto", mMotto);
            dbClient.AddParamWithValue("@figure", mFigure);
            dbClient.AddParamWithValue("@gender", mGender);

            dbClient.AddParamWithValue("@coins", mCoins);
        }
        private bool CheckoutUserParams(ref DataRow dRow)
        {
            if (dRow == null)
                return false;

            mID = (uint)dRow["id"];
            mUsername = (string)dRow["username"];
            mPassword = (string)dRow["password"];
            mRole = (byte)dRow["role"];
            mSignedUp = (DateTime)dRow["signedup"];

            mEmail = (string)dRow["email"];
            mDateOfBirth = (string)dRow["dob"];

            mMotto = (string)dRow["motto"];
            mFigure = (string)dRow["figure"];
            mGender = char.Parse(dRow["gender"].ToString());

            mCoins = (uint)dRow["coins"];
            return true;
        }
        
        public bool LoadByID(DatabaseManager database, uint ID)
        {
            DataRow result = null;
            using (DatabaseClient dbClient = database.GetClient())
            {
                dbClient.AddParamWithValue("@id", ID);
                result = dbClient.ReadDataRow("SELECT * FROM users WHERE id = @id LIMIT 1;");
            }

            return CheckoutUserParams(ref result);
        }
        public bool LoadByUsername(DatabaseManager database, string sUsername)
        {
            DataRow result = null;
            using (DatabaseClient dbClient = database.GetClient())
            {
                dbClient.AddParamWithValue("@username", sUsername);
                result = dbClient.ReadDataRow("SELECT * FROM users WHERE username = @username LIMIT 1;");
            }

            return CheckoutUserParams(ref result);
        }

        public bool LoadBySsoTicket(DatabaseManager database, string sTicket)
        {
            DataRow result = null;
            using (DatabaseClient dbClient = database.GetClient())
            {
                dbClient.AddParamWithValue("@ticket", sTicket);
                result = dbClient.ReadDataRow("SELECT * FROM users WHERE ssoticket = @ticket;");
                if (result != null)
                {
                    //dbClient.ExecuteQuery("UPDATE users SET ssoticket = NULL WHERE ssoticket = @ticket LIMIT 1;");
                }
            }

            return CheckoutUserParams(ref result);
        }

        public bool INSERT(DatabaseClient dbClient)
        {
            CheckinUserParams(ref dbClient);
            dbClient.ExecuteQuery("INSERT INTO users" +
                "(username,password,role,signedup,email,dob,motto,figure,gender,coins,films,gametickets) " +
                "VALUES(@username,@password,@role,@signedup,@email,@dob,@motto,@figure,@gender,@coins,@films,@gametickets);");

            return true;
        }
        public bool DELETE(DatabaseClient dbClient)
        {
            dbClient.AddParamWithValue("@id", mID);
            dbClient.ExecuteQuery("DELETE FROM users WHERE id = @id;");

            return true;
        }
        public bool UPDATE(DatabaseClient dbClient)
        {
            CheckinUserParams(ref dbClient);
            dbClient.ExecuteQuery("UPDATE users " +
                "SET username=@username,password=@password,role=@role,signedup=@signedup,email=@email,dob=@dob,motto=@motto,figure=@figure,gender=@gender,coins=@coins " +
                "WHERE id = @id;");

            return true;
        }
        #endregion
        #endregion
    }
}
