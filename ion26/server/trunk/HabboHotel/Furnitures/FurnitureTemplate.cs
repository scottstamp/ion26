using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Ion.HabboHotel.Furnitures
{
   public struct FurnitureTemplate
   {
       #region Fields
       private uint mID;
       private string mSprite;
       private byte mType;

       private string mName;
       private string mDescription;
       private string mColor;

       private ushort mLength;
       private ushort mWidth;
       private ushort mHeigth;

       private bool mTradeable;
       private bool mRecycleable;
       #endregion

       #region Properties
       public uint ID
       {
           get { return mID; }
       }
       public string Sprite
       {
           get { return mSprite; }
       }
       public byte Type
       {
           get { return mType; }
       }
       public string Name
       {
           get { return mName; }
       }
       public string Description
       {
           get { return mDescription; }
       }
       public string Color
       {
           get { return mColor; }
       }
       public ushort Length
       {
           get { return mLength; }
       }
       public ushort Width
       {
           get { return mWidth; }
       }
       public ushort Heigth
       {
           get { return mHeigth; }
       }
       public bool Tradeable
       {
           get { return mTradeable; }
       }
       public bool Recycleable
       {
           get { return mRecycleable; }
       }
       #endregion

       #region Methods
       public static FurnitureTemplate Parse(DataRow row)
       {
           FurnitureTemplate template = new FurnitureTemplate();

           template.mID = (uint)row["id"];
           template.mSprite = (string)row["sprite"];
           template.mType = Convert.ToByte(row["type"]);

           template.mName = (string)row["name"];
           template.mDescription = (string)row["description"];
           template.mColor = (string)row["color"];

           template.mLength = Convert.ToUInt16(row["length"]);
           template.mWidth = Convert.ToUInt16(row["width"]);
           template.mHeigth = Convert.ToUInt16(row["heigth"]);

           template.mTradeable = (row["tradeable"].ToString() == "1");
           template.mRecycleable = (row["recycleable"].ToString() == "1");

           return template;
       }
       #endregion
   }
}
