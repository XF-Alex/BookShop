<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs"
    Inherits="Admin_AdminLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta name="Robots" content="noindex,nofollow" />
    <title>"新知书店"-网上书店</title>
    <style type="text/css">
        .login
        {
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -250px 0 0 -250px;
        }
        .login_t
        {
            margin: 0 auto;
            width: 598px;
            height: 78px;
            background: url(images/login_03.gif) no-repeat;
        }
        .login_m
        {
            margin: 0 auto;
            width: 598px;
            height: 142px;
            background: url(images/login_05.gif) no-repeat;
        }
        .login_b
        {
            margin: 0 auto;
            width: 598px;
            height: 150px;
            padding-top: 24px;
            background: url(images/login_06.gif) no-repeat;
            text-align: center;
        }
        .login_b p
        {
            margin: 12px 0;
        }
        .login_input
        {
            width: 160px;
            height: 20px;
            margin-left: 6px;
            line-height: 20px;
            border: 1px solid #999;
        }
        .login_sub
        {
            width: 67px;
            height: 19px;
            background: url(images/login_sub.gif) no-repeat;
            text-align: center;
            border: none;
            line-height: 22px;
        }
    </style>
</head>
<body>
    <div class="login">
        <div class="login_t">
        </div>
        <div class="login_m">
        </div>
        <div class="login_b">
            <form id="Login" name="Login" method="post" runat="server">
            <table  align="center" >
                <tr>
                    <td>
                        用户名
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtLoginId" CssClass="login_input"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        密&nbsp;&nbsp;码
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtLoginPwd" TextMode="Password" CssClass="login_input"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button runat="server" ID="btnConfirm" OnClick="btnConfirm_Click" Text="提交" CssClass="login_sub" />
                        <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_Click" Text="重置" CssClass="login_sub" />
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</body>
</html>
