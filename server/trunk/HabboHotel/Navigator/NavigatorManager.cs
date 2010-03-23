using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Ion.Storage;
using Ion.HabboHotel.Rooms;

namespace Ion.HabboHotel.Navigator
{
    public class NavigatorManager
    {
        #region Categories
        #region Fields
        private List<NavigatorCategory> mCategories;
        #endregion

        #region Properties
        public List<NavigatorCategory> Categories
        {
            get { return mCategories; }
        }
        #endregion

        #region Methods
        public void ReloadCategories()
        {
            mCategories = new List<NavigatorCategory>();
            DataTable items;
            using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
            {
                items = dbClient.ReadDataTable("SELECT * FROM room_categories");
            }
            foreach (DataRow item in items.Rows)
            {
                Categories.Add(NavigatorCategory.Parse(item));
            }
            IonEnvironment.GetLog().WriteInformation("Loaded " + Categories.Count + " room categories.");
        }

        public NavigatorCategory getCategory(uint ID)
        {
            foreach (NavigatorCategory category in mCategories)
                if (category.ID == ID)
                    return category;
            throw new Exception("No category found");
        }
        public List<NavigatorCategory> getSubCategories(uint ID)
        {
            List<NavigatorCategory> subCategories = new List<NavigatorCategory>();
            foreach (NavigatorCategory category in mCategories)
                if (category.ParentID == ID)
                    subCategories.Add(category);
            return subCategories;
        }
        #endregion
        #endregion

        #region Private Rooms
        public List<Room> getUserRooms(uint userID)
        {
            List<Room> Rooms = new List<Room>();
            DataTable Result;
            using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
            {
                dbClient.AddParamWithValue("@userid", userID);
                Result = dbClient.ReadDataTable("SELECT * FROM rooms WHERE owner = @userid");
            }
            foreach (DataRow room in Result.Rows)
            {
                Rooms.Add(Room.Parse(room));
            }
            return Rooms;
        }
        public List<Room> getRooms(uint categoryID)
        {
            List<Room> Rooms = new List<Room>();
            DataTable Result;
            using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
            {
                dbClient.AddParamWithValue("@categoryid", categoryID);
                Result = dbClient.ReadDataTable("SELECT * FROM rooms WHERE category = @categoryid");
            }
            foreach (DataRow room in Result.Rows)
            {
                Rooms.Add(Room.Parse(room));
            }
            return Rooms;
        }
        #endregion
    }
}
