using System;

namespace Ion.HabboHotel.Messenger
{
    public struct FriendRequest
    {
        public MessengerBuddy From;
        public uint toID;
        public uint ID;
        internal FriendRequest(MessengerBuddy From, uint toID, uint ID)
        {
            this.From = From;
            this.toID = toID;
            this.ID = ID;
        }
    }
}