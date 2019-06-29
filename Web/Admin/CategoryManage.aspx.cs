using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.BLL;
using BookShop.Models;

public partial class Admin_CategoryManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.gvCategory.DataSource = new CategoryManager().GetCategories();
            this.gvCategory.DataBind();

        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Category catagory = new Category();
        CategoryManager manager = new CategoryManager();
        catagory.Name = this.txtCatagory.Text.Trim();
        manager.AddCategory(catagory);
        this.gvCategory.DataSource = manager.GetCategories();
        this.gvCategory.DataBind();
    }
}
