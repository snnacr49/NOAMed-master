using DataProcessNoa.Data;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var ent = new DataProcessNoa.Data.NOAEntities();
            var list = ent.Page.Where(u => u.IsActive == true).ToList();

            comboparnt.DataSource = list;
            comboparnt.ValueField = "ID";
            comboparnt.TextField = "Name";

            comboparnt.DataBind();
        }
        if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
        {
            LoadDetail();
        }
    }

    private void LoadDetail()
    {
        var videoID = Int32.Parse(Request.QueryString["ID"]);

        var info = new DataProcessNoa.Data.NOAEntities().Page.Find(videoID);

        if (info !=null)
        {
            if (info.ParentID >0)
            {
                comboparnt.Value = info.ParentID.ToString();
            }

            txtname.Text = info.Name;
            htmlcontent.Html = info.Content;
        }
    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter.Contains("Save"))
        {
            if (string.IsNullOrEmpty(txtname.Text) || string.IsNullOrEmpty(htmlcontent.Html))
            {
                lblSonuc.Text = "Please fill all controls";
                return;
            }
            
            var ent = new DataProcessNoa.Data.NOAEntities();

            var video = new DataProcessNoa.Data.Page();
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                int ID = Int32.Parse(Request.QueryString["ID"]);

                video = ent.Page.Find(ID);
            }

            if (comboparnt.SelectedIndex>=0)
            {
                video.ParentID = Int32.Parse(comboparnt.Value.ToString());
            }

            video.Name = txtname.Text;
            video.Content = htmlcontent.Html;
            video.IsActive = true;

            video.InsertDate = DateTime.Now;
            video.InsertUserID = (Session["User"] as Users).ID;

            video.TotalName = comboparnt.SelectedIndex <= -1 ? (txtname.Text) : (comboparnt.Text + ">" + txtname.Text);

            video.PageUrl = "";


            ent.Page.AddOrUpdate(video);
            ent.SaveChanges();


            lblSonuc.Text = "Insert is successfull";
            pnlBack.JSProperties["cpOK"] = "OK";


        }
    }

 
    }
}