<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="OrderList.aspx.cs" Inherits="Admin_OrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphAdmin" runat="Server">
    <div style="font-size: small" align="center">
        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CellPadding="0"
        CellSpacing="0" CssClass="data_table"  >
            <FooterStyle BackColor="#CCCC99" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="订单编号" />
                <asp:BoundField DataField="OrderDate" HeaderText="订单时间" />
                <asp:TemplateField HeaderText="客户">
                    <ItemTemplate>
                        <asp:Label ID="lblUserName" runat="server" Text='<%#  Eval("User.Name")  %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="总价(元)">
                            <ItemTemplate>
                                <asp:Label ID="lblUnitPrice" runat="server" Text='<%# StringUtility.ToMoney(Eval("TotalPrice")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                <asp:TemplateField HeaderText="详细">
                    <ItemTemplate>
                        <a href='OrderDetail.aspx?orderid=<%# Eval("Id") %>'>查看详细</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
           <PagerStyle CssClass="pages"   />
        <RowStyle BackColor="#DDF5D9" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
</asp:Content>
