using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.BLL;
using BookShop.Models;

public partial class preBookList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.DataBind();
        }
    }

    private void DataBind()
    {
        BookManager manager = new BookManager();
        List<Book> list = manager.GetClickMoreBooks(5);
        this.dlBooks.DataSource = list;
        this.dlBooks.DataBind();
    }

    /// <summary>
    /// 获得封面的url
    /// </summary>
    /// <param name="isbn"></param>
    /// <returns></returns>
    public string GetUrl(string isbn)
    {
        return "Images/BookCovers/" + isbn.ToString() + ".jpg";
    }
}