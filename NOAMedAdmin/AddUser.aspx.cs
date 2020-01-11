using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter=="Save")
        {
            if (string.IsNullOrEmpty(txtUserName.Text) || string.IsNullOrEmpty(txtPassword.Text) || string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtSurname.Text))
            {
                lblSonuc.Text = "Please fill all controls";
                return;
            }

            if (txtPassword.Text.Contains(" ") || txtUserName.Text.Contains(" "))
            {
                lblSonuc.Text = "Please check user name and password";
                return;
            }

            Users user = new Users();
            var ent = new DataProcessNoa.Data.NOAEntities();

            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                int userID = Int32.Parse(Request.QueryString["ID"]);
                user = ent.Users.Find(userID);
            }

            if (string.IsNullOrEmpty(Request.QueryString["ID"]) && ent.Users.Where(u=>u.Username==txtUserName.Text).FirstOrDefault() !=null)
            {
                lblSonuc.Text = "Please check user name.";
                return;
            }


            user.FirstName = txtName.Text;
            user.LastName = txtSurname.Text;
            user.FullName = txtName.Text + " " + txtSurname.Text;
            user.StatusID = 1;
            user.Username = txtUserName.Text;
            user.Password = txtPassword.Text;

            ent.Users.AddOrUpdate(user);
            ent.SaveChanges();

            lblSonuc.Text = "Insert is successfull";
            pnlBack.JSProperties["cpOK"] = "OK";

            
        }
    }
}