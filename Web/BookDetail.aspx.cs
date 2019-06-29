using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.BLL;
using BookShop.Models;

public partial class BookDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["bid"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["bid"]);

                BookManager manager = new BookManager();
                manager.AddClick(id);
                Book book = manager.GetBookById(id);

                this.lblAuthor.Text = book.Author;
                this.lblBookName.Text = book.Title;
                this.lblPublisher.Text = book.Publisher.Name;
                this.lblCategory.Text = book.Category.Name;
                this.lblISBN.Text = book.ISBN;
                this.lblPublishDate.Text = book.PublishDate.ToShortDateString();
                this.lblPrice.Text = StringUtility.ToMoney(book.UnitPrice);
                this.lblContent.Text = book.ContentDescription;
                this.lblTOC.Text = book.TOC;
                this.imgBook.ImageUrl = StringUtility.CoverUrl(book.ISBN);
            }
        }
    }


    protected void ibtnBuy_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            Page.RegisterClientScriptBlock("", "<script>alert('请先登录再购买商品！');document.location='Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl) + "';</script>");

        }
        else
        {
            ShoppingManager manager = new ShoppingManager(Session["Cart"]);
            manager.AddItem(Convert.ToInt32(Request.QueryString["bid"]));
            Session["Cart"] = manager.ShoppingItems;
            Response.Redirect("~/ShoppingCart.aspx");
        }
    }
}
