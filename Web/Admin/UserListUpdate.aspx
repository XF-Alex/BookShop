<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="UserListUpdate.aspx.cs" Inherits="UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphAdmin" runat="Server">
    <asp:GridView ID="gvMain" runat="server" AutoGenerateColumns="False" CellPadding="0"
        CssClass="data_table" DataKeyNames="Id" AllowPaging="True" PageSize="3" OnRowDataBound="gvMain_RowDataBound"
        OnRowCommand="gvMain_RowCommand" 
        OnPageIndexChanging="gv_PageIndexChanging" Height="153px" 
        onrowediting="gvMain_RowEditing" onrowupdating="gvMain_RowUpdating" 
        Width="756px" onrowcancelingedit="gvMain_RowCancelingEdit">
        <Columns>             
            <asp:TemplateField HeaderText="用户名">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("LoginId") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="LoginId" runat="server" Text='<%# Bind("LoginId") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Name" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="地址" SortExpression="Address">
                <EditItemTemplate>
                    <asp:TextBox ID="Address" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="电话" SortExpression="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="Phone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Mail">
                <EditItemTemplate>
                    <asp:TextBox ID="Mail" runat="server" Text='<%# Bind("Mail") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Mail") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField HeaderText="操作" ShowEditButton="True" />
            <asp:TemplateField HeaderText="操作">
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
