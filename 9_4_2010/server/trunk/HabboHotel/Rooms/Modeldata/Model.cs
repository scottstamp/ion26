using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Ion.HabboHotel.Rooms.Modeldata
{
    public class Model
    {
        #region Fields
        private uint mID;
        private string mName;
        private string mHeightmap;
        private ushort mDoor_X;
        private ushort mDoor_Y;
        private ushort mDoor_Height;
        #endregion

        #region Properties
        public uint ID
        {
            get { return mID; }
        }
        public string Name
        {
            get { return mName; }
        }
        public string Heightmap
        {
            get { return mHeightmap; }
        }
        public ushort Door_X
        {
            get { return mDoor_X; }
        }
        public ushort Door_Y
        {
            get { return mDoor_Y; }
        }
        public ushort Door_Height
        {
            get { return mDoor_Height; }
        }
        #endregion

        #region Methods
        public static Model Parse(DataRow row)
        {
            Model model = new Model();
            model.mID = Convert.ToUInt32(row["id"]);
            model.mName = (string)row["name"];
            model.mHeightmap = (string)row["heightmap"];
            model.mDoor_X = Convert.ToUInt16(row["door_x"]);
            model.mDoor_Y = Convert.ToUInt16(row["door_y"]);
            model.mDoor_Height = Convert.ToUInt16(row["door_height"]);
            return model;
        }
        #endregion
    }
}
