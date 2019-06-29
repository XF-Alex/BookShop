<%@ Page Title="" Language="C#" MasterPageFile="~/Common.master" AutoEventWireup="true"
    CodeFile="BookDetailsView.aspx.cs" Inherits="BookDetailsView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHeader" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <asp:DetailsView ID="dvShowBook" runat="server" AutoGenerateRows="False" CellPadding="4"
        DataSourceID="odsBook" ForeColor="#333333" GridLines="None" Height="50px" HorizontalAlign="Center"
        Width="650px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"
            Width="80px" Wrap="False" />
        <Fields>
            <asp:BoundField DataField="Title" HeaderText="书名" SortExpression="Title" />
            <asp:ImageField DataImageUrlField="ISBN" DataImageUrlFormatString="~/Images/BookCovers/{0}.jpg"
                HeaderText="封面">
            </asp:ImageField>
            <asp:BoundField DataField="Author" HeaderText="作者" SortExpression="Author" />
            <asp:BoundField DataField="PublishDate" HeaderText="出版社日期" SortExpression="PublishDate" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN号" SortExpression="ISBN" />
        <asp:TemplateField HeaderText="单价" SortExpression="UnitPrice">               
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("UnitPrice", "{0:C}") %>'></asp:Label>
                <a href='<%#Eval("id","/ShoppingCart.aspx?bid={0}")%>'><img src="Images/Common/buy.gif" /></a>
            </ItemTemplate>
        </asp:TemplateField>
            <asp:BoundField DataField="ContentDescription" HeaderText="内容简介"
                SortExpression="ContentDescription" />
            <asp:BoundField DataField="TOC" HeaderText="目录" HtmlEncode="False" SortExpression="TOC" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" BorderStyle="Solid" ForeColor="#333333" HorizontalAlign="Left" />
    </asp:DetailsView>
    <asp:ObjectDataSource ID="odsBook" runat="server" SelectMethod="GetBookById" TypeName="BookShop.BLL.BookManager">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="6088" Name="id" QueryStringField="bid" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
