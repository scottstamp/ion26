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
                int productcount = 0;
                using (DatabaseClient dbClient = IonEnvironment.GetDatabase().GetClient())
                {
                    // Load pages
                    DataTable table = dbClient.ReadDataTable("SELECT * FROM catalog_pages ORDER BY orderid ASC;");
                    foreach (DataRow row in table.Rows)
                    {
                        dbClient.AddParamWithValue("@id", row["id"]);
                        DataTable furnitures = dbClient.ReadDataTable("SELECT * FROM catalog_products WHERE pageid = @id");
                        CatalogPage page = CatalogPage.Parse(row, furnitures);

                        if (page != null)
                        {
                            // Add page
                            mPages.Add(page);
                            productcount = +furnitures.Rows.Count;
                        }
                    }
                    IonEnvironment.GetLog().WriteInformation("Loaded " + table.Rows.Count + " catalog pages, and " + productcount + " catalog products");
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

        public CatalogPage GetPage(string pageName, byte Role)
        {
            foreach (CatalogPage page in mPages)
            {
                if (page.IndexName == pageName && page.MinRole <= Role)
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

        public List<CatalogPage> GetPages(byte Role)
        {
            List<CatalogPage> pages = new List<CatalogPage>();
            foreach (CatalogPage page in mPages)
                if (page.MinRole <= Role)
                    pages.Add(page);
            return pages;
        }
        public List<CatalogProduct> GetProducts()
        {
            return mProducts;
        }
        #endregion
    }
}
