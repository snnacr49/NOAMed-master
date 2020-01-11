using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddSlider : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["ID"]) && !Page.IsPostBack)
        {
            LoadDetail();
        }
    }

    private void LoadDetail()
    {
        var videoID = Int32.Parse(Request.QueryString["ID"]);

        var info = new DataProcessNoa.Data.NOAEntities().Slider.Find(videoID);

        if (info !=null)
        {
            txtTitle.Text = info.Title;
            txtcontent.Text = info.Content;
            txtkeyword.Text = info.Keyword;
            lblImage.Text = info.URL;


        }
    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter.Contains("Save"))
        {

            Slider blog = new Slider();
            var ent = new DataProcessNoa.Data.NOAEntities();
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                int ID = Int32.Parse(Request.QueryString["ID"]);
                blog = ent.Slider.Find(ID);
            }

            blog.Title = txtTitle.Text;
            if(e.Parameter.Split(':').Length>1)
                if(!string.IsNullOrEmpty(e.Parameter.Split(':')[1]))
            blog.URL = "/"+e.Parameter.Split(':')[1].Replace("\\","/").Replace("~/","");
            blog.URL = blog.URL.Replace("//", "/");
            blog.InsertDate = DateTime.Now;
            blog.InsertUserID = (Session["User"] as Users).ID;
            blog.IsActive = true;

            blog.Content = txtcontent.Text;
            blog.Keyword = txtkeyword.Text;


            ent.Slider.AddOrUpdate(blog);
            ent.SaveChanges();

            pnlBack.JSProperties["cpOK"] = "OK";
            lblSonuc.Text = "Insert successfull";
        }
    }

    protected void Upload_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
    {
        e.CallbackData = String.Format("Images\\Blog\\Picture{0}.jpg", DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss"));
        string path = Page.MapPath("~/") + e.CallbackData;
        e.UploadedFile.SaveAs(path);
      
    }
}