using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.Models;
using BookShop.BLL;

public partial class Admin_OrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.gvOrders.DataSource = new OrderManage().GetOrderDetailById(Convert.ToInt32(Request.QueryString["orderid"]));
            this.gvOrders.DataBind();
        }
    }
}
