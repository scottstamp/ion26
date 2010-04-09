using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Ion.Storage;
using System.Data;

namespace Ion.HabboHotel.Rooms.Modeldata
{
    public class ModelManager
    {
        #region Fields
        private List<Model> mModels;
        #endregion

        #region Constructors
        public ModelManager()
        {
            mModels = new List<Model>();
        }
        #endregion

        #region Methods
        public void ReloadModels()
        {
            mModels.Clear();
            using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
            {
                DataTable table = dbClient.ReadDataTable("SELECT * FROM room_models");
                foreach (DataRow row in table.Rows)
                {
                    mModels.Add(Model.Parse(row));
                }
            }
        }
        public Model getModel(string modelName)
        {
            foreach (Model model in mModels)
                if (model.Name == modelName)
                    return model;
            return null;
        }
        #endregion
    }
}
