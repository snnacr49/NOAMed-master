using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Voucher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter == "Save")
        {
            if (string.IsNullOrEmpty(txtVoucherAmount.Text) || string.IsNullOrEmpty(txtVoucherStartNumber.Text))
            {
                lblSonuc.Text = "Please fill all controls";
                return;
            }

            if (Convert.ToInt32(txtVoucherStartNumber.Text)<=0 || Convert.ToInt32(txtVoucherAmount.Text)<=0)
            {
                lblSonuc.Text = "Please check start number and amount. Must be > than 0";
                return;
            }
            if (string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                lblSonuc.Text = "Please select customer";
                return;
            }


            var ent = new DataProcessNoa.Data.NOAEntities();

            using (var scope = ent.Database.BeginTransaction())
            {
                try
                {

                    var result = ent.SP_CHECK_VOUCHER_NO(Int32.Parse(txtVoucherStartNumber.Text), Int32.Parse(txtVoucherAmount.Text)).FirstOrDefault().Value;

                    if (result==1)
                    {
                        lblSonuc.Text = "Girmiş olduğunuz değerler daha önce kullanılmıştır. Lütfen başka bir voucher numara serisi kullanınınız.";
                        scope.Rollback();
                        return;
                    }
                    int CustomerID = Int32.Parse(Request.QueryString["ID"]);

                    for (long i = Int32.Parse(txtVoucherStartNumber.Text); i < Int32.Parse(txtVoucherStartNumber.Text)+Int32.Parse(txtVoucherAmount.Text); i++)
                    {
                        CustomerVoucherList list = new CustomerVoucherList();
                        list.CustomerID = CustomerID;
                        list.InsertTime = DateTime.Now;
                        list.InsertUserName = (Session["User"] as Users).Username;
                        list.IsActive = true;
                        list.IsUsed = false;
                        list.VoucherNo = i;

                        ent.CustomerVoucherList.Add(list);
                        ent.SaveChanges();

                    }

                    var info = ent.CustomerVoucher.Where(u => u.CustomerID == CustomerID).FirstOrDefault();

                    if (info == null)
                    {
                        info = new CustomerVoucher();
                        info.CustomerID = CustomerID;
                        info.NetTotal = 0;
                        info.TotalIn = 0;
                        info.TotalOut = 0;

                        ent.CustomerVoucher.AddOrUpdate(info);
                        ent.SaveChanges();
                    }

                    info.TotalIn += Convert.ToInt32(txtVoucherAmount.Text);
                    info.NetTotal += Convert.ToInt32(txtVoucherAmount.Text);

                    ent.CustomerVoucher.AddOrUpdate(info);
                    ent.SaveChanges();

                    scope.Commit();
                    lblSonuc.Text = "Kayıt ekleme işlemi başarılı olmuştur. Voucher listesinde görüntüleme yapabilirsiniz.";
                    txtVoucherAmount.Text = "0";
                    txtVoucherStartNumber.Text = "0";


                }
                catch (Exception ex)
                {

                    scope.Rollback();
                    lblSonuc.Text = ex.Message;
                }
            }



            lblSonuc.Text = "Insert is successfull";
            pnlBack.JSProperties["cpOK"] = "OK";


        }
    }
}