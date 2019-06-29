using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.Models;
using BookShop.BLL;
using System.Text;
using BookShop.DAL;

public partial class UserList : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                HRDataBind();
            }
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "<script>alert('操作失败!')</script>"); ;
        }
    }

    protected void HRDataBind()
    {
        this.gvMain.DataSource = new UserManager().GetNormalUsers();
        this.gvMain.DataBind();
    }

    /// <summary>
    /// "编辑"按钮单击事件方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>  
    protected void gvMain_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            this.gvMain.EditIndex = e.NewEditIndex;
            HRDataBind();
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "<script>alert('操作失败!')</script>");
        }
    }
    /// <summary>
    /// gvHR的RowUpdating事件方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param> 
    protected void gvMain_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GetInputData(e.RowIndex);//取得编辑行修改后的数据           
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "<script>alert('更新成功!')</script>");
            this.gvMain.EditIndex = -1;//退出编辑状态
            HRDataBind();//重新绑定
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "<script>alert('操作失败!')</script>"); ;
        }
    }

    /// <summary>
    /// gvHR的RowCancelingEdit事件方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvMain_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            this.gvMain.EditIndex = -1;
            HRDataBind();
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "<script>alert('操作失败!')</script>"); ;
        }
    }
    /// <summary>
    /// 取得编辑行修改后的数据
    /// </summary>
    /// <param name="index"></param>
    /// <returns></returns>
    public void GetInputData(int index)
    {
        User user = new User();
        UserManager manager = new UserManager();
        int id =int.Parse( this.gvMain.DataKeys[index].Value.ToString());//获取更新的记录的主键
        user = manager.GetUserById(id);
        string loginId =(this.gvMain.Rows[index].FindControl("LoginId") as TextBox).Text;
        string name = (this.gvMain.Rows[index].FindControl("Name") as TextBox).Text;
        string mail = (this.gvMain.Rows[index].FindControl("Mail") as TextBox).Text;
        string phone = (this.gvMain.Rows[index].FindControl("Phone") as TextBox).Text;
        string address = (this.gvMain.Rows[index].FindControl("Address") as TextBox).Text;       
        user.LoginId = loginId;
        user.Name = name;
        user.Mail = mail;
        user.Phone = phone;
        user.Address = address;
        manager.ModifyUser(user);
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
    /// 单击某一条记录的“删除”按钮事件方法
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
