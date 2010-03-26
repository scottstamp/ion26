using System;
using System.Collections.Generic;

using Ion.Net.Messages;
using Ion.HabboHotel.Messenger;

namespace Ion.HabboHotel.Client
{
    public partial class ClientMessageHandler
    {
        /// <summary>
        /// 15 - "@O"
        /// </summary>
        private void FriendListUpdate()
        {
            Response = mSession.GetMessenger().getUpdates();
            SendResponse();
        }

        /// <summary>
        /// 33 - "@a"
        /// </summary>
        private void SendMsg()
        {
            uint buddyID = Request.PopWireduint();
            string sText = Request.PopFixedString();

            // Buddy in list?
            if (mSession.GetMessenger().GetBuddy(buddyID) != null)
            {
                // Buddy online?
                GameClient buddyClient = IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(buddyID);
                if (buddyClient == null)
                {
                    Response.Initialize(ResponseOpcodes.InstantMessageError); // Opcode
                    Response.AppendInt32(5); // Error code
                    Response.AppendUInt32(mSession.GetHabbo().ID);
                    SendResponse();
                }
                else
                {
                    ServerMessage notify = new ServerMessage(ResponseOpcodes.NewConsole);
                    notify.AppendUInt32(mSession.GetHabbo().ID);
                    notify.AppendString(sText);
                    buddyClient.GetConnection().SendMessage(notify);
                }
            }
        }

        /// <summary>
        /// 34 - "@b"
        /// </summary>
        private void SendRoomInvite()
        {
            // TODO: check if this session is in room

            // Determine how many receivers
            int amount = Request.PopWiredInt32();
            List<GameClient> receivers = new List<GameClient>(amount);

            // Get receivers
            for (int i = 0; i < amount; i++)
            {
                // User in buddy list?
                uint buddyID = Request.PopWireduint();
                if (mSession.GetMessenger().GetBuddy(buddyID) != null)
                {
                    // User online?
                    GameClient buddyClient = IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(buddyID);
                    if (buddyClient != null)
                    {
                        receivers.Add(buddyClient);
                    }
                }
            }

            // Parse text
            string sText = Request.PopFixedString();

            // Notify the receivers
            ServerMessage notify = new ServerMessage(ResponseOpcodes.RoomInvite);
            //...
            foreach (GameClient receiver in receivers)
            {
                receiver.GetConnection().SendMessage(notify);
            }
        }

        /// <summary>
        /// 37 - "@e"
        /// </summary>
        private void AcceptBuddy()
        {
            int amount = Request.PopWiredInt32();
            for (int i = 0; i < amount; i++)
            {
                uint buddyID = Request.PopWireduint();
                mSession.GetMessenger().AcceptRequest(buddyID);
                if (IonEnvironment.GetHabboHotel().GetHabbos().containsHabbo(buddyID))
                    IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(buddyID).GetMessenger().addBuddy(mSession.GetHabbo().ID);
            }
        }

        /// <summary>
        /// 38 - "@f"
        /// </summary>
        private void DeclineBuddy()
        {
            int amount = Request.PopWiredInt32();
            for (int i = 0; i < amount; i++)
            {
                uint buddyID = Request.PopWireduint();
                mSession.GetMessenger().DeclineRequest(buddyID);
            }
        }
        
        /// <summary>
        /// 39 - "@g"
        /// </summary>
        private void RequestBuddy()
        {
            string BuddyName = Request.PopFixedString();
            mSession.GetMessenger().sendRequest(BuddyName);
        }

        /// <summary>
        /// 40 - "@h"
        /// </summary>
        private void RemoveBuddy()
        {
            int amount = Request.PopWiredInt32();
            for (int i = 0; i < amount; i++)
            {
                uint buddyID = Request.PopWireduint();
                if (mSession.GetMessenger().GetBuddy(buddyID) != null)
                {
                    mSession.GetMessenger().DeleteBuddy(buddyID);
                    if (IonEnvironment.GetHabboHotel().GetHabbos().containsHabbo(buddyID))
                        IonEnvironment.GetHabboHotel().GetClients().GetClientOfHabbo(buddyID).GetMessenger().DeleteBuddy(mSession.GetHabbo().ID);
                }
            }
            mSession.GetMessenger().ReloadBuddies();
        }

