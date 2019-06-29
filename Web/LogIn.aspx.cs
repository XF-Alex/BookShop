using System;
using System.Web.UI;
using BookShop.BLL;
using BookShop.Models;
public partial class MemberShip_LogIn : System.Web.UI.Page
{
    const string strErrorUser = "用户名或密码不正确，请重新填写!";

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    [Obsolete]
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        User user;
        UserManager manager = new UserManager();
        if (manager.LogIn(this.txtLoginId.Text, this.txtLoginPwd.Text, out user))
        {
            Session["CurrentUser"] = user;
            //System.Web.Security.FormsAuthentication.SetAuthCookie(user.LoginId, false);//写入身份票据
            if (Request.QueryString["ReturnUrl"] != null)
            {
                Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
            }
            Response.Redirect("~/default.aspx");
        }
        else
        {
            Page.RegisterClientScriptBlock("alert", "<script>alert('" + strErrorUser + "')</script>");
        }
    }
  
}
