using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.Models;
using BookShop.BLL;
public partial class BookSearchList : System.Web.UI.Page
{
    private int PageSize = 5;
    /// <summary>
    /// 当前页数
    /// </summary>
    private int Pager
    {
        get
        {
            return (int)ViewState["Pager"];
        }
        set
        {
            ViewState["Pager"] = value;
        }
    }

    /// <summary>
    /// 当前分类Id
    /// </summary>
    private int CategoryId
    {
        get
        {
            return (int)ViewState["CategoryId"];
        }
        set
        {
            ViewState["CategoryId"] = value;
        }
    }

    /// <summary>
    /// 当前排序字段
    /// </summary>
    private string Order
    {
        get
        {
            if (ViewState["Order"] == null)
                return "PublishDate";
            return (string)ViewState["Order"];
        }
        set
        {
            ViewState["Order"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //首次加载，赋初值
            this.Pager = 1;
            try
            {
                this.CategoryId = Convert.ToInt32(Request.QueryString["typeid"]);
            }
            catch
            {
                this.CategoryId = -1;
            }
            this.DataBind();
        }
    }

    private void DataBind()
    {
        int pageCount = 0;
        BookManager manager = new BookManager();
        List<Book> list = manager.GetBooks(this.CategoryId, this.PageSize, this.Pager, ref pageCount, this.Order);
        if (list.Count == 0)
            Response.Redirect("~/Default.aspx");
       
        this.lblCurrentPage.Text = "第 " + (this.Pager).ToString() + " 页 共 " + pageCount + " 页";
        this.SetEnable(pageCount);

        //把PagedDataSource 对象赋给DataList控件 
        
        this.rpBookList.DataSource = list;
        this.rpBookList.DataBind();
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

 
    #region  排序
    protected void ddlOrder_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlOrder.SelectedValue == "1")
        {
            this.Order = "PublishDate";
        }
        else
        {
            this.Order = "UnitPrice";
        }
        this.Pager = 1;
          this.DataBind();
    }
  

    #endregion



    #region  翻页
    private void SetEnable(int pageCount)
    {
        this.btnPrev.Enabled = true;
        this.btnNext.Enabled = true;
        if (this.Pager == 1)
            btnPrev.Enabled = false;

        if (this.Pager == pageCount)
            btnNext.Enabled = false;
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        this.Pager++;
        this.DataBind();
    }
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        this.Pager--;
        this.DataBind();
    }
    #endregion

   
}
