<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    ValidateRequest="false" CodeFile="BookAdd.aspx.cs" Inherits="Admin_BookAdd" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphAdmin" runat="Server">
<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"
    charset="gb2312"></script>
<table cellspacing="1" cellpadding="3" class="table_edit">
    <tr>
        <th>
            标题
        </th>
        <td>
            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
                ErrorMessage="标题不可为空!"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            封面
        </th>
        <td>
            <asp:Image ID="imgBook" runat="server" />
            <asp:FileUpload ID="fulBook" runat="server" />
            <asp:RequiredFieldValidator ID="rfvBookImage" runat="server" ControlToValidate="fulBook"
                ErrorMessage="封面不可为空!"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            定价
        </th>
        <td>
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvprice" runat="server" ControlToValidate="txtPrice"
                ErrorMessage="定价不可为空!"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            出版社
        </th>
        <td>
            <asp:DropDownList ID="ddlPublisher" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <th>
            分类
        </th>
        <td>
            <asp:DropDownList ID="ddlCategory" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <th>
            作者
        </th>
        <td>
            <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ControlToValidate="txtAuthor"
                ErrorMessage="作者名不可为空!"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            ISBN
        </th>
        <td>
            <asp:TextBox ID="txtISBN" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvIsbn" runat="server" ControlToValidate="txtISBN"
                ErrorMessage="ISBN不可为空!"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            出版日期
        </th>
        <td>
            <asp:TextBox ID="txtPublishDate" runat="server" CssClass="Wdate" onfocus="WdatePicker()"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPublishDate" runat="server" ControlToValidate="txtPublishDate"
                ErrorMessage="出版日期不可为空!"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            目录
        </th>
        <td>
            <%-- <FCKeditorV2:FCKeditor ID="ftbToc" runat="server">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </FCKeditorV2:FCKeditor>--%>
            <CKEditor:CKEditorControl ID="ftbToc" runat="server" Width="680px" Height="100px"></CKEditor:CKEditorControl><br>
            <asp:RequiredFieldValidator ID="rfvToc" runat="server" ControlToValidate="ftbToc"
                ErrorMessage="目录不可为空!"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            内容摘要
        </th>
        <td>
            <asp:TextBox ID="txtDesc" runat="server" Height="105px" TextMode="MultiLine" Width="600px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            &nbsp;&nbsp;
            <asp:Button ID="bntSave" runat="server" Text="保 存" OnClick="bntSave_Click" />
        </td>
    </tr>
</table>
</asp:Content>
