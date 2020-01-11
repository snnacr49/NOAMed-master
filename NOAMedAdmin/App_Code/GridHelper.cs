using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GridHelper
/// </summary>
public class GridHelper
{
    public static void SetColorByColun(DevExpress.Web.ASPxGridView gridview)
    {
        foreach (DevExpress.Web.GridViewColumn item in gridview.Columns.Grid.AllColumns)
        {
            if (item.Caption == "Color")
            {
                gridview.HtmlRowPrepared += new DevExpress.Web.ASPxGridViewTableRowEventHandler(gridView_RowStyleByColumn);
            }
        }
    }

    private static void gridView_RowStyleByColumn(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
    {
        if (e.GetValue("Color")!= null)
        {
            e.Row.BackColor = ColorDefines.ReturnColor(e.GetValue("Color").ToString());
        }
    }
}