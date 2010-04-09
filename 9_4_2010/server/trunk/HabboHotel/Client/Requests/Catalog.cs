using System;
using System.Collections.Generic;

using Ion.HabboHotel.Catalog;

namespace Ion.HabboHotel.Client
{
    public partial class ClientMessageHandler
    {
        /// <summary>
        /// 101 - "Ae"
        /// </summary>
        private void GetCatalogIndex()
        {
            Response.Initialize(ResponseOpcodes.CatalogIndex); // "A~": [[#catalogue_handler, #handle_catalogindex]]

            // Add all visible pages to the index response
            List<CatalogPage> pages = IonEnvironment.GetHabboHotel().GetCatalog().GetPages(mSession.GetHabbo().Role);
            // listBuilder.Append(pageNames[i] + Convert.ToChar(9) + ((cataloguePage)cataloguePages[pageNames[i]]).displayName + Convert.ToChar(13));
            foreach (CatalogPage page in pages)
            {
                Response.AppendString(page.IndexName, 9);
                Response.AppendString(page.DisplayName, 13);
            }

            SendResponse();
        }

        /// <summary>
        /// 102 = "Af"
        /// </summary>
        private void GetCatalogPage()
        {
            string pageName = Request.GetContentString().Split('/')[1];

            Response.Initialize(ResponseOpcodes.CatalogPage); // "A": [[#catalogue_handler, #handle_catalogpage]]
            //                pageBuilder.Append("i:" + pageIndexName + Convert.ToChar(13) + "n:" + pageData[2] + Convert.ToChar(13) + "l:" + pageData[3] + Convert.ToChar(13));
            CatalogPage page = IonEnvironment.GetHabboHotel().GetCatalog().GetPage(pageName, mSession.GetHabbo().Role);
            if (page != null)
            {
                Response.AppendObject(page);
            }
            SendResponse();
        }

        /// <summary>
        /// Registers handlers that have to do with the ingame Catalog.
        /// </summary>
        public void RegisterCatalog()
        {
            mRequestHandlers[101] = new RequestHandler(GetCatalogIndex);
            mRequestHandlers[102] = new RequestHandler(GetCatalogPage);
        }
    }
}
