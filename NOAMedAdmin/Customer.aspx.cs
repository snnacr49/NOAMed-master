using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }

    private void LoadData()
    {
        GridHelper.SetColorByColun(grid);
        var list = new DataProcessNoa.Data.NOAEntities().SP_GET_CUSTOMER_LIST().ToList();
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
          
            var activeuser = ((MainMaster)this.Master).activeuser;
            var ID =Int32.Parse(e.Parameter.Split(':')[1]);
            var ent = new DataProcessNoa.Data.NOAEntities();
            var user = ent.Customer.Find(ID);

            user.DeleteTime = DateTime.Now;
            user.DeleteUserName = activeuser.Username;
            user.IsActive = !user.IsActive;


            ent.Customer.AddOrUpdate(user);
            ent.SaveChanges();

            LoadData();
        }
    }
}