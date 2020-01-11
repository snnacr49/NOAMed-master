using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddQuestion : System.Web.UI.Page
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

        var info = new DataProcessNoa.Data.NOAEntities().Question.Find(videoID);

        if (info !=null)
        {
            txtQuestion.Text = info.Ques;
            txtAnswer.Text = info.Answer;
        }
    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter == "Save")
        {
            if (string.IsNullOrEmpty(txtAnswer.Text) || string.IsNullOrEmpty(txtQuestion.Text))
            {
                lblSonuc.Text = "Please fill all controls";
                return;
            }
            
            var ent = new DataProcessNoa.Data.NOAEntities();

            var video = new Question();
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                int ID = Int32.Parse(Request.QueryString["ID"]);

                video = ent.Question.Find(ID);
            }

            video.Ques = txtQuestion.Text;
            video.Answer = txtAnswer.Text;
            video.IsActive = true;
            video.InsertDate = DateTime.Now;
            video.InsertUserID = (Session["User"] as Users).ID;

            ent.Question.AddOrUpdate(video);
            ent.SaveChanges();


            lblSonuc.Text = "Insert is successfull";
            pnlBack.JSProperties["cpOK"] = "OK";


        }
    }
}