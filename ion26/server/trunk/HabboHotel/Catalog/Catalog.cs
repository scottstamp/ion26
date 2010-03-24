using System;
using System.Data;
using System.Collections.Generic;

using Ion.Storage;

namespace Ion.HabboHotel.Catalog
{
    public class Catalog
    {
        #region Fields
        private List<CatalogPage> mPages;
        private List<CatalogProduct> mProducts;
        #endregion

        #region Constructors
        public Catalog()
        {
            mPages = new List<CatalogPage>();
            mProducts = new List<CatalogProduct>();
        }
        #endregion

        #region Methods
        public void ReloadPages()
        {
            lock (this)
            {
                mPages.Clear();

                using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
                {
                    // Load pages
                    foreach (DataRow row in dbClient.ReadDataTable("SELECT * FROM catalog_pages ORDER BY orderid ASC;").Rows)
                    {
                        dbClient.AddParamWithValue("@id", row["id"]);
                        DataTable furnitures = dbClient.ReadDataTable("SELECT * FROM catalog_products WHERE pageid = @id");
                        CatalogPage page = CatalogPage.Parse(row, furnitures);

                        if (page != null)
                        {
                            // Add page
                            mPages.Add(page);
                        }
                    }
                }
            }
        }

        public void ReloadProducts()
        {
            lock (this)
            {
                mProducts.Clear();
            }
        }

        public CatalogPage GetPage(string pageName)
        {
            foreach (CatalogPage page in mPages)
            {
                if (page.IndexName == pageName)
                {
                    return page;
                }
            }

            return null;
        }
        public CatalogProduct GetProduct(uint productID)
        {
            foreach (CatalogProduct product in mProducts)
            {

            }

            return null;
        }
        public List<CatalogProduct> GetProducts(uint pageID)
        {
            List<CatalogProduct> products = new List<CatalogProduct>();
            foreach (CatalogProduct product in mProducts)
            {
                if (false)
                {
                    products.Add(product);
                }
            }

            return products;
        }

        public List<CatalogPage> GetPages()
        {
            return mPages;
        }
        public List<CatalogProduct> GetProducts()
        {
            return mProducts;
        }
        #endregion
    }
}
