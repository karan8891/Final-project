<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="all_products.aspx.cs" Inherits="mobile.all_products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- banner-2 -->
	
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">All Products
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
						<asp:DropDownList ID="category" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="category" DataValueField="id" 
                        Width="100%" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:sqlconnection %>" 
                                SelectCommand="SELECT [category], [id] FROM [category]"></asp:SqlDataSource>	
                           
                         <asp:DropDownList ID="sub_category" runat="server" 
                                DataSourceID="SqlDataSource3" DataTextField="sub_category" DataValueField="id" 
                                Width="100%" AutoPostBack="True">
                            </asp:DropDownList>
                        
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:sqlconnection %>" 
                        
                            SelectCommand="SELECT * FROM [sub_category] WHERE ([category_id] = @category)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="category" Name="category" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
					</div>
                    <asp:GridView ID="GridView1" runat="server" 
                            AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource1" ForeColor="#333333" Width="100%" HorizontalAlign="Center">
                            <Columns>
                            <asp:TemplateField HeaderText="Sno">
                                <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="brand" HeaderText="Name" 
                                    SortExpression="brand" />
                                      
                                      
                                <asp:BoundField DataField="weight" HeaderText="Weight" SortExpression="weight" />
                                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                                <asp:BoundField DataField="off_price" HeaderText="Offer Price" 
                                    SortExpression="off_price" />
                                <asp:BoundField DataField="tot_qty" HeaderText="Total Stock" 
                                    SortExpression="tot_qty" />
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <a href='edit_product.aspx?sno=<%# Eval("id") %>'>Edit</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <a href='all_products.aspx?sno=<%# Eval("id") %>'>Delete</a>
                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#FF6666" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#E45E33" Font-Bold="True" ForeColor="White" 
    HorizontalAlign="Center" />
        
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:sqlconnection %>" 
                                  
            SelectCommand="SELECT * FROM [pro_detail] WHERE ([category_id] = @category_sno and [sub_category_id] = @sub_category_sno)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="category" Name="category_sno" 
                                    PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="sub_category" Name="sub_category_sno" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>