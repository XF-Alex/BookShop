using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.BLL;
using BookShop.Models;

public partial class Admin_BookList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.gvBooks.Attributes.Add("SortExpression", "Title");
            this.gvBooks.Attributes.Add("SortDirection", "ASC");
            this.gvBooks.DataSource = new BookManager().GetBooks();
            this.gvBooks.DataBind();
        }
    }

    protected void btnQuery_Click(object sender, EventArgs e)
    {
        BookQueryCategories category = (BookQueryCategories)Enum.Parse(typeof(BookQueryCategories), ddlQueryCategories.SelectedValue);
        this.gvBooks.DataSource = new BookManager().GetBooks(category, txtKeyWord.Text);
        this.gvBooks.DataBind();
    }

    /// <summary>
    /// 光棒效果和删除提示
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvBooks_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //指定当绑定的为数据列时
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#6699ff'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            //改行的第五个单元格,增加删除确认
            e.Row.Cells[5].Attributes.Add("onclick", "return confirm('确认删除吗？')");
        }
    }
    protected void gvBooks_Sorting(object sender, GridViewSortEventArgs e)
    {
        this.gvBooks.Attributes.Add("SortExpression", e.SortExpression);
        this.gvBooks.Attributes.Add("SortDirection", e.SortDirection == SortDirection.Ascending ? "ASC" : "DESC");
        this.gvBooks.DataBind();
    }

    /// <summary>
    /// 分页
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.gvBooks.PageIndex = e.NewPageIndex;
        this.gvBooks.DataSource = new BookManager().GetBooks();
        this.gvBooks.DataBind();
    }


    /// <summary>
    /// 这样写是为了体验多个事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvMain_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Del")
        {
            BookManager manager = new BookManager();
            int id = Convert.ToInt32(e.CommandArgument);
            if (manager.DeleteBookById(id))
            {
                Page.RegisterClientScriptBlock("", "<script>alert('删除书籍成功！')</script>");
                this.gvBooks.DataSource = new BookManager().GetBooks();
                this.gvBooks.DataBind();
            }
        }
    }
    /// <summary>
    /// 通过选择CommandField选定行时实现页面跳转
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvBooks_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int i = e.NewSelectedIndex;
        string key = this.gvBooks.DataKeys[i].Value.ToString();
        Response.Redirect("BookEdit.aspx?id=" + key);
    }
}
