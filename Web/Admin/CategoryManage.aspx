<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="CategoryManage.aspx.cs" Inherits="Admin_CategoryManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphAdmin" runat="Server">
 &nbsp;<asp:TextBox runat="server" ID="txtCatagory" ></asp:TextBox>
    <asp:Button id="btnAdd" runat="server" Text="增加分类" OnClick="btnAdd_Click"></asp:Button><br /><br />
    <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" CellPadding="0"
        CellSpacing="0" CssClass="data_table"  DataKeyNames="id">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="分类名称" SortExpression="Name" />
        </Columns>
          <PagerStyle CssClass="pages"   />
        <RowStyle BackColor="#DDF5D9" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>
