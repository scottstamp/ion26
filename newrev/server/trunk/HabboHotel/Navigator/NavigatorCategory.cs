using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Ion.HabboHotel.Navigator
{
   public struct NavigatorCategory
    {
        #region Fields
        private uint mID;
        private uint mParentID;

        private string mName;
        private ushort mType;
        private bool mAllowTrading;

        private ushort mMinCreateRank;
        private ushort mMinViewRank;
        #endregion

        #region Properties
        /// <summary>
        /// Gets or sets the database ID of the room category.
        /// </summary>
        public uint ID
        {
            get { return mID; }
            set { mID = value; }
        }
        /// <summary>
        /// Gets or sets the name of the room category.
        /// </summary>
        public string Name
        {
            get { return mName; }
            set { mName = value; }
        }
        /// <summary>
        /// Gets or sets the database ID of the parent room category.
        /// </summary>
        public uint ParentID
        {
            get { return mParentID; }
            set { mParentID = value; }
        }
        /// <summary>
        /// Gets or sets the type of the category. (0 = publicrooms, 2 = guestrooms)
        /// </summary>
        public ushort Type
        {
            get { return mType; }
            set { mType = value; }
        }
        /// <summary>
        /// Gets or sets whether trading is allowed in this category or not.
        /// </summary>
        public bool AllowTrading
        {
            get { return mAllowTrading; }
            set { mAllowTrading = value; }
        }
        /// <summary>
        /// Gets or sets the minimum rank an user can have to create a room in this category.
        /// </summary>
        public ushort MinCreateRank
        {
            get { return mMinCreateRank; }
            set { mMinCreateRank = value; }
        }
        /// <summary>
        /// Gets or sets the minimum rank an user can have to view this category.
        /// </summary>
        public ushort MinViewRank
        {
            get { return mMinViewRank; }
            set { mMinViewRank = value; }
        }
        #endregion

        #region Methods
        public static NavigatorCategory Parse(DataRow row)
        {
            NavigatorCategory category = new NavigatorCategory();

            category.mID = Convert.ToUInt32(row["id"]);
            category.mParentID = Convert.ToUInt32(row["parent"]);

            category.mName = row["name"].ToString();
            category.mType = Convert.ToUInt16(row["type"]);
            category.mAllowTrading = (row["trading"].ToString() == "1");

            category.mMinCreateRank = Convert.ToUInt16(row["minrank_create"]);
            category.mMinViewRank = Convert.ToUInt16(row["minrank_view"]);
            return category;
        }
        #endregion
    }
}
