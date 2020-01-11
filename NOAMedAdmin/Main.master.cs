using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainMaster : System.Web.UI.MasterPage
{
    public Users activeuser = null;
    protected void Page_Load(object sender, EventArgs e)
    {

		try
		{
            if (!Page.IsPostBack && Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            else
            {
                activeuser = Session["User"] as Users;
                if (activeuser.StatusID != 1)
                {
                    Response.Redirect("~/Login.aspx");
                    return;
                }
            }
        }
		catch (Exception)
		{

			;
		}
       
    }
}