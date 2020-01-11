using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddBlog : System.Web.UI.Page
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

        var info = new DataProcessNoa.Data.NOAEntities().Blog.Find(videoID);

        if (info !=null)
        {
            txtTitle.Text = info.Title;
            txtShortContent.Text = info.ShortContent;
            htmlcontent.Html = info.Content;
            lblImage.Text = info.DefaultImage;


        }
    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter.Contains("Save"))
        {

            Blog blog = new Blog();
            var ent = new DataProcessNoa.Data.NOAEntities();
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                int ID = Int32.Parse(Request.QueryString["ID"]);
                blog = ent.Blog.Find(ID);
            }

            blog.Title = txtTitle.Text;
            blog.ShortContent = txtShortContent.Text;
            if(e.Parameter.Split(':').Length>1)
                if(!string.IsNullOrEmpty(e.Parameter.Split(':')[1]))
            blog.DefaultImage = "/"+e.Parameter.Split(':')[1].Replace("\\","/");
            blog.InsertDate = DateTime.Now;
            blog.InsertUserID = (Session["User"] as Users).ID;
            blog.IsActive = true;
            blog.Content = htmlcontent.Html;

            ent.Blog.AddOrUpdate(blog);
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