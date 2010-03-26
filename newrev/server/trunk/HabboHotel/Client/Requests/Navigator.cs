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
            List<NavigatorRoom> rooms = IonEnvironment.GetHabboHotel().GetNavigator().getRooms(category.ID);

            // Append count of rooms if the category type is 2 (guestrooms)
            if (category.Type == 2)
                Response.AppendInt32(rooms.Count);

            foreach (NavigatorRoom room in rooms)
            {
                if(!(room.Visitors >= room.MaxVisitors && hideFull))
                Response.AppendObject(room);
            }

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
        /// 182 - "Bv" - "GETINTERST"
        /// </summary>
        private void GetAdvertisement()
        {
            // TODO: Load and send advertisement
            Response.Initialize(258); // "DB": [[#room_handler, #handle_interstitialdata]]
            Response.Append(0); // Not vl64 encoded
            SendResponse();
        }
        /// <summary>
        /// 2 - "@B" - "#room_directory"
        /// </summary>
        private void RoomDirectory()
        {
            uint roomID = Request.PopWireduint();
            Room room = IonEnvironment.GetHabboHotel().GetNavigator().getRoom(roomID);

            Response.Initialize(19); // "@S": [[#room_handler, #handle_opc_ok]]
            SendResponse();

            Response.Initialize(166); // "Bf": [[#statsBrokerJs, #handle_update_stats]]
            Response.Append("http://ion26.com/");
            SendResponse();

            Response.Initialize(69); // "AE": [[#room_handler, #handle_room_ready]]
            //Response.AppendString(room.Model, 32); // 32 = Space
            Response.Append(room.Model + " ");
            Response.Append(room.ID); // Not vl64 encoded
            SendResponse();
        }

        /// <summary>
        /// Registers request handlers that process room Navigator queries etc.
        /// </summary>
        public void RegisterNavigator()
        {
            mRequestHandlers[150] = new RequestHandler(NavigateRooms);
            mRequestHandlers[182] = new RequestHandler(GetAdvertisement);
            mRequestHandlers[2] = new RequestHandler(RoomDirectory);
        }
    }
}
