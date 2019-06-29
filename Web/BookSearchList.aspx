<%@ Page Title="" Language="C#" MasterPageFile="~/common.master" AutoEventWireup="true"
    CodeFile="BookSearchList.aspx.cs" Inherits="BookSearchList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHeader" runat="Server">
    <link href="Css/channel.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="main">
        <div class="list_asc">
            <!--choice order type-->
            <div class="type_choice f_left">
                排序方式
                <asp:DropDownList ID="ddlOrder" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlOrder_SelectedIndexChanged">
                    <asp:ListItem Value="1">按出版日期排序</asp:ListItem>
                    <asp:ListItem Value="2">按价格排序</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="main_booklist">
            <dl>
                <dt>
                    <asp:Repeater ID="rpBookList" runat="server">
                        <HeaderTemplate>
                            <ul class="title_ul2">
                                <li class="title_booklist0">书名</a></li>
                                <li class="title_booklist1">作者</li>
                                <li class="title_booklist2">出版社</li>
                                <li class="title_booklist3">出版时间</li>
                                <li class="title_booklist4">单价</li>
                            </ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <ul>
                                <li class="title_booklist0"><a href="BookDetail.aspx?bid=<%# Eval("Id")%>" target="_blank">
                                    <%# Eval("Title")%></a></li>
                                <li class="title_booklist1">
                                    <%# Eval("Author")%></li>
                                <li class="title_booklist2">
                                    <%# Eval("publisher.Name")%></li>
                                <li class="title_booklist3">
                                    <%# Eval("publishDate","{0:yyyy-mm-dd}")%></li>
                                <li class="title_booklist4">
                                    <%# Eval("UnitPrice","{0:C}")%></li>
                            </ul>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <ul class="title_ul2" style="clear: both">
                                <li class="title_booklist0"><a href="BookDetail.aspx?bid=<%# Eval("Id")%>" target="_blank">
                                    <%# Eval("Title")%></a></li>
                                <li class="title_booklist1">
                                    <%# Eval("Author")%></li>
                                <li class="title_booklist2">
                                    <%# Eval("publisher.Name")%></li>
                                <li class="title_booklist3">
                                    <%# Eval("publishDate","{0:yyyy-mm-dd}")%></li>
                                <li class="title_booklist4">
                                    <%# Eval("UnitPrice","{0:C}")%></li>
                            </ul>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                <dt>
                </dt>
            </dl>
        </div>
        <div class="pages">
            <asp:Label runat="server" ID="lblCurrentPage"></asp:Label>
            <asp:Button ID="btnPrev" runat="server" Text="上一页" OnClick="btnPrev_Click" />
            <asp:Button ID="btnNext" runat="server" Text="下一页" OnClick="btnNext_Click" />
        </div>
    </div>
</asp:Content>
