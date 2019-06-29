using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using BookShop.Models;
using BookShop.BLL;
public partial class Admin_UserStateManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.gvMain.DataSource = new UserManager().GetUsers();
            this.gvMain.DataBind();

        }
    }
    protected void btnEnable_Click(object sender, EventArgs e)
    {
        this.ChangeState(UserStates.正常);
    }
    protected void btnDisable_Click(object sender, EventArgs e)
    {
        this.ChangeState(UserStates.无效);
    }

    protected void gvMain_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //预留其他命令
        switch (e.CommandName)
        {
            case "UpdateState":
                UserManager manager = new UserManager();
                manager.ModifyUserState(Convert.ToInt32(e.CommandArgument));
                this.gvMain.DataSource = manager.GetUsers();
                this.gvMain.DataBind();
                break;
            default:
                break;
        }
    }

    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.gvMain.PageIndex = e.NewPageIndex;
        this.gvMain.DataSource = new UserManager().GetUsers();
        gvMain.DataBind();
    }


    /// <summary>
    /// 更改状态
    /// </summary>
    /// <param name="State"></param>
    private void ChangeState(UserStates state)
    {
        UserManager manager = new UserManager();
        ArrayList al = new ArrayList();
        for (int i = 0; i < this.gvMain.Rows.Count; i++)
        {
            CheckBox cb = (gvMain.Rows[i].FindControl("chkSelect")) as CheckBox;
            int id = Convert.ToInt32((gvMain.Rows[i].FindControl("lblId") as Label).Text);
            if (cb.Checked == true)
            {
                manager.ModifyUserState(id, state);
            }
        }
        this.gvMain.DataSource = manager.GetUsers();
        this.gvMain.DataBind();
    }
}
