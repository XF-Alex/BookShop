<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="UserStateManage.aspx.cs" Inherits="Admin_UserStateManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphAdmin" runat="Server">

    <script type="text/javascript">
        function GetAllCheckBox(parentItem) {
            var items = document.getElementsByTagName("input");
            for (i = 0; i < items.length; i++) {
                if (parentItem.checked) {
                    if (items[i].type == "checkbox") {
                        items[i].checked = true;
                    }
                }
                else {
                    if (items[i].type == "checkbox") {
                        items[i].checked = false;
                    }
                }
            }
        }

    </script>

<asp:Button runat="server" ID="btnEnable" Text="启用用户" OnClick="btnEnable_Click" />
<asp:Button runat="server" ID="btnDisable" Text="禁止用户" OnClick="btnDisable_Click" />
<br />
<br />
<asp:GridView ID="gvMain" runat="server" AutoGenerateColumns="False" CellPadding="0"
    CellSpacing="0" CssClass="data_table" DataKeyNames="Id" AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging"
    PageSize="5" OnRowCommand="gvMain_RowCommand">
    <Columns>
        <asp:TemplateField HeaderText="选择">
            <ItemTemplate>
                <asp:CheckBox runat="server" ID="chkSelect" />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
            <HeaderTemplate>
                <input id="cbAll" type="checkbox" onclick="GetAllCheckBox(this)" />
            </HeaderTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="LoginId" HeaderText="用户名" SortExpression="LoginId" />
        <asp:BoundField DataField="LoginPwd" HeaderText="密码" SortExpression="LoginPwd" />
        <asp:BoundField DataField="Address" HeaderText="地址" SortExpression="Address" />
        <asp:BoundField DataField="Phone" HeaderText="电话" SortExpression="Phone" />
        <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
        <asp:BoundField DataField="Mail" HeaderText="电子邮件" SortExpression="Mail" />
        <asp:TemplateField HeaderText="角色">
            <ItemTemplate>
                <%# Eval("UserRole.Name") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="状态">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Visible="false" Text='<%# Eval("Id") %>'></asp:Label>
                <asp:LinkButton runat="server" ID="lbtnStatus" CommandArgument='<%# Eval("Id") %>'
                    CommandName="UpdateState" Text='<%# Eval("UserState.Name") %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerStyle CssClass="pages" />
    <RowStyle BackColor="#DDF5D9" />
    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
</asp:Content>
