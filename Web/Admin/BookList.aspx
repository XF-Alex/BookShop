<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="BookList.aspx.cs" Inherits="Admin_BookList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphAdmin" runat="Server">
    <table>
        <tr>
            <td>
                &nbsp;&nbsp; 检索类别：
                <asp:DropDownList ID="ddlQueryCategories" runat="server">
                    <asp:ListItem>书名</asp:ListItem>
                    <asp:ListItem>内容简介</asp:ListItem>
                    <asp:ListItem>出版社</asp:ListItem>
                    <asp:ListItem>作者</asp:ListItem>
                </asp:DropDownList>
                关键字：<asp:TextBox ID="txtKeyWord" runat="server"></asp:TextBox><asp:Button ID="btnQuery"
                    runat="server" Text="查询" OnClick="btnQuery_Click" />
            </td>
            <td style="width: 100px;">
                &nbsp; &nbsp;
                <asp:HyperLink ID="hlkAddBook" runat="server" NavigateUrl="~/Admin/BookAdd.aspx">添加书籍</asp:HyperLink>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView runat="server" ID="gvBooks" AutoGenerateColumns="False" AllowSorting="True"
        CellPadding="0" CssClass="data_table" OnRowDataBound="gvBooks_RowDataBound" OnPageIndexChanging="gv_PageIndexChanging"
        OnRowCommand="gvMain_RowCommand" AllowPaging="True" DataKeyNames="id" OnSorting="gvBooks_Sorting"
        OnSelectedIndexChanging="gvBooks_SelectedIndexChanging">
        <Columns>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFormatString="BookDetail.aspx?id={0}" HeaderText="书名"
                ControlStyle-Width="180" Text="编辑" DataNavigateUrlFields="id" DataTextField="Title"
                SortExpression="Title">
                <ControlStyle Width="220px"></ControlStyle>
            </asp:HyperLinkField>
            <asp:BoundField DataField="Author" HeaderText="作者" >
            <ControlStyle Width="120px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="类别">
                <ItemTemplate>
                    <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Category.Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFormatString="BookEdit.aspx?id={0}" Text="编辑"
                DataNavigateUrlFields="id" HeaderText="操作" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False" CommandName="Del"
                        CommandArgument='<%# Eval("Id") %>' Text="删除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="pages" />
        <RowStyle BackColor="#DDF5D9" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>
