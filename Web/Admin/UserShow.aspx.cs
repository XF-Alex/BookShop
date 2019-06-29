using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.Models;
using BookShop.BLL;

public partial class UserShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.gvMain.DataSource = new UserManager().GetNormalUsers();
            this.gvMain.DataBind();

        }
    }

    /// <summary>
    /// 绑定时,为删除增加确认对话框
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvMain_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lb = e.Row.FindControl("lbtnDelete") as LinkButton;
            lb.Attributes.Add("onclick", "return confirm('删除用户会将与此用户相关的订单一起删除，确认删除吗？')");
        }
    }

    /// <summary>
    /// 分页
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.gvMain.PageIndex = e.NewPageIndex;
        this.gvMain.DataSource = new UserManager().GetNormalUsers();
        gvMain.DataBind();
    }


    /// <summary>
    /// 执行时,设置个人用户详细信息的链接,这样写是为了体验多个事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvMain_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Del")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            new UserManager().DeleteUserById(id);
            this.gvMain.DataSource = new UserManager().GetNormalUsers();
            this.gvMain.DataBind();
        }
    }
}
