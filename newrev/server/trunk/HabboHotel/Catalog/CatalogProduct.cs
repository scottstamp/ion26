﻿using System;

using Ion.Net.Messages;
using Ion.HabboHotel.Furnitures;
using System.Data;
using Ion.Storage;

namespace Ion.HabboHotel.Catalog
{
    public class CatalogProduct : ISerializableObject
    {
        #region Fields
        private uint mID;
        private FurnitureTemplate mTemplate;
        private uint mCost;
        #endregion

        #region Properties
        public uint ID
        {
            get { return mID; }
        }
        public FurnitureTemplate Template
        {
            get { return mTemplate; }
        }
        public uint Cost
        {
            get { return mCost; }
        }
        #endregion

        #region Methods
        public void Serialize(ServerMessage message)
        {
        //                    pageBuilder.Append("p:" + itemNames[i] + Convert.ToChar(9) + itemDescs[i] + Convert.ToChar(9) + itemCosts[i] + Convert.ToChar(9) + Convert.ToChar(9));
            message.Append("p:");
            message.AppendString(this.mTemplate.Name, 9);
            message.AppendString(this.mTemplate.Description, 9);
            message.AppendString(this.mCost, 9);
            message.AppendChar(9);
            if (this.mTemplate.Type != FurnitureType.WallItem)
                message.AppendString("s", 9);
            else
                message.AppendString("i", 9);
            message.AppendString(this.mTemplate.Sprite, 9);
            if (this.mTemplate.Type != FurnitureType.WallItem)
                message.Append("0");
            message.AppendChar(9);
            if (this.mTemplate.Type != FurnitureType.WallItem)
            {
                message.Append(this.mTemplate.Length);
                message.Append(",");
                message.Append(this.mTemplate.Width);
            }
            message.AppendChar(9);
            message.AppendString(this.mTemplate.Sprite, 9);
            if (this.mTemplate.Type != FurnitureType.WallItem)
                message.Append(mTemplate.Color);
            message.AppendChar(13);
            string s = message.GetContentString();
        }
        public static CatalogProduct Parse(DataRow row)
        {
            CatalogProduct product = new CatalogProduct();
            product.mID = (uint)row["id"];
            product.mCost = (uint)row["cost"];
            using (DatabaseClient dbClient = (IonEnvironment.GetDatabase().GetClient()))
            {
                dbClient.AddParamWithValue("@id", row["tid"]);
                product.mTemplate = FurnitureTemplate.Parse(dbClient.ReadDataRow("SELECT * FROM furniture_templates WHERE id = @id"));
            }
            return product;
        }
        #endregion
    }
}
