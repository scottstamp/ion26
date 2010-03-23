using System;
using System.Collections.Generic;
using Ion.HabboHotel.Rooms;
using Ion.HabboHotel.Navigator;

namespace Ion.HabboHotel.Client
{
    public partial class ClientMessageHandler
    {
        /// <summary>
        /// 150 - "BV"
        /// </summary>
        private void NavigateRooms()
        {
            bool hideFull = Request.PopWiredBoolean(); // Should it hide full rooms?
            uint categoryID = Request.PopWiredUInt32(); // The room category the client navigated to

            // Get the category so we can use its info
            NavigatorCategory category = IonEnvironment.GetHabboHotel().GetNavigator().getCategory(categoryID);

            Response.Initialize(220); // "C\": [[#navigator_handler, #handle_navnodeinfo]]
            Response.AppendBoolean(hideFull);
            Response.AppendUInt32(category.ID);
            Response.AppendUInt32(category.Type);
            Response.AppendString(category.Name);
            Response.AppendInt32(0);
            Response.AppendInt32(10000);
            Response.AppendUInt32(category.ParentID);

            // Append rooms in category
            if(category.Type == 2)
            Response.AppendInt32(0); // TODO: Rooms

            // Append sub-categories
            foreach (NavigatorCategory cat in IonEnvironment.GetHabboHotel().GetNavigator().getSubCategories(category.ID))
            {
                Response.AppendUInt32(cat.ID);
                Response.AppendInt32(0);
                Response.AppendString(cat.Name);
                Response.AppendInt32(1); // TODO: calculate visitors in rooms
                Response.AppendInt32(5); // TODO: calculate max visitors in rooms
                Response.AppendUInt32(category.ID);
            }

            // Send response
            SendResponse();
        }

        /// <summary>
        /// Registers request handlers that process room Navigator queries etc.
        /// </summary>
        public void RegisterNavigator()
        {
            mRequestHandlers[150] = new RequestHandler(NavigateRooms);
        }
    }
}
