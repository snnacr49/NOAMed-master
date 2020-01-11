using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter=="Save")
        {
            if (string.IsNullOrEmpty(txtShopName.Text) || string.IsNullOrEmpty(txtPhoneNo.Text) || string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtSurname.Text))
            {
                lblSonuc.Text = "Please fill all controls";
                return;
            }

         

           DataProcessNoa.Data.Customer user = new DataProcessNoa.Data.Customer();
            var ent = new DataProcessNoa.Data.NOAEntities();

            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                int userID = Int32.Parse(Request.QueryString["ID"]);
                user = ent.Customer.Find(userID);
            }

            user.Name = txtName.Text;
            user.Surname = txtSurname.Text;
            user.ShopName = txtShopName.Text;
            user.IsActive = true;
            user.PhoneNo = txtPhoneNo.Text;
            user.AddressInfo = txtAddress.Text;
            user.InsertUserName = (Session["User"] as Users).Username;
            user.InsertTime = DateTime.Now;


            ent.Customer.AddOrUpdate(user);
            ent.SaveChanges();

            if (string.IsNullOrEmpty(Request.QueryString["ID"]) && user.ID>0)
            {
                CustomerVoucher voucher = new CustomerVoucher();
                voucher.CustomerID = user.ID;
                voucher.TotalIn = 0;
                voucher.TotalOut = 0;
                voucher.NetTotal = 0;

                ent.CustomerVoucher.Add(voucher);
                ent.SaveChanges();
            }

            lblSonuc.Text = "Insert is successfull";
            pnlBack.JSProperties["cpOK"] = "OK";

            
        }
    }
}