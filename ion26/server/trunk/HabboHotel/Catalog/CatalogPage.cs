using System;
using System.Data;
using System.Collections.Generic;

using Ion.Net.Messages;

namespace Ion.HabboHotel.Catalog
{
    public class CatalogPage : ISerializableObject
    {
        #region Fields
        private uint mID;
        private byte mMinRole;
        private string mIndexName;
        private string mDisplayName;

        private string mLayoutClass;
        private string mHeadlineImage;
        private string mTeaserImages;
        private string mText;
        private string mMoreDetails;
        private string mExtraData;

        private List<CatalogProduct> mProducts;
        #endregion

        #region Properties
        public uint ID
        {
            get { return mID; }
        }
        public byte MinRole
        {
            get { return mMinRole; }
        }
        public string IndexName
        {
            get { return mIndexName; }
        }
        public string DisplayName
        {
            get { return mDisplayName; }
        }
        public string LayoutClass
        {
            get { return mLayoutClass; }
        }
        #endregion

        #region Constructor
        public CatalogPage()
        {
            mProducts = new List<CatalogProduct>();
        }
        #endregion

        #region Methods
        public void Serialize(ServerMessage message)
        {
            // Append general info
            message.Append("i:");
            message.AppendString(this.mIndexName, 13);
            message.Append("n:");
            message.AppendString(this.mDisplayName, 13);
            message.Append("l:");
            message.AppendString(this.mLayoutClass, 13);

            //Append headline if exist
            if (mHeadlineImage != "")
            {
                message.Append("g:");
                message.AppendString(this.mHeadlineImage, 13);
            }

            //Append images if exists
            if (mTeaserImages != "")
            {
                message.Append("e:");
                message.AppendString(this.mTeaserImages, 13);
            }

            //Append description text if exist
            if (mText != "")
            {
                message.Append("h:");
                message.AppendString(this.mText, 13);
            }

            //Append "more details" text if exist
            if (mMoreDetails != "")
            {
                message.Append("w:");
                message.AppendString(this.mMoreDetails, 13);
            }

            //Append extra data if exist
            if (mExtraData != "")
            {
                message.AppendString(this.mExtraData, 13);
            }

            foreach (CatalogProduct product in mProducts)
                message.AppendObject(product);
        }

        public static CatalogPage Parse(DataRow row, DataTable table)
        {
            try
            {
                CatalogPage page = new CatalogPage();
                page.mID = (uint)row["id"];
                page.mMinRole = Convert.ToByte(row["minrole"]);
                page.mIndexName = (string)row["name_index"];
                page.mDisplayName = (string)row["name_display"];

                page.mLayoutClass = (string)row["layout_class"];
                page.mHeadlineImage = (string)row["layout_headline"];
                page.mTeaserImages = (string)row["layout_images"];
                page.mText = (string)row["layout_description"];
                page.mMoreDetails = (string)row["layout_description_side"];
                page.mExtraData = (string)row["layout_extra"];

                foreach (DataRow product in table.Rows)
                {
                    page.mProducts.Add(CatalogProduct.Parse(product));
                }

                return page;
            }
            catch (Exception ex)
            {
                IonEnvironment.GetLog().WriteUnhandledExceptionError("CatalogPage.Parse", ex);
            }

            return null;
        }
        #endregion
    }
}
