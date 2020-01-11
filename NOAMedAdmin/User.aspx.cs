using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }

    private void LoadData()
    {
        GridHelper.SetColorByColun(grid);
        var list= new DataProcessNoa.Data.NOAEntities().Users.Select(u=>new { ID=u.ID,FirstName=u.FirstName,LastName=u.LastName,Username=u.Username,Color=u.StatusID==1?19:6,StatusID=u.StatusID}).ToList();
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
            var ID =Int32.Parse(e.Parameter.Split(':')[1]);

            var ent = new DataProcessNoa.Data.NOAEntities();
            var user = ent.Users.Find(ID);

            user.StatusID = 0;
            ent.Users.AddOrUpdate(user);
            ent.SaveChanges();

            LoadData();
        }
    }
}