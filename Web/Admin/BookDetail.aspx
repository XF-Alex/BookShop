<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="BookDetail.aspx.cs" Inherits="Admin_BookDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphAdmin" runat="Server">
    <table  class ="table_detail"
        cellspacing="1" cellpadding="3" >
        <tr>
            <th>
                标题
            </th>
            <td>
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>
                封面
            </th>
            <td>
                <asp:Image ID="imgBook" runat="server" ImageUrl='<%# Eval("ISBN", "~/images/BookCovers/{0}.jpg") %>' />
            </td>
        </tr>
        <tr>
            <th>
                定价
            </th>
            <td>
                <asp:Label ID="lblPrice" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>
                出版社
            </th>
            <td>
                <asp:Label ID="lblPublisher" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>
                作者
            </th>
            <td>
                <asp:Label ID="lblAuthor" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>
                ISBN
            </th>
            <td>
                <asp:Label ID="lblISBN" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>
                出版日期
            </th>
            <td>
                <asp:Label ID="lblPublishDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>
                目录
            </th>
            <td>
                <asp:Label ID="lblToc" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>
                内容摘要
            </th>
            <td>
                <asp:Label ID="lblDesc" runat="server"></asp:Label>
            </td>
        </tr>
      
    </table>
</asp:Content>
