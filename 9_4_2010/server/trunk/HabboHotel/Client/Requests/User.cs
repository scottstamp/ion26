using System;
using System.Collections.Generic;

using Ion.HabboHotel.Client.Utilities;
using Ion.HabboHotel.Messenger;

namespace Ion.HabboHotel.Client
{
    public partial class ClientMessageHandler
    {
        private const bool ENABLE_MESSENGER = true;

        /// <summary>
        /// 7 - "@G"
        /// </summary>
        public void InfoRetrieve()
        {
            if (mSession.GetHabbo() != null)
            {
                Response.Initialize(ResponseOpcodes.UserObject); // "@E"
                Response.AppendObject(mSession.GetHabbo());
                SendResponse();
            }
        }

        /// <summary>
        /// 8 - "@H"
        /// </summary>
        public void GetCredits()
        {
            if (mSession.GetHabbo() != null)
            {
                Response.Initialize(ResponseOpcodes.CreditBalance); // "@F"
                Response.Append(mSession.GetHabbo().Coins);
                Response.Append(".0");

                SendResponse();
            }
        }
        /// <summary>
        /// 12 - "@L"
        /// </summary>
        private void MessengerInit()
        {
            if (mSession.InitializeMessenger())
            {
                // Register handlers
                RegisterMessenger();

                // Send initialization message
                Response.Initialize(ResponseOpcodes.MessengerInit); // "@L"
                if (IonEnvironment.GetHabboHotel().GetUserRights().RoleHasRight(mSession.GetHabbo().Role, "habbo_club"))
                    Response.AppendUInt32(uint.Parse(IonEnvironment.GetConfiguration().GetValue("projects.habbo.users.hc_maxfriends")));
                else
                    Response.AppendUInt32(uint.Parse(IonEnvironment.GetConfiguration().GetValue("projects.habbo.users.maxfriends")));
                Response.AppendUInt32(uint.Parse(IonEnvironment.GetConfiguration().GetValue("projects.habbo.users.maxfriends")));
                Response.AppendUInt32(uint.Parse(IonEnvironment.GetConfiguration().GetValue("projects.habbo.users.hc_maxfriends")));

                List<MessengerCategory> Categories = IonEnvironment.GetHabboHotel().GetMessenger().getCategories(mSession.GetHabbo().ID);

                Response.AppendInt32(Categories.Count);
                foreach (MessengerCategory category in Categories)
                {
                    Response.AppendUInt32(category.ID);
                    Response.AppendString(category.Name);
                }

                Response.AppendInt32(mSession.GetMessenger().GetBuddies().Count);
                foreach (MessengerBuddy buddy in mSession.GetMessenger().GetBuddies().Values)
                {
                    Response.AppendObject(buddy);
                    if (buddy.Online)
                        IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(buddy.ID).GetMessenger().addBuddy(mSession.GetHabbo().ID);
                }
                string s = Response.GetContentString();
                
                SendResponse();

                //mSession.GetMessenger().notifyFriends(false); // Notify the friends that is online that i'm here!
            }
        }
        /// <summary>
        /// 26 - "@Z"
        /// </summary>
        public void ScrGetUserInfo()
        {
            string sSubscription = Request.PopFixedString();
            Response.Initialize(ResponseOpcodes.ScrSendUserInfo); // "@G"
            Response.AppendString(sSubscription);
            Response.AppendInt32(7331);
            Response.AppendInt32(0);
            Response.AppendInt32(0);
            Response.AppendBoolean(true);
            SendResponse();
        }

        /// <summary>
        /// 157 - "B]"
        /// </summary>
        public void GetBadges()
        {

        }

        /// <summary>
        /// 321 - "EA"
        /// </summary>
        private void GetIgnoredUsers()
        {
            Response.Initialize(ResponseOpcodes.IgnoredUsers); // "Fd"
            Response.AppendString("Aaron");
            Response.AppendString("office.boy");
            Response.AppendString("Phoenix");
            SendResponse();
        }

        /// <summary>
        /// 370 - "Er"
        /// </summary>
        private void GetAchievements()
        {
            // Get achievements from Database
            List<string> achievements = IonEnvironment.GetHabboHotel().GetAchievements().GetAchievements(mSession.GetHabbo().ID);

            // Build response
            Response.Initialize(ResponseOpcodes.Achievements); // "Ce"
            Response.AppendInt32(achievements.Count);
            foreach (string achievement in achievements)
            {
                Response.AppendString(achievement);
            }
            SendResponse();
        }

        /// <summary>
        /// 228 - "Cd" - "GET_SOUND_SETTING"
        /// </summary>
        private void GetSoundSettings()
        {
            // Build response
            Response.Initialize(308); // "Dt": [[#login_handler, #handleSoundSetting]]
            Response.AppendBoolean(mSession.GetHabbo().Sound);
            Response.AppendInt32(0);
            SendResponse();
        }
        /// <summary>
        /// 229 - "Ce" - "SET_SOUND_SETTING"
        /// </summary>
        private void SetSoundSettings()
        {
            // Save sound settings
            bool sound = Request.PopWiredBoolean();
            mSession.GetHabbo().Sound = sound;
            mSession.GetHabbo().UPDATE(IonEnvironment.GetDatabase().GetClient());
            SendResponse();
        }

        /// <summary>
        /// 222 - "C^" - "GET_FURNI_RECYCLER_CONFIGURATION"
        /// </summary>
        private void GetRecyclerConfig()
        {
            // TODO: Recycler
        }

        /// <summary>
        /// 223 - "C_" - "GET_FURNI_RECYCLER_STATUS"
        /// </summary>
        private void GetRecyclerStatus()
        {
            // TODO: Recycler
        }

        /// <summary>
        /// 360 - "Eh" - ""MSG_INIT_TUTORSERVICE"
        /// </summary>
        private void InitTutorService()
        {
            // TODO: Guide init
        }

        /// <summary>
        /// Registers request handlers available from successful login.
        /// </summary>
        public void RegisterUser()
        {
            mRequestHandlers[7] = new RequestHandler(InfoRetrieve);
            mRequestHandlers[8] = new RequestHandler(GetCredits);
            mRequestHandlers[12] = new RequestHandler(MessengerInit);
            mRequestHandlers[26] = new RequestHandler(ScrGetUserInfo);
            mRequestHandlers[157] = new RequestHandler(GetBadges);
            mRequestHandlers[321] = new RequestHandler(GetIgnoredUsers);
            mRequestHandlers[370] = new RequestHandler(GetAchievements);
            mRequestHandlers[228] = new RequestHandler(GetSoundSettings);
            mRequestHandlers[229] = new RequestHandler(SetSoundSettings);
            mRequestHandlers[222] = new RequestHandler(GetRecyclerConfig);
            mRequestHandlers[223] = new RequestHandler(GetRecyclerStatus);
            mRequestHandlers[360] = new RequestHandler(InitTutorService);
        }
    }
}
