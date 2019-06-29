<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="UserEdit.aspx.cs" Inherits="Admin_UserEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphAdmin" runat="Server">
<table cellspacing="1" cellpadding="3"  class ="table_edit">
    <tr>
        <th>
            用户Id
        </th>
        <td>
        <asp:Label ID ="lblLoginId" runat ="server" ></asp:Label>
        </td>
    </tr>
    <tr>
        <th>
            姓名
        </th>
        <td>
            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
            <asp:RequiredFieldValidator ID="valrName" runat="server" ControlToValidate="txtName"
                ErrorMessage="请请填写姓名"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            电话
        </th>
        <td>
            <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtPhone" ID="valrPhone"
                runat="server" ErrorMessage="请填写电话"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="valePhone" runat="server" ControlToValidate="txtPhone"
                ErrorMessage="电话号码输入不正确" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{11}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <th>
            地址
        </th>
        <td>
            <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
            <asp:RequiredFieldValidator ID="valrAddress" runat="server" ControlToValidate="txtAddress"
                ErrorMessage="请输入地址"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            E-Mail
        </th>
        <td>
            <asp:TextBox ID="txtMail" runat="server" Text='<%# Bind("Mail") %>'></asp:TextBox>
            <asp:RequiredFieldValidator ID="valrMail" runat="server" ControlToValidate="txtMail"
                ErrorMessage="请输入Email地址"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="valeMail" runat="server" ControlToValidate="txtMail"
                ErrorMessage="Email地址不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            &nbsp; <asp:Button ID="bntSave" runat="server" Text="保 存" OnClick="bntSave_Click" />
        </td>
    </tr>
</table>
</asp:Content>
