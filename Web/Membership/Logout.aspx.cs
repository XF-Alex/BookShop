using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberShip_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //清除session
        Session.Clear();
        //表单验证退出
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("~/default.aspx");
    }
}
