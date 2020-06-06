<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="all_orders.aspx.cs" Inherits="mobile.all_orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- banner-2 -->
	
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">All Orders
				<span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
			</h3>
			<!-- //tittle heading -->
			<!-- contact -->
			<div class="contact agileits">
				<div class="brand">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                 ForeColor="#333333" Font-Size="Small" Width="100%" HorizontalAlign="Center">
                <Columns>
                                      <asp:TemplateField HeaderText="Order No">
                                      <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                      </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:BoundField DataField="category" HeaderText="Category" 
                                          SortExpression="category" />
                                          <asp:BoundField DataField="sub_category" HeaderText="Sub Category" 
                                          SortExpression="sub_category" />
                                      <asp:BoundField DataField="brand" HeaderText="Brand Name" 
                                          SortExpression="brand" />
                                       <asp:TemplateField HeaderText="Image">
                                            <ItemTemplate>
                                               <img alt="PRODUCT IMAGE" src='<%# Eval("image1") %>' style="width:100px;height:100px;" />
                       
                                           </ItemTemplate>
                                      </asp:TemplateField>   
                                          
                                    <asp:BoundField DataField="qty" HeaderText="Qty" 
                                    SortExpression="qty" />
                                    <asp:BoundField DataField="price" HeaderText="Price" 
                                    SortExpression="price" />
                                       <asp:BoundField DataField="payment_mode" HeaderText="Payment Mode" 
                                    SortExpression="payment_mode" />
                                     <asp:BoundField DataField="dated" HeaderText="Date" 
                                    SortExpression="dated" />
                                    <asp:BoundField DataField="name" HeaderText="Customer Name" 
                                    SortExpression="name" />
                                    <asp:BoundField DataField="email_id" HeaderText="Email" 
                                    SortExpression="email_id" />
                                     <asp:BoundField DataField="address" HeaderText="Address" 
                                    SortExpression="address" />
                                     <asp:BoundField DataField="mobile" HeaderText="Contact" 
                                    SortExpression="mobile" />
                                      <asp:TemplateField HeaderText="Print">
                                    <ItemTemplate>
                                        <a href='print_order.aspx?sno=<%# Eval("id") %>'>Print</a>
                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  </Columns>
                                   <FooterStyle BackColor="#FF6666" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#FF6666" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Center" />
       
        <RowStyle BackColor="#FFFFCC" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                         
				<div class="clearfix"></div>
                <div>
                    <asp:Label ID="Label3" runat="server" Visible="false" Text="No Order"></asp:Label>
                <span>
                    <asp:Label ID="Label1" runat="server" Text="Total Quantity" Visible="false"></asp:Label></span>&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<span><asp:Label ID="t_qty1" runat="server" Visible="false" ></asp:Label></span>
                </div>
                <div>
                <span>
                    <asp:Label ID="Label2" runat="server" Text="Total Price" Visible="false"></asp:Label></span>&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<span><asp:Label ID="t_price1" runat="server" Visible="false"></asp:Label></span>
                </div>

                         
				<div class="clearfix"></div>
                

			</div>
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>
