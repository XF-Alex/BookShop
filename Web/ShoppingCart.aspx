<%@ Page Title="" Language="C#" MasterPageFile="~/common.master" AutoEventWireup="true"
    CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHeader" runat="Server">
    <link href="Css/member.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="action_area">
        <h2 class="action_type backet">
            <p class="imp_link">
                全场运费一律2元 <a href="#"><strong>简易计算器</strong></a><br />
                <p class="mark">
                    确认商品价格与交易条件</p>
        </h2>
        <asp:GridView runat="server" ID="gvCart" Width="96%" AutoGenerateColumns="False"
            BorderWidth="0" CellSpacing="3" CellPadding="0" CssClass="data_table" AllowPaging="False"
            OnRowEditing="gvCart_RowEditing" PageSize="5" OnRowCancelingEdit="gvCart_RowCancelingEdit"
            OnRowDeleting="gvCart_RowDeleting" OnRowDataBound="gvCart_RowDataBound" OnRowUpdating="gvCart_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="图示">
                    <ItemTemplate>
                        <img runat="server" id="imgbook" src='<%# StringUtility.CoverUrl(Eval("Book.ISBN")) %>'
                            width="49" height="56" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="书名">
                    <ItemTemplate>
                        <asp:Label ID="lblBookName" runat="server" Text='<%# Eval("Book.Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="数量">
                    <EditItemTemplate>
                        &nbsp;<asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' Width ="50px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity"
                            ErrorMessage="请输入数量" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="refQuantity" runat="server" ControlToValidate="txtQuantity"
                            ErrorMessage="请输入非负整数" Text="*" ValidationExpression="^[0-9]*[1-9][0-9]*$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="单价">
                    <ItemTemplate>
                        <asp:Label ID="lblUnitPrice" runat="server" Text='<%# StringUtility.ToMoney(Eval("Book.UnitPrice")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemStyle Width="50px" />
                    <ItemTemplate>
                        <asp:Label ID="lblBookId" runat="server" Text='<%# Eval("Book.Id") %>' Visible="false"></asp:Label>
                        <asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <table width="96%">
            <tr>
                <td width="68%" align="right">
                    <a href="BookList.aspx">继续挑选商品</a>&nbsp;&nbsp;&nbsp;&nbsp; 商品金额总计：￥<em><strong><asp:Literal
                        runat="server" ID="ltrSalary"></asp:Literal></strong></em>
                </td>
                <td align="center">
                    <asp:Button runat="server" ID="btnCheckOut" CssClass="basker_ok" OnClick="btnCheckOut_Click" />
                </td>
            </tr>
        </table>

        <script type="text/javascript">
            var table_obj = document.getElementById("<%= gvCart.ClientID %>").getElementsByTagName("tr");
            for (var i = 0; i < table_obj.length; i++) table_obj[i].style.background = i % 2 == 1 ? "#FEF7DB" : "#E2E2E2";
        </script>

    </div>
</asp:Content>
