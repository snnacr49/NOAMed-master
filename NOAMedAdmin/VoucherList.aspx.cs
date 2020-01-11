using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VoucherList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadList();
        LoadInfo();
    }

    private void LoadInfo()
    {
        try
        {
            var customerID = Int32.Parse(Request.QueryString["ID"]);

            var ent = new DataProcessNoa.Data.NOAEntities();
            var customer = ent.Customer.Find(customerID);

            var customervoucher = ent.CustomerVoucher.Where(u => u.CustomerID == customerID).FirstOrDefault();

            lblCustomerInfo.Text = customer.ShopName + " " + customer.Name + " " + customer.Surname;

            txtNetTotal.Text = customervoucher.NetTotal.ToString();
            txtTotalIn.Text = customervoucher.TotalIn.ToString();
            txtTotalOut.Text = customervoucher.TotalOut.ToString();

        }
        catch (Exception)
        {

            ;
        }
    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter.Contains("Remove"))
        {
            DataProcessNoa.Data.CustomerVoucherList user = new DataProcessNoa.Data.CustomerVoucherList();
            var ent = new DataProcessNoa.Data.NOAEntities();


            using (var scrop = ent.Database.BeginTransaction())
            {
                try
                {

                    var voucherID = Int32.Parse(e.Parameter.Split(':')[1]);

                    var voucherinfo = ent.CustomerVoucherList.Find(voucherID);

                    if (voucherinfo == null || voucherinfo.IsActive == false || voucherinfo.IsUsed == true)
                    {
                        pnlBack.JSProperties["cpError"] = "This voucher is not active";
                        return;
                    }

                    voucherinfo.IsUsed = false;
                    voucherinfo.DeleteTime = DateTime.Now;
                    voucherinfo.DeleteUserName = (Session["User"] as Users).Username;

                    ent.CustomerVoucherList.AddOrUpdate(voucherinfo);
                    ent.SaveChanges();


                    var customervoucher = ent.CustomerVoucher.Where(u => u.CustomerID == voucherinfo.CustomerID).FirstOrDefault();

                    customervoucher.TotalIn -= 1;
                    customervoucher.NetTotal -= 1;

                    ent.CustomerVoucher.AddOrUpdate(customervoucher);
                    ent.SaveChanges();


                    scrop.Commit();
                }
                catch (Exception ex)
                {
                    scrop.Rollback();
                    pnlBack.JSProperties["cpError"] = "Error, please check";
                    lblSonuc.Text = ex.Message;
                    return;
                }
            }



            LoadList();
            LoadInfo();


            lblSonuc.Text = "Process is successfull";
            pnlBack.JSProperties["cpOK"] = "OK";

        }
        else
        if (e.Parameter.Contains("Approve"))
        {

            DataProcessNoa.Data.CustomerVoucherList user = new DataProcessNoa.Data.CustomerVoucherList();
            var ent = new DataProcessNoa.Data.NOAEntities();

            using (var scope = ent.Database.BeginTransaction())
            {

                try
                {

                    var voucherID = Int32.Parse(e.Parameter.Split(':')[1]);

                    var voucherinfo = ent.CustomerVoucherList.Find(voucherID);

                    if (voucherinfo == null || voucherinfo.IsActive == false || voucherinfo.IsUsed == true)
                    {
                        scope.Rollback();
                        pnlBack.JSProperties["cpError"] = "This voucher is not active";
                        return;
                    }


                    voucherinfo.IsUsed = true;
                    voucherinfo.UsedDatetime = DateTime.Now;
                    voucherinfo.UsedUserName = (Session["User"] as Users).Username;

                    ent.CustomerVoucherList.AddOrUpdate(voucherinfo);
                    ent.SaveChanges();


                    var customervoucher = ent.CustomerVoucher.Where(u => u.CustomerID == voucherinfo.CustomerID).FirstOrDefault();

                    customervoucher.TotalOut += 1;
                    customervoucher.NetTotal -= 1;

                    ent.CustomerVoucher.AddOrUpdate(customervoucher);
                    ent.SaveChanges();

                    scope.Commit();

                }
                catch (Exception ex)
                {
                    scope.Rollback();
                    lblSonuc.Text=ex.Message;
                    return;
                }
            }

            LoadList();
            LoadInfo();
            

            lblSonuc.Text = "Process is successfull";
            pnlBack.JSProperties["cpOK"] = "OK";


        }
    }

    private void LoadList()
    {
        int CustomerID = Int32.Parse(Request.QueryString["ID"]);
        GridHelper.SetColorByColun(grid);
        grid.DataSource = new DataProcessNoa.Data.NOAEntities().CustomerVoucherList.Where(u => u.CustomerID == CustomerID).Select(u=>new { 
        
        u.ID,
        u.VoucherNo,
        u.IsActive,
        u.InsertTime,
        u.InsertUserName,
        u.DeleteTime,
        u.DeleteUserName,
        u.IsUsed,
        u.UsedDatetime,
        u.UsedUserName,
        Color=(u.IsUsed==true?19:(u.DeleteTime !=null ?6:4))
        }).ToList();
        grid.DataBind();
    }
}