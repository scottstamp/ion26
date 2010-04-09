using System;
using System.Collections.Generic;
using Ion.HabboHotel.Rooms;
using Ion.HabboHotel.Navigator;
using Ion.HabboHotel.Habbos;

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
            //sec let me crap my emu:p
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
                Response.AppendUInt32(IonEnvironment.GetHabboHotel().GetNavigator().getVisitors(cat.ID));
                Response.AppendUInt32(IonEnvironment.GetHabboHotel().GetNavigator().getMaxVisitors(cat.ID));
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
        /// 151 - "BW" - "GETUSERFLATCATS"
        /// </summary>
        private void GetUserflatCats()
        {
            // Get categories
            List<NavigatorCategory> categories = IonEnvironment.GetHabboHotel().GetNavigator().getSubCategories(4);

            // Build response
            Response.Initialize(221); // "C]": [[#navigator_handler, #handle_userflatcats]]
            Response.AppendInt32(categories.Count);

            foreach (NavigatorCategory category in categories)
            {
                if (category.MinCreateRole > mSession.GetHabbo().Role)
                    continue;
                Response.AppendUInt32(category.ID);
                Response.AppendString(category.Name);
            }

            // Send response
            SendResponse();
        }
        /// <summary>
        /// 2 - "@B" - "#room_directory"
        /// </summary>
        private void RoomDirectory()
        {
            bool PublicRoom = Request.PopBase64Boolean();
            uint roomID = Request.PopWiredUInt32();
            mSession.GetHabbo().RoomID = roomID;
            Room room = IonEnvironment.GetHabboHotel().GetNavigator().getRoom(roomID);

            Response.Initialize(19); // "@S": [[#room_handler, #handle_opc_ok]]
            SendResponse();

            Response.Initialize(166); // "Bf": [[#statsBrokerJs, #handle_update_stats]]
            Response.Append("about:blank");
            SendResponse();

            if (room.PublicRoom)
            {
                Response.Initialize(69); // "AE": [[#room_handler, #handle_room_ready]]
                Response.AppendString(room.Model.Name, 32); // 32 = Space
                Response.Append(room.ID); // Not vl64 encoded
                SendResponse();
            }
        }
        /// <summary>
        /// 264 - "DH" - "GET_RECOMMENDED_ROOMS"
        /// </summary>
        private void GetRecommendedRooms()
        {
            int count = 0;
            Response.Initialize(351); // "E_": [[#navigator_handler, #handle_recommended_room_list]]
            List<NavigatorRoom> recRooms = IonEnvironment.GetHabboHotel().GetNavigator().getRecommendedRooms();
            //Response.AppendInt32(recRooms.Count);
            foreach (NavigatorRoom room in recRooms)
            {
                if (count > 3)
                    break;
                count++;
                Response.AppendUInt32(room.ID);
                Response.AppendString(room.Name);
                Response.AppendString(room.OwnerName);
                Response.AppendString(room.AccessType);
                Response.AppendUInt32(room.Visitors);
                Response.AppendUInt32(room.MaxVisitors);
                Response.AppendString(room.Description);
            }
            SendResponse();
        }
        /// <summary>
        /// 21 - "@U" - "GETFLATINFO"
        /// </summary>
        private void GetFlatInfo()
        {
            uint roomID = uint.Parse(Request.GetContentString());
            mSession.GetHabbo().RoomID = roomID;
            NavigatorRoom Room = IonEnvironment.GetHabboHotel().GetNavigator().getNavigatorRoom(roomID);
            Response.Initialize(54); // "@v": [[#navigator_handler, #handle_flatinfo]]
            Response.AppendUInt32(0); // TODO: What is this???
            Response.AppendUInt32((uint)Room.AccessType);
            Response.AppendUInt32(Room.ID);
            Response.AppendString(Room.OwnerName);
            Response.AppendString("model_" + Room.Model);
            Response.AppendString(Room.Name);
            Response.AppendString(Room.Description);
            Response.AppendBoolean(true); // TODO: Show name
            Response.AppendBoolean(IonEnvironment.GetHabboHotel().GetNavigator().getCategory(Room.Category).AllowTrading);
            Response.AppendUInt32(Room.Visitors);
            Response.AppendUInt32(Room.MaxVisitors);
            SendResponse();
        }
        /// <summary>
        /// 57 - "@y" - "TRYFLAT"
        /// </summary>
        private void TryFlat()
        {
            uint roomID = uint.Parse(Request.GetContentString());
            Response.Initialize(41); // "@i": [[#room_handler, #handle_flat_letin]]
            SendResponse();
        }
        /// <summary>
        /// 59 - "@{" - "GOTOFLAT"
        /// </summary>
        private void GotoFlat()
        {
            uint roomID = uint.Parse(Request.GetContentString());
            mSession.GetHabbo().RoomID = roomID;

            // Load the room
            if (!IonEnvironment.GetHabboHotel().GetRooms().containsRoom(mSession.GetHabbo().RoomID))
                IonEnvironment.GetHabboHotel().GetRooms().addRoom(mSession.GetHabbo().RoomID);

            mSession.GetHabbo().Room = IonEnvironment.GetHabboHotel().GetRooms().getRoom(mSession.GetHabbo().RoomID);
            Room Room = mSession.GetHabbo().Room;

            Response.Initialize(69); // "AE": [[#room_handler, #handle_room_ready]]
            Response.Append("model_");
            Response.AppendString(Room.Model.Name, 32); // 32 = space
            Response.Append(Room.ID);
            SendResponse();

            Response.Initialize(46); // "@n": [[#room_handler, #handle_flatproperty]]
            Response.Append("landscape/");
            Response.Append(Room.Landscape);
            SendResponse();

            Response.Initialize(46); // "@n": [[#room_handler, #handle_flatproperty]]
            Response.Append("wallpaper/");
            Response.Append(Room.Wallpaper);
            SendResponse();

            Response.Initialize(46); // "@n": [[#room_handler, #handle_flatproperty]]
            Response.Append("floor/");
            Response.Append(Room.Floor);
            SendResponse();

            if ((Room.OwnerID == mSession.GetHabbo().ID && Room.OwnerName == mSession.GetHabbo().Username) || IonEnvironment.GetHabboHotel().GetUserRights().RoleHasRight(mSession.GetHabbo().Role, "fuse_any_room_controller"))
            {
                Response.Initialize(47); // "@o": [[#room_handler, #handle_room_rights]]
                SendResponse();
            }
            if ((Room.OwnerID == mSession.GetHabbo().ID && Room.OwnerName == mSession.GetHabbo().Username) || IonEnvironment.GetHabboHotel().GetUserRights().RoleHasRight(mSession.GetHabbo().Role, "fuse_pick_up_any_furni")) // TODO: Check if user has rights
            {
                Response.Initialize(42); // "@j": [[#room_handler, #handle_room_rights]]
                SendResponse();
            }

            Response.Initialize(345); // "EY": [[#room_handler, #handle_room_rating]]
            SendResponse();

            Response.Initialize(370); // "Er": [[#room_handler, #handle_roomevent_info]]
            Response.Append(-1); // TODO: Event info
            SendResponse();
        }
        /// <summary>
        /// 126 - "A~" - "GETROOMAD"
        /// </summary>
        private void GetRoomAd()
        {
            Response.Initialize(208); // "CP": [[#room_handler, #handle_roomad]]
            Response.Append(0); // TODO: Room ads
            SendResponse();
        }
        /// <summary>
        /// 60 - "@|" - "G_HMAP"
        /// </summary>
        private void GetHeightmap()
        {
            //sendData("@_" + Room.Heightmap);
            ////Out.WriteLine(Room.Heightmap.Replace("\r", " "));
            //sendData(@"@\" + Room.dynamicUnits);

            Response.Initialize(31); // "@_": [[#room_handler, #handle_heightmap]
            try
            {
                Response.Append(mSession.GetHabbo().Room.Model.Heightmap);
            }
            catch { }
            SendResponse();
        }
        /// <summary>
        /// 61 - "@}" - "G_USRS"
        /// </summary>
        private void GetUsers()
        {
            Response.Initialize(28); // "@\": [[#room_handler, #handle_users]]
            foreach(Habbo habbo in mSession.GetHabbo().Room.GetHabbos())
                Response.Append(habbo.RoomString());
            SendResponse();
        }
        /// <summary>
        /// 62 - "@~" - "G_OBJS"
        /// </summary>
        private void GetObjects()
        {
            //sendData("@^" + Room.PublicroomItems);
            //sendData("@`" + Room.Flooritems);
            Response.Initialize(30); // "@^": [[#room_handler, #handle_OBJECTS]]
            SendResponse(); // TODO: Publicroom items

            Response.Initialize(32); // "@`": [[#room_handler, #handle_activeobjects]]
            Response.AppendInt32(0); // TODO: Floor items
            SendResponse();
        }
        /// <summary>
        /// 63 - "@" - "G_ITEMS"
        /// </summary>
        private void GetItems()
        {
            //sendData("@m" + Room.Wallitems);
            Response.Initialize(45); // "@m": [[#room_handler, #handle_items]]
            SendResponse(); // TODO: Wall items
        }
        /// <summary>
        /// 64 - "A@" - "G_STAT
        /// </summary>
        private void GetStat()
        {
            mSession.GetHabbo().Room.AddHabbo(mSession.GetHabbo());
        }

        /// <summary>
        /// Registers request handlers that process room Navigator queries etc.
        /// </summary>
        public void RegisterNavigator()
        {
            mRequestHandlers[150] = new RequestHandler(NavigateRooms);
            mRequestHandlers[151] = new RequestHandler(GetUserflatCats);
            mRequestHandlers[182] = new RequestHandler(GetAdvertisement);
            mRequestHandlers[2] = new RequestHandler(RoomDirectory);
            mRequestHandlers[264] = new RequestHandler(GetRecommendedRooms);
            mRequestHandlers[21] = new RequestHandler(GetFlatInfo);
            mRequestHandlers[57] = new RequestHandler(TryFlat);
            mRequestHandlers[59] = new RequestHandler(GotoFlat);
            mRequestHandlers[126] = new RequestHandler(GetRoomAd);
            mRequestHandlers[60] = new RequestHandler(GetHeightmap);
            mRequestHandlers[61] = new RequestHandler(GetUsers);
            mRequestHandlers[62] = new RequestHandler(GetObjects);
            mRequestHandlers[63] = new RequestHandler(GetItems);
            mRequestHandlers[64] = new RequestHandler(GetStat);
        }
    }
}
