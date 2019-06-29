<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="Admin_OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphAdmin" Runat="Server">
   <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CellPadding="0"
        CellSpacing="0" CssClass="data_table" >
        <Columns>
            <asp:BoundField DataField="Id"  Visible="False"/>
            <asp:TemplateField HeaderText="订单编号">              
                <ItemTemplate>
                    <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("Order.Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="书籍ISBN">               
                <ItemTemplate>
                    <asp:Label ID="lblBookISBN" runat="server" Text='<%# Eval("Book.ISBN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="书籍名称">               
                <ItemTemplate>
                    <asp:Label ID="lblBookName" runat="server" Text='<%# Eval("Book.Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Quantity" HeaderText="数量" />
              <asp:TemplateField HeaderText="单价(元)">
                            <ItemTemplate>
                                <asp:Label ID="lblUnitPrice" runat="server" Text='<%# StringUtility.ToMoney(Eval("UnitPrice")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
        </Columns>
         <FooterStyle BackColor="#CCCC99" />
         <RowStyle BackColor="#F7F7DE" />
         <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
         <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
         <AlternatingRowStyle BackColor="White" />
     </asp:GridView>
</asp:Content>

