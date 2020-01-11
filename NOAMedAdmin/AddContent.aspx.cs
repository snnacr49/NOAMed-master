using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
        {
            LoadDetail();
        }
    }

    private void LoadDetail()
    {
        var videoID = Int32.Parse(Request.QueryString["ID"]);

        var info = new DataProcessNoa.Data.NOAEntities().HomeTabPage.Find(videoID);

        if (info !=null)
        {
            txtCategory.Text = info.CategoryName;
            txtname.Text = info.Name;
            txtshortname.Text = info.ShortName;
            htmlshort.Html = info.ShortContent;
            htmlcontent.Html = info.Content;
        }
    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter == "Save")
        {
            if (string.IsNullOrEmpty(txtname.Text) || string.IsNullOrEmpty(txtCategory.Text))
            {
                lblSonuc.Text = "Please fill all controls";
                return;
            }
            
            var ent = new DataProcessNoa.Data.NOAEntities();

            var video = new HomeTabPage();
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                int ID = Int32.Parse(Request.QueryString["ID"]);

                video = ent.HomeTabPage.Find(ID);
            }


            video.ShortName = txtshortname.Text;
            video.Name = txtname.Text;
            video.CategoryName = txtCategory.Text;
            video.ShortContent = htmlshort.Html;
            video.Content = htmlcontent.Html;

            video.InsertDate = DateTime.Now;
            video.InsertUserID = (Session["User"] as Users).ID;

            ent.HomeTabPage.AddOrUpdate(video);
            ent.SaveChanges();


            lblSonuc.Text = "Insert is successfull";
            pnlBack.JSProperties["cpOK"] = "OK";


        }
    }
}