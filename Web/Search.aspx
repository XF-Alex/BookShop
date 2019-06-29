<%@ Page Title="" Language="C#" MasterPageFile="~/common.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="Search" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cphHeader" runat="Server">
    <link href="Css/channel.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .th
        {
            background-color: #ffefd5;
        }
        .tr
        {
            background-color: #000000;
        }
        .tr_alter
        {
            background-color: #ffffff;
        }
    </style>



</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="main_booklist">
        <asp:Repeater ID="rpBookList" runat="server">
            <HeaderTemplate>
                <table>
                    <thead>
                        <tr>
                            <th class="title_booklist0">
                                书名
                            </th>
                            <th class="title_booklist1">
                                作者
                            </th>
                            <th class="title_booklist2">
                                出版社
                            </th>
                            <th class="title_booklist3">
                                出版日期
                            </th>
                            <th>
                                价格
                            </th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="alter_booklist">
                    <td>
                        <a href="BookDetail.aspx?bid=<%# Eval("Id")%>">
                            <%#Eval("Title") %></a>
                    </td>
                    <td>
                        <%#Eval("Author")%>
                    </td>
                    <td>
                        <%#Eval("Publisher.Name")%>
                    </td>
                    <td>
                        <%# StringUtility.ToShortDate(Eval("PublishDate"))%>
                    </td>
                    <td>
                        <%# StringUtility.ToMoney(Eval("UnitPrice"))%>
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr>
                    <td>
                        <a href="BookDetail.aspx?bid=<%# Eval("Id")%>">
                            <%#Eval("Title") %></a>
                    </td>
                    <td>
                        <%#Eval("Author")%>
                    </td>
                    <td>
                        <%#Eval("Publisher.Name")%>
                    </td>
                    <td>
                        <%# StringUtility.ToShortDate(Eval("PublishDate"))%>
                    </td>
                    <td>
                        <%# StringUtility.ToMoney(Eval("UnitPrice"))%>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </tbody> </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
