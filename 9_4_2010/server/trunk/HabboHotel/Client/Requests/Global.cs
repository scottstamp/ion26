using System;

namespace Ion.HabboHotel.Client
{
    public partial class ClientMessageHandler
    {
        /// <summary>
        /// 196 - "CD"
        /// </summary>
        private void Pong()
        {
            mSession.PingOK = true;
        }
        /// <summary>
        /// 315 - "D{" - "TEST_LATENCY"
        /// </summary>
        private void LatencyTest()
        {
            uint num = Request.PopWiredUInt32();
            Response.Initialize(354); // "Eb": [[#login_handler, #handleLatencyTest]]
            Response.AppendUInt32(num);
            SendResponse();
        }

        /// <summary>
        /// Registers request handlers available from start of client.
        /// </summary>
        public void RegisterGlobal()
        {
            mRequestHandlers[196] = new RequestHandler(Pong);
            mRequestHandlers[315] = new RequestHandler(LatencyTest);
        }
    }
}
