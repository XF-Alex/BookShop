using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.BLL;
using BookShop.Models;

public partial class Admin_BookDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Book book = new BookManager().GetBookById(Convert.ToInt32(Request.QueryString["id"]));

        this.lblAuthor.Text = book.Author;
        this.lblTitle.Text = book.Title;
        this.lblPublisher.Text = book.Publisher.Name;
        this.lblISBN.Text = book.ISBN;
        this.lblPublishDate.Text = book.PublishDate.ToShortDateString();
        this.lblPrice.Text = string.Format("{0:f2}", book.UnitPrice) + "元";
        this.lblDesc.Text = book.ContentDescription;
        this.lblToc.Text = book.TOC;
        this.imgBook.ImageUrl = StringUtility.CoverUrl(book.ISBN);
    }
}
