using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Question : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }

    private void LoadData()
    {
        var list = new DataProcessNoa.Data.NOAEntities().Question.Where(u=>u.IsActive==true).OrderByDescending(u=>u.ID).ToList();
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
            var user = ent.Question.Find(ID);

            user.DeleteDate = DateTime.Now;
            user.DeleteUserID = activeuser.ID;
            user.IsActive = false;


            ent.Question.AddOrUpdate(user);
            ent.SaveChanges();

            LoadData();
        }
    }
}