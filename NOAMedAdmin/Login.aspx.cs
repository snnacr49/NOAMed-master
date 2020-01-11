using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter=="Login")
        {
            try
            {
                if (string.IsNullOrEmpty(txtPass.Text) || string.IsNullOrEmpty(txtUsername.Text))
                {
                    lblSonuc.Text = "Please fill user name and pass";
                    return;
                }

                if (captcha.IsValid==false)
                {
                    lblSonuc.Text = "please check captcha";
                    return;
                }


                var ent = new DataProcessNoa.Data.NOAEntities();

                var userinfo = ent.Users.Where(u => u.Username == txtUsername.Text && u.Password == txtPass.Text && u.StatusID == 1).FirstOrDefault();

                if (userinfo==null)
                {
                    lblSonuc.Text = "User not found";
                    return;
                }

                if (Session["User"]==null)
                {
                    Session["User"] = userinfo;
                }
                else
                {
                    Session.Add("User", userinfo);
                }

                ASPxWebControl.RedirectOnCallback("Default.aspx");
            }
            catch (Exception)
            {

                lblSonuc.Text = "Please write renew";
            }
        }
    }
}