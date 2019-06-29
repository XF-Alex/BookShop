using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.BLL;
using BookShop.Models;
public partial class MemberShip_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            snCode.Create();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!CeckCode())
        {
            Page.RegisterClientScriptBlock("alert", "<script>alert('验证码错误！')</script>");
            return;
        }
        User user = new User();
        user.LoginId = this.txtLoginId.Text;
        user.LoginPwd = this.txtLoginPwd.Text;
        user.Name = this.txtName.Text;
        user.Address = this.txtAddress.Text;
        user.Phone = this.txtTele.Text;
        user.Mail = this.txtEmail.Text;
        UserManager manager = new UserManager();
        if (!manager.Register(user))
        {
            Page.RegisterClientScriptBlock("alert", "<script>alert('用户名已使用，请重新输入！')</script>");
        }
        else
        {
            Page.RegisterClientScriptBlock("alert", "<script>alert('注册成功，请继续购物！');window.location='../default.aspx'</script>");

        }
    }
    protected bool CeckCode()
    {
        if (snCode.CheckSN(txtCode.Text.Trim()))
        {
            return true;
        }
        else
        {
            snCode.Create();
            return false;
        }
    }
}
