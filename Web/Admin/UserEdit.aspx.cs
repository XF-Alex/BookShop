using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.Models;
using BookShop.BLL;

public partial class Admin_UserEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            User user = new User();
            UserManager manager = new UserManager();
            user = manager.GetUserById(Convert.ToInt32(Request.QueryString["id"]));
            lblLoginId.Text = user.LoginId;
            txtName.Text = user.Name;
            txtMail.Text = user.Mail;
            txtPhone.Text = user.Phone;
            txtAddress.Text = user.Address;
        }
    }

    protected void bntSave_Click(object sender, EventArgs e)
    {
        User user = new User();
        UserManager manager = new UserManager();
        user = manager.GetUserById(Convert.ToInt32(Request.QueryString["id"]));
        user.Name = txtName.Text;
        user.Mail = txtMail.Text;
        user.Phone = txtPhone.Text;
        user.Address = txtAddress.Text;
        manager.ModifyUser(user);
        Response.Redirect("~/admin/UserList.aspx");
    }
}
