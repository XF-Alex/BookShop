using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.BLL;
using BookShop.Models;
using System.IO;

public partial class Admin_BookAdd : System.Web.UI.Page
{
    /// <summary>
    /// 页面加载事件方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ddlCategory.DataSource = new CategoryManager().GetCategories();
            ddlCategory.DataBind();
            ddlPublisher.DataSource = new PublisherManager().GetPublishers();
            ddlPublisher.DataBind();
            if (Request.QueryString["id"] == null)
            {
                this.imgBook.Visible = false;
            }
            else
            {
                this.rfvBookImage.Visible = false;
            }
            this.BindData();
        }

    }
    /// <summary>
    /// 单击“保存”按钮事件方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void bntSave_Click(object sender, EventArgs e)
    {
        string FileName = this.fulBook.FileName;
        if (FileName.Trim().Trim().Length != 0)
        {
            string strpath = Server.MapPath("~/images/BookCovers/" + txtISBN.Text.Trim() + ".jpg");
            fulBook.PostedFile.SaveAs(strpath);//把图片保存在此路径中
        }
        BookManager manger = new BookManager();
        Book book = new Book();
        book.Author = txtAuthor.Text;
        book.Category = new Category(int.Parse(ddlCategory.SelectedValue), ddlCategory.SelectedItem.Text);
        book.ContentDescription = txtDesc.Text;
        book.ISBN = txtISBN.Text;
        book.PublishDate = DateTime.Parse(txtPublishDate.Text);
        book.Publisher = new Publisher(int.Parse(ddlPublisher.SelectedValue), ddlPublisher.SelectedItem.Text);
        book.Title = txtTitle.Text;
        book.TOC = ftbToc.Text;
        book.UnitPrice = decimal.Parse(txtPrice.Text);
        if (Request.QueryString["id"] != null)
        {
            book.Id = Convert.ToInt32(Request.QueryString["id"]);
            if (manger.ModifyBook(book))
                Page.RegisterClientScriptBlock("", "<script>alert('书籍修改成功！')</script>");
        }
        else
        {
            manger.AddBook(book);
            Response.Redirect("~/admin/BookList.aspx");
            //Page.RegisterClientScriptBlock("", "<script>alert('书籍添加成功！')</script>");
        }

    }
    /// <summary>
    /// 根据图书Id绑定图书信息到页面对应控件
    /// </summary>
    private void BindData()
    {
        if (Request.QueryString["id"] != null)
        {
            Book book = new BookManager().GetBookById(Convert.ToInt32(Request.QueryString["id"]));
            this.txtAuthor.Text = book.Author;
            this.txtTitle.Text = book.Title;
            this.ddlPublisher.SelectedValue = book.Publisher.Id.ToString();
            this.ddlCategory.SelectedValue = book.Category.Id.ToString();
            this.txtISBN.Text = book.ISBN;
            this.txtPublishDate.Text = book.PublishDate.ToShortDateString();
            this.txtPrice.Text = string.Format("{0:f2}", book.UnitPrice);
            this.txtDesc.Text = book.ContentDescription;
            this.ftbToc.Text = book.TOC;
            this.imgBook.ImageUrl = "~/Images/BookCovers/" + book.ISBN + ".jpg";
            //this.imgBook.ImageUrl = StringUtility.CoverUrl(book.ISBN);
        }
    }
}
