using System;
using System.Collections.Generic;

namespace Ion.HabboHotel.Messenger
{
    public struct MessengerCategory
    {
        public List<MessengerBuddy> Buddies;
        public uint ID;
        public string Name;
        internal MessengerCategory(List<MessengerBuddy> Buddies, uint ID, string Name)
        {
            this.Buddies = Buddies;
            this.ID = ID;
            this.Name = Name;
        }
    }
}