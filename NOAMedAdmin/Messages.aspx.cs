using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Messages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }

    private void LoadData()
    {
        GridHelper.SetColorByColun(grid);
        var list = new DataProcessNoa.Data.NOAEntities().ContactForm.OrderByDescending(u=>u.ID).ToList();
        grid.DataSource = list;
        grid.DataBind();

        
    }
    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter=="Refresh")
        {
            LoadData();
        }
        else if (e.Parameter.Contains("Remove"))
        {
          
            
        }
    }
}