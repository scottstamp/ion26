using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace Ion.HabboHotel.Rooms
{
    public class RoomManager
    {
        private Hashtable mRooms;

        public RoomManager()
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
        public bool containsRoom(uint roomID)
        {
            return mRooms.Contains(roomID);
        }
        public Room getRoom(uint roomID)
        {
            foreach (Room room in mRooms.Values)
                if (room.ID == roomID)
                    return room;
            return null;
        }
        public List<Room> getRooms(uint categoryID)
        {
            List<Room> rooms = new List<Room>();
            foreach (Room room in mRooms.Values)
                if (room.Category == categoryID)
                    rooms.Add(room);
            return rooms;
        }
    }
}