        /// <summary>
        /// 41 - "@i"
        /// </summary>
        private void HabboSearch()
        {
            // Parse search criteria
            string sCriteria = Request.PopFixedString();
            sCriteria = sCriteria.Replace("%", "");

            // Query Habbos with names similar to criteria
            List<MessengerBuddy> matches = IonEnvironment.GetHabboHotel().GetMessenger().SearchHabbos(sCriteria);
            List<MessengerBuddy> Friends = new List<MessengerBuddy>();
            List<MessengerBuddy> Others = new List<MessengerBuddy>();
            // Build response
            Response.Initialize(ResponseOpcodes.HabboSearchResult);
            foreach (MessengerBuddy match in matches)
            {
                if (mSession.GetMessenger().isFreinds(match.ID))
                    Friends.Add(match);
                else
                    Others.Add(match);
            }
            Response.AppendInt32(Friends.Count);
            foreach (MessengerBuddy match in Friends)
            {
                Response.AppendUInt32(match.ID);
                Response.AppendString(match.Username);
                Response.AppendString(match.Motto);
                Response.AppendBoolean(match.Online);
                Response.AppendBoolean(match.InRoom);
                Response.AppendChar(2);
                Response.AppendBoolean(true); // TODO: Show figure configurable in settings?
                Response.AppendString(match.Figure);
                if (!match.Online)
                    Response.Append(match.LastVisit);
                Response.AppendChar(2);
                //Response.AppendChar(2);
                //Response.AppendChar(2);
            }
            Response.AppendInt32(Others.Count);
            foreach (MessengerBuddy match in Others)
            {
                Response.AppendUInt32(match.ID);
                Response.AppendString(match.Username);
                Response.AppendString(match.Motto);
                Response.AppendBoolean(match.Online);
                Response.AppendBoolean(match.InRoom);
                Response.AppendChar(2);
                Response.AppendBoolean(true); // TODO: Show figure configurable in settings?
                Response.AppendString(match.Figure);
                if (!match.Online)
                    Response.Append(match.LastVisit);
                Response.AppendChar(2);
                //Response.AppendChar(2);
                //Response.AppendChar(2);
            }
            string s = Response.GetContentString();
            SendResponse();
        }

        /// <summary>
        /// 233 - "Ci"
        /// </summary>
        private void GetBuddyRequests()
        {
            Response.Initialize(ResponseOpcodes.BuddyRequests); // "Dz"

            List<FriendRequest> Requests = IonEnvironment.GetHabboHotel().GetMessenger().getRequests(mSession.GetHabbo().ID);
            Response.AppendInt32(Requests.Count);
            Response.AppendInt32(Requests.Count);

            foreach (FriendRequest Request in Requests)
            {
                Response.AppendUInt32(Request.From.ID);
                Response.AppendString(Request.From.Username);
                Response.Append(Request.ID);
            }
            SendResponse();
        }

        /// <summary>
        /// 262 - "DF"
        /// </summary>
        private void FollowFriend()
        {
            // TODO: Code this.
        }

        /// <summary>
        /// Registers the request handlers for the in-game messenger. ('Console')
        /// </summary>
        public void RegisterMessenger()
        {
            mRequestHandlers[15] = new RequestHandler(FriendListUpdate);
            mRequestHandlers[33] = new RequestHandler(SendMsg);
            mRequestHandlers[34] = new RequestHandler(SendRoomInvite);
            mRequestHandlers[37] = new RequestHandler(AcceptBuddy);
            mRequestHandlers[38] = new RequestHandler(DeclineBuddy);
            mRequestHandlers[39] = new RequestHandler(RequestBuddy);
            mRequestHandlers[40] = new RequestHandler(RemoveBuddy);
            mRequestHandlers[41] = new RequestHandler(HabboSearch);
            mRequestHandlers[233] = new RequestHandler(GetBuddyRequests);
            mRequestHandlers[262] = new RequestHandler(FollowFriend);
        }
    }
}
