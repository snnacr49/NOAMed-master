using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddVideo : System.Web.UI.Page
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

        var info = new DataProcessNoa.Data.NOAEntities().Video.Find(videoID);

        if (info !=null)
        {
            txtName.Text = info.Name;
            txtUrl.Text = info.VideoUrl;
        }
    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter == "Save")
        {
            if (string.IsNullOrEmpty(txtUrl.Text) || string.IsNullOrEmpty(txtName.Text))
            {
                lblSonuc.Text = "Please fill all controls";
                return;
            }
            
            var ent = new DataProcessNoa.Data.NOAEntities();

            var video = new Video();
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                int ID = Int32.Parse(Request.QueryString["ID"]);

                video = ent.Video.Find(ID);
            }

            video.VideoUrl = txtUrl.Text;
            video.Name = txtName.Text;
            video.IsActive = true;

            ent.Video.AddOrUpdate(video);
            ent.SaveChanges();


            lblSonuc.Text = "Insert is successfull";
            pnlBack.JSProperties["cpOK"] = "OK";


        }
    }
}