using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.BLL;
using BookShop.Models;

public partial class ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User user = Session["CurrentUser"] as User;
        if (user == null)
        {
            Page.RegisterClientScriptBlock("", "<script>alert('登陆超时,请重新登陆!');document.location='Login.aspx';</script>");
            return;
        }

        if (!IsPostBack)
        {
            if (Session["Cart"] != null)
            {
                ShoppingManager manager = new ShoppingManager(Session["Cart"], user);
                this.gvCart.DataSource = manager.ShoppingItems;
                this.gvCart.DataBind();
                this.ltrSalary.Text = string.Format("{0:F}", manager.TotalPrice);
            }
        }
    }

    /// <summary>
    /// 结算生成订单
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        ShoppingManager manager = new ShoppingManager(Session["Cart"], Session["CurrentUser"]);
        if (manager.ShoppingItems.Count == 0)
        {
            Page.RegisterClientScriptBlock("", "<script>alert('您的购物车为空,请先将图书放入购物车!');document.location='BookList.aspx';</script>");
            return;
        }
        if (manager.User == null)
        {
            Page.RegisterClientScriptBlock("", "<script>alert('登陆超时,请重新登陆!');document.location='Login.aspx';</script>");
            return;
        }
        manager.MakeOrder();
        Session.Remove("Cart");
        Page.RegisterClientScriptBlock("", "<script>alert('结算成功,请等待审批订单!');document.location='BookList.aspx';</script>");

    }

    /// <summary>
    /// GridView删除按钮处理事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ShoppingManager manager = new ShoppingManager(Session["Cart"]);
        Label lblBookId = this.gvCart.Rows[e.RowIndex].FindControl("lblBookId") as Label;
        int bookId = int.Parse(lblBookId.Text);
        manager.RemoveItem(bookId);
        Session["Cart"] = manager.ShoppingItems;
        this.gvCart.DataSource = manager.ShoppingItems;
        this.gvCart.DataBind();
        this.ltrSalary.Text = string.Format("{0:F}", manager.TotalPrice);
    }

    /// <summary>
    /// GridView取消按钮处理事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        this.gvCart.EditIndex = -1;
        this.gvCart.DataSource = Session["Cart"] as List<ShoppingItem>;
        this.gvCart.DataBind();
    }

    /// <summary>
    /// GridView更新按钮处理事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ShoppingManager manager = new ShoppingManager(Session["Cart"]);
        foreach (GridViewRow dr in this.gvCart.Rows)
        {
            Label lblBookId = this.gvCart.Rows[e.RowIndex].FindControl("lblBookId") as Label;
            TextBox txtQuantity = this.gvCart.Rows[e.RowIndex].FindControl("txtQuantity") as TextBox;
            int bookId = int.Parse(lblBookId.Text);
            int quantity = int.Parse(txtQuantity.Text);
            manager.UpdateQuantity(bookId, quantity);
        }

        Session["Cart"] = manager.ShoppingItems;
        this.gvCart.EditIndex = -1;
        this.gvCart.DataSource = manager.ShoppingItems;
        this.gvCart.DataBind();
        this.ltrSalary.Text = string.Format("{0:F}", manager.TotalPrice);
    }

    /// <summary>
    /// GridView数据绑定后激发的事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lbtnDelete = e.Row.FindControl("lbtnDelete") as LinkButton;
            lbtnDelete.Attributes.Add("onclick", "return confirm('确定删除吗?')");
        }
    }

    /// <summary>
    /// GridView编辑按钮处理事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        this.gvCart.EditIndex = e.NewEditIndex;
        this.gvCart.DataSource = Session["Cart"] as List<ShoppingItem>;
        this.gvCart.DataBind();
    }


}
