<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="mobile.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- banner-2 -->
	
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Cart Items
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
					
                    <div class="brand">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                  ForeColor="#333333"  Width="100%" HorizontalAlign="Center">
                            <Columns>
                                <asp:TemplateField HeaderText="Sno">
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
                                        <img src='<%# Eval("image1") %>' style="width:100px;height=100px;" />
                       
                                    </ItemTemplate>
                                </asp:TemplateField>   
                                          
                            <asp:BoundField DataField="qty" HeaderText="Qty" 
                            SortExpression="qty" />
                            <asp:BoundField DataField="price" HeaderText="Price" 
                            SortExpression="price" />
                            <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <a href='checkout.aspx?sno=<%# Eval("id") %>'>Delete</a>
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
                    <asp:Label ID="Label3" runat="server" Visible="false" Text="No Items Is In Your Cart"></asp:Label>
                <span>
                    <asp:Label ID="Label1" runat="server" Text="Total Quantity" Visible="false"></asp:Label></span> : <span><asp:Label ID="t_qty1" runat="server" Visible="false" ></asp:Label> PC</span>
                </div>
                <div>
                <span>
                    <asp:Label ID="Label2" runat="server" Text="Total Price" Visible="false"></asp:Label></span> : <span>Rs. <asp:Label ID="t_price1" runat="server" Visible="false"></asp:Label></span>
                </div>

                         
				<div class="clearfix"></div>
                <h4>Payment Mode :</h4>
                <asp:RadioButtonList ID="payment_mode" runat="server" AutoPostBack="True" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True">Credit Card</asp:ListItem>
                            <asp:ListItem>Debit Card</asp:ListItem>
                            <asp:ListItem>Net Banking</asp:ListItem>
                            <asp:ListItem>COD</asp:ListItem>
                        </asp:RadioButtonList>

            <asp:Panel ID="cr_card_pan" runat="server">
                    <div class="form-body">
					<div class="form-group">
                        Card No. <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        Month<asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>Jan</asp:ListItem>
                            <asp:ListItem>Feb</asp:ListItem>
                            <asp:ListItem>Mar</asp:ListItem>
                            <asp:ListItem>Apr</asp:ListItem>
                            <asp:ListItem>May</asp:ListItem>
                            <asp:ListItem>Jun</asp:ListItem>
                            <asp:ListItem>Jul</asp:ListItem>
                            <asp:ListItem>Aug</asp:ListItem>
                            <asp:ListItem>Sep</asp:ListItem>
                            <asp:ListItem>Oct</asp:ListItem>
                            <asp:ListItem>Nov</asp:ListItem>
                            <asp:ListItem>Dec</asp:ListItem>
                        </asp:DropDownList> &nbsp;&nbsp;&nbsp;&nbsp;
                        year<asp:DropDownList ID="DropDownList2" runat="server">
                            
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem>2025</asp:ListItem>
                            <asp:ListItem>2026</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        CVV/Security Code <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="net_bank_pan" runat="server">
                <div class="form-body">
					
                    <div class="form-group">
                        Choose Bank<asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem>Axix Bank</asp:ListItem>
                            <asp:ListItem>HDFC Bank</asp:ListItem>
                            <asp:ListItem>ICICI Bank</asp:ListItem>
                            <asp:ListItem>Oriental Bank Of Commerce</asp:ListItem>
                            <asp:ListItem>Punjab Nationl Bank</asp:ListItem>
                        </asp:DropDownList> &nbsp;&nbsp;&nbsp;&nbsp;
                       
                    </div>
                    
                    </div>
                </asp:Panel>

                <div class="container">
		<div class="login">
        <div class="col-md-6 login-do" style="width:100%">
        <asp:Panel ID="panel1" runat="server" Visible="false">
                 <label class="hvr-skew-backward" style="width:100%; text-align:center;">
                     <asp:Button ID="place" runat="server" Text="Place Order" 
                     onclick="place_Click" Visible="false" />
                 </label>
                 </asp:Panel>
                 </div>
                 </div>
                 </div>

			</div>
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>
