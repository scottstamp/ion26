using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace Ion.HabboHotel.Rooms
{
    class roomManager
    {
        private Hashtable mRooms;

        public roomManager()
        {
            mRooms = new Hashtable();
        }
        public void addRoom(uint roomID)
        {
            Room room = IonEnvironment.GetHabboHotel().GetNavigator().getRoom(roomID);
            mRooms.Add(room.ID, room);
        }
        public void removeRoom(uint roomID)
        {
            mRooms.Remove(roomID);
        }
    }
}
