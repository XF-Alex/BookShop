<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="UserShow.aspx.cs" Inherits="UserShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphAdmin" runat="Server">
    <asp:GridView ID="gvMain" runat="server" AutoGenerateColumns="False" CellPadding="0" 
        CellSpacing="0" CssClass="data_table"  DataKeyNames="Id" AllowPaging="True"   
        PageSize="3" OnRowDataBound="gvMain_RowDataBound" OnRowCommand="gvMain_RowCommand"  OnPageIndexChanging="gv_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="Address" HeaderText="地址" SortExpression="Address" />
            <asp:BoundField DataField="LoginId" HeaderText="用户名" SortExpression="LoginId" />
            <asp:BoundField DataField="Phone" HeaderText="电话" SortExpression="Phone" />
            <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
            <asp:BoundField DataField="Mail" HeaderText="Email" SortExpression="Mail" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False" CommandName="Del"
                        CommandArgument='<%# Eval("Id") %>' Text="删除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="UserEdit.aspx?Id={0}"
                Text="详细" />
        </Columns>
        <PagerStyle CssClass="pages"   />
        <RowStyle BackColor="#DDF5D9" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>
