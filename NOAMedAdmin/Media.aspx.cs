using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Media : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }

    private void LoadData()
    {

        var list = new DataProcessNoa.Data.NOAEntities().Social.FirstOrDefault();

        txtface.Text = list.Facebook;
        txtInsta.Text = list.Instagram;
        txttwitter.Text = list.Twitter;
        txtyoutube.Text = list.Youtube;
        

        
    }
    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter=="Refresh")
        {
            LoadData();
        }
        else if (e.Parameter.Contains("Save"))
        {
          
          
            var ent = new DataProcessNoa.Data.NOAEntities();
            var user = ent.Social.Find(1);

            user.Facebook = txtface.Text;
            user.Instagram = txtInsta.Text;
            user.Twitter = txttwitter.Text;
            user.Youtube = txtyoutube.Text;

            ent.Social.AddOrUpdate(user);
            ent.SaveChanges();

            LoadData();
        }
    }
}