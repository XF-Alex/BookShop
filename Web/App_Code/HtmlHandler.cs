using System;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using BookShop.BLL;
using BookShop.Models;

/// <summary>
/// handler 的摘要说明
/// </summary>
public class HtmlHandler : IHttpHandler
{

    public HtmlHandler()
    {

    }
    public void ProcessRequest(HttpContext context)
    {
        //由地址获取bookId
        int i = context.Request.Path.LastIndexOf("/");
        string strBookId = context.Request.Path.Substring(i + 1, context.Request.Path.Length - (i + 6));
        int bookId = Convert.ToInt32(strBookId);
        //生成实际路径
        string filePath = context.Server.MapPath("~/BookDetails/Book_" + bookId + ".html");

        BookManager manager = new BookManager();

        context.Application.Lock();//加锁
        if (!File.Exists(filePath))
        {
            string templatePath = context.Server.MapPath("~/BookDetails/template.html");//模板路径
            string template = "";//模板内容
            using (StreamReader sr = new StreamReader(templatePath))
            {
                template = sr.ReadToEnd();//读取模板内容
            }

            Book book = manager.GetBookById(bookId);//获取Book信息
            /*模板内容替换*/
            string html = template.Replace("[WebRootPath]", context.Request.ApplicationPath)//替换路径
               .Replace("[BookId]", bookId.ToString())
               .Replace("[Author]", book.Author)
               .Replace("[Title]", book.Title)
               .Replace("[PublishName]", book.Publisher.Name)
               .Replace("[BookCategory]", book.Category.Name)
               .Replace("[ISBN]", book.ISBN)
               .Replace("[PublishDate]", book.PublishDate.ToShortDateString())
               .Replace("[UnitPrice]", StringUtility.ToMoney(book.UnitPrice))
               .Replace("[ContentDescription]", book.ContentDescription)
               .Replace("[TOC]", book.TOC);

            using (StreamWriter sw = new StreamWriter(filePath))
            {
                sw.Write(html);//写入静态化页面内容
            }
        }
        context.Application.UnLock();//解锁

        manager.AddClick(bookId);//增加点击数
        context.Server.Execute("~/bookDetails/Book_" + bookId + ".html");//转到实际路径
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
