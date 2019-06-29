using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.Models;
using BookShop.BLL;
public partial class BookList : System.Web.UI.Page
{
    private int PageSize = 5;
    /// <summary>
    /// 当前页
    /// </summary>
    public int CurrentPageIndex
    {
        set
        {
            ViewState["CurrentPageIndex"] = value;
        }
        get
        {
            return Convert.ToInt32(ViewState["CurrentPageIndex"]);
        }
    }
    /// <summary>
    /// 总页数
    /// </summary>
    public int PageCount
    {
        set
        {
            ViewState["PageCount"] = value;
        }
        get
        {
            return Convert.ToInt32(ViewState["PageCount"]);
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
        if (!IsPostBack)  //首次加载，赋初值
        {
            this.CurrentPageIndex = 1;
            try
            {
                this.CategoryId = Convert.ToInt32(Request.QueryString["typeid"]);
            }
            catch
            {
                this.CategoryId = -1;
            }
            this.BindList();
        }
    }

    public void BindList()
    {
        BookManager manager = new BookManager();
        List<Book> list = manager.GetBooks(CategoryId, Order);
        PagedDataSource pds = new PagedDataSource(); //定义一个PagedDataSource实例
        pds.AllowPaging = true;//设置数据绑定控件启用分页
        pds.CurrentPageIndex = CurrentPageIndex - 1;//使用状态保持保存当前页数     
        if (list.Count == 0)
            Response.Redirect("~/Default.aspx");
        pds.DataSource = list;//指定PagedDataSource数据源
        pds.PageSize = this.PageSize;//设置每页记录数
        this.PageCount = pds.PageCount;
        this.lblCurrentPage.Text = "第" + CurrentPageIndex + "页,共" + this.PageCount + "页";
        this.dlBooks.DataSource = pds;//将DataList的数据源设置成PagedDataSource
        this.dlBooks.DataBind();
    }

    /// <summary>
    /// 下拉列表选项发生改变的事件方法(排序方式变化)
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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
        this.CurrentPageIndex = 1;
        this.BindList();
    }

    /// <summary>
    /// “翻页”标签的状态
    /// </summary>
    /// <param name="pageCount"></param>
    private void SetEnable(int pageCount)
    {
        this.btnPrev.Enabled = true;
        this.btnNext.Enabled = true;
        if (this.CurrentPageIndex == 1)
            btnPrev.Enabled = false;

        if (this.CurrentPageIndex == pageCount)
            btnNext.Enabled = false;
    }
    /// <summary>
    /// “下一页”按钮事件方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnNext_Click(object sender, EventArgs e)
    {
        this.CurrentPageIndex++;
        this.BindList();
    }
    /// <summary>
    /// “上一页”按钮事件方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        this.CurrentPageIndex--;
        this.BindList();
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
