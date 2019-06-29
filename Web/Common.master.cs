using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.Models;
using BookShop.BLL;

public partial class Common : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //动态加载分类
            this.LoadCategories();

            //初始化用户界面
            User oUser = Session["CurrentUser"] as User;
            if (oUser != null)
            {
                this.lblUser.Text = oUser.Name;
                this.lblUser.Visible = true;
            }
            else
            {
                this.lblUser.Visible = false;
            }
            this.ltlUser.Visible = !this.lblUser.Visible;

            ///初始化购物篮界面
            if (Session["Cart"] != null && Session["CurrentUser"] != null)
            {
                ShoppingManager manager = new ShoppingManager(Session["Cart"], Session["CurrentUser"]);
                if (manager.ShoppingItems.Count > 0)
                {
                    this.hrefShoppinCart.InnerText = "您目前共购买了 " + manager.ShoppingItems.Count + " 本书";
                    this.hrefShoppinCart.HRef = "ShoppingCart.aspx";
                }
            }
            else
            {
                this.hrefShoppinCart.InnerText = "目前您的购物篮是空的";
                this.hrefShoppinCart.HRef = "#";
            }
        }
    }
    /// <summary>
    /// 加载父节点为0的节点
    /// </summary>
    void LoadCategories()
    {
        List<Category> items = new CategoryManager().GetCategories();
        if (items.Count > 0)
            trvwCategory.Nodes.Clear();

        foreach (Category item in items)
        {
            if (item.PId == 0)
            {
                TreeNode node = new TreeNode("&nbsp;" + item.Name, item.Id.ToString(), this.ResolveUrl("~/Images/arrow.gif"));
                node.NavigateUrl = "BookList.aspx?typeid=" + item.Id;
                this.trvwCategory.Nodes.Add(node);
                this.BindNode(items, node);
            }
        }
    }

    /// <summary>
    /// 加载所有节点
    /// </summary>
    //void LoadCategories()
    //{
    //    List<Category> items = new CategoryManager().GetCategories();
    //    if (items.Count > 0)
    //        trvwCategory.Nodes.Clear();

    //    foreach (Category item in items)
    //    {
    //        TreeNode node = new TreeNode("&nbsp;" + item.Name, item.Id.ToString(), this.ResolveUrl("~/Images/arrow.gif"));
    //        node.NavigateUrl = "BookList.aspx?typeid=" + item.Id;
    //        this.trvwCategory.Nodes.Add(node);
    //        this.BindNode(items, node);
    //    }
    //}

    /// <summary>
    /// 绑定子节点
    /// </summary>
    /// <param name="items"></param>
    /// <param name="node"></param>
    void BindNode(List<Category> items, TreeNode pNode)
    {
        foreach (Category item in items)
        {
            if (item.PId == Int32.Parse(pNode.Value))
            {
                TreeNode node = new TreeNode("&nbsp;" + item.Name, item.Id.ToString(), this.ResolveUrl("~/Images/arrow.gif"));
                node.NavigateUrl = "BookList.aspx?typeid=" + item.Id;
                pNode.ChildNodes.Add(node);
                BindNode(items, node);
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Server.Transfer(string.Format("Search.aspx?QueryCategory={0}&KeyWord={1}", Server.UrlEncode("书名"), Server.UrlEncode(this.txtKeyword.Text)));
    }
}
