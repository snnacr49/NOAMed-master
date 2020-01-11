using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ColorDefines
/// </summary>
public static class ColorDefines
{

    public static Color ReturnColor(string ColorID)
    {
        switch (ColorID)
        {
            case "1":
                return Color.Black;
            case "2":
                return Color.Silver;
            case "3":
                return Color.Gainsboro;
            case "4":
                return Color.White;
            case "5":
                return Color.Maroon;
            case "6":
                return Color.PaleVioletRed;
            case "7":
                return Color.Purple;
            case "8":
                return Color.Fuchsia;
            case "9":
                return Color.Lime;
            case "10":
                return Color.Lime;
            case "11":
                return Color.Goldenrod;
            case "12":
                return Color.Navy;
            case "13":
                return Color.Blue;
            case "14":
                return Color.Azure;
            case "15":
                return Color.Teal;
            case "16":
                return Color.Aqua;
            case "18":
                return Color.Yellow;
            case "17":
                return Color.FromArgb(0xFF, 0xFF, 0x99);
            case "19":
                return Color.LawnGreen;
            case "20":
                return Color.FromArgb(0xB8, 0xCF, 0x6D);

            default:
                return Color.White;
        }
    }

}