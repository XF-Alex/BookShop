<%@ Page Title="" Language="C#" MasterPageFile="~/Common.master" AutoEventWireup="true"
CodeFile="preBookList.aspx.cs" Inherits="preBookList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHeader" runat="Server">
<link href="Css/channel.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="Server">
&nbsp;&nbsp;&nbsp;您现在的位置: 新知书店 >图书列表页
<div class="main">
    <asp:DataList ID="dlBooks" runat="server">
        <ItemTemplate>
        <table id="tbBooks" class="list_area">
            <tr>
                <td rowspan="2" class="td_left">
                    <a href="BookDetail.aspx?bid=<%# Eval("Id")%>">
                        <%--  <img alt="" src="<%# GetUrl(Eval("ISBN").ToString()) %>" />     --%>      
                        <img alt="" src='<%#Eval("ISBN","Images/BookCovers/{0}.jpg")%>'
                    </a>
                </td>
                <td class="td_right">
                    <a href="BookDetail.aspx?bid=<%# Eval("Id")%>" name="link_prd_name" target="_blank"
                        class="b_title" id="link_prd_name">
                        <%# Eval("Title") %></a>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <span>
                        <%# Eval("Author") %></span><br /></span>
                    <br />
                    <span>
                        <%# StringUtility.CutString(Eval("ContentDescription"), 150)%></span>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    价格： <span class="red">
                        <%# StringUtility.ToMoney(Eval("UnitPrice"))%></span>
                </td>
            </tr>
        </table>
        </ItemTemplate>
        <SeparatorTemplate>
        </SeparatorTemplate>
    </asp:DataList>
</div>
</asp:Content>
