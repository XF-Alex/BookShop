using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.BLL;
using BookShop.Models;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BookQueryCategories category = (BookQueryCategories)Enum.Parse(typeof(BookQueryCategories), Server.UrlDecode(Request.QueryString["QueryCategory"]));
            this.rpBookList.DataSource = new BookManager().GetBooks(category, Server.UrlDecode(Request.QueryString["KeyWord"]));
            this.rpBookList.DataBind();
            
        }
    }
  
}
