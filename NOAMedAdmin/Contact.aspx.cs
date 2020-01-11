using DataProcessNoa.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }

    private void LoadData()
    {

        var list = new DataProcessNoa.Data.NOAEntities().Contact.Find(7);

        txtName.Text = list.Name;
        txtAddress.Text = list.Adress;
        txttel.Text = list.Tel;
        txtfax.Text = list.Fax;
        txtEmail.Text = list.Email;
        txtlong.Text = list.Lng;
        txtLat.Text = list.Lat;
        

        
    }
    protected void pnlBack_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter=="Refresh")
        {
            LoadData();
        }
        else if (e.Parameter.Contains("Save"))
        {
          
          
            var ent = new DataProcessNoa.Data.NOAEntities();
            var user = ent.Contact.Find(7);

            user.Name = txtName.Text;
            user.Adress = txtAddress.Text;
            user.Tel = txttel.Text;
            user.Fax = txtfax.Text;
            user.Email = txtEmail.Text;
            user.Lng = txtlong.Text;
            user.Lat = txtLat.Text;
           
            ent.Contact.AddOrUpdate(user);
            ent.SaveChanges();

            LoadData();
        }
    }
}