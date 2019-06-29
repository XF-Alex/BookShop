<%@ Page Title="" Language="C#" MasterPageFile="~/common.master" AutoEventWireup="true"  EnableViewStateMac ="false" 
    CodeFile="BookDetail.aspx.cs" Inherits="BookDetail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHeader" runat="Server">
    <link href="CSS/channel.css" rel="stylesheet" type="text/css" />
    <link href="CSS/answer.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="book_view">
        <h1 class="b_title">
            <asp:Label runat="server" ID="lblBookName"></asp:Label></h1>
        <div class="b_exa">
            <span class="book_group">书籍分类：<asp:Label runat="server" ID="lblCategory"></asp:Label></span> <span class="book_status">正在阅读（150 人），已经阅读（4521
                人） <span><a href="#">放入书架</a></span> <a href="#">什么是书架？</a></span>
        </div>
        <!--book basic start-->
        <dl class="put_book">
            <dt>
                <asp:Image runat="server" ID="imgBook" />
                <div class="chakan">
                    <img src="images/zoom.gif" />
                    <a class="gray878787a" href="#" name="bigpicture">点击查看大图</a></div>
            </dt>
            <dd>
                <div id="book_editor">
                    作 者：
                    <asp:Label runat="server" ID="lblAuthor"></asp:Label>
                    著<br />
                    出 版 社：<asp:Label runat="server" ID="lblPublisher"></asp:Label></div>
                <ul id="book_attribute">
                    <li>出版时间：
                        <asp:Label runat="server" ID="lblPublishDate"></asp:Label></li>
                    <li>字 数： </li>
                    <li>版 次： </li>
                    <li>页 数：</li>
                    <li>印刷时间： </li>
                    <li>开 本： </li>
                    <li>印 次： </li>
                    <li>纸 张： </li>
                    <li>I S B N ：
                        <asp:Label runat="server" ID="lblISBN"></asp:Label></li>
                    <li>包 装： 平装</li>
                </ul>
                <div id="book_price">
                    定价：<asp:Label runat="server" ID="lblPrice" CssClass="red"> </asp:Label>
                </div>
                <div id="book_point">
                    <span>送积分：<span id="pointsTag">354</span></span> <a target="_blank" href="#2">积分说明</a>
                    <br />
                    <br />
                    <a href="#">
                        <asp:ImageButton runat="server" ID="ibtnBuy" ImageUrl="~/Images/btn_goumai.gif" onmouseover="this.src='Images/btn_goumai_click.gif'"
                            onmouseout="this.src='Images/btn_goumai.gif'" OnClick="ibtnBuy_Click" />
                    </a>
                </div>

            </dd>
        </dl>
        <!--book basic end-->
        <!--book intro start-->
        <dl class="book_intro">
            <dt>内容提要</dt>
            <dd>
                <asp:Label runat="server" ID="lblContent"></asp:Label></dd>
        </dl>
        <dl class="book_intro">
            <dt>目录</dt>
            <dd>
                <asp:Label runat="server" ID="lblTOC"></asp:Label></dd>
        </dl>
        <!--book intro end-->
      
    </div>
</asp:Content>
