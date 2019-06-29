<%@ Page Title="" Language="C#" MasterPageFile="~/common.master" AutoEventWireup="true"
    CodeFile="LogIn.aspx.cs" Inherits="MemberShip_LogIn" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHeader" runat="Server">
    <link href="Css/member.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function ValidateForm() {
            var txtLoginId = document.getElementById('<%= txtLoginId.ClientID %>');
            var txtLoginPwd = document.getElementById('<%= txtLoginPwd.ClientID %>');
            if (txtLoginId.value == "") {
                alert('请输入用户名！');
                return false;
            }
            else if (txtLoginPwd.value == "") {
                alert("请输入密码！");
                return false;
            }
            return true;
        }

        if (document.forms[0] != null) {
            document.forms[0].onsubmit = function () {
                if (ValidateForm() == false) {
                    return false;
                }
                else {
                    document.forms[0].submit();
                }
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="action_area" class ="member_form">
        <h2 class="action_type">
            <img src="Images/login_in.gif" alt="会员登录" /></h2>
        <p class="state">
            欢迎光临新知书店网站，本站为新知集团旗下专业在线书店！<br />
            您可以使用新知书店的用户名，直接登录。</p>
        <p>
            <label>
                用户名</label><asp:TextBox ID="txtLoginId" runat="server" CssClass="opt_input"></asp:TextBox>
        </p>
        <p>
            <label>
                密码</label><asp:TextBox ID="txtLoginPwd" runat="server" TextMode="Password"
                    CssClass="opt_input"></asp:TextBox></p>
    
        <p class="form_sub">
            <input type="checkbox" name="" checked="checked" />
            在此计算机上保留我的密码</p>
        <p class="form_sub">
            <asp:Button runat="server" ID="btnLogin" CssClass="opt_sub" OnClick="btnLogin_Click" Text ="登录" />
            <a href="Register.aspx">还没有注册？</a></p>
    </div>
</asp:Content>
