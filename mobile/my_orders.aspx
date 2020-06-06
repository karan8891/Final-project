<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="my_orders.aspx.cs" Inherits="mobile.my_orders" %>
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
				<div class="contact-agileinfo">
					<div class="contact-form wthree">
						<div class="brand">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                  ForeColor="#333333"  Width="100%" HorizontalAlign="Center" CellPadding="4" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                                      <asp:BoundField DataField="category" HeaderText="Category" 
                                          SortExpression="category" />
                                           <asp:BoundField DataField="sub_category" HeaderText="Sub Category" 
                                          SortExpression="sub_category" />
                                      <asp:BoundField DataField="brand" HeaderText="Brand Name" 
                                          SortExpression="brand" />
                                      
                                       <asp:TemplateField HeaderText="Image">
                                            <ItemTemplate>
                                               <img src='<%# Eval("image1") %>' style="width:100px;height:100px;" />
                       
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
                                      
                                  </Columns>
                                   <EditRowStyle BackColor="#999999" />
                                   <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Center" />
       
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
       
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                         
				<div class="clearfix"></div>
                <div>
                    <asp:Label ID="Label3" runat="server" Visible="false" Text="No Order"></asp:Label> 
                <span>
                    <asp:Label ID="Label1" runat="server" Text="Total Quantity" Visible="false"></asp:Label>
                </span>&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<span><asp:Label ID="t_qty1" runat="server" Visible="false" ></asp:Label></span>
                </div>
                <div>
                <span>
                    <asp:Label ID="Label2" runat="server" Text="Total Price" Visible="false"></asp:Label>
                </span>&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<span><asp:Label ID="t_price1" runat="server" Visible="false"></asp:Label></span>
                </div>

                         
				<div class="clearfix"></div>
                

			</div>
            </div>
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>
