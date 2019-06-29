using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.BLL;
using BookShop.Models;

public partial class Admin_AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        User user;
        if (new UserManager().AdminLogin(this.txtLoginId.Text, this.txtLoginPwd.Text, out user))
        {
            Session["CurrentUser"] = user;
            string strRedirect;
            //表单验证所指定的路径
            strRedirect = Request["ReturnUrl"];
            //表单验证
            System.Web.Security.FormsAuthentication.SetAuthCookie(user.Name, true);
            if (strRedirect == null)
                Response.Redirect("~/Admin/Default.aspx");
            Response.Redirect(strRedirect);
        }
        else
        {
           Page.RegisterClientScriptBlock("alert","<script>alert('用户名或密码不正确!')</script>");
        }
       
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        this.txtLoginId.Text = String.Empty;
        this.txtLoginPwd.Text = String.Empty;
    }
}
