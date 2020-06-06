<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="mobile.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <!-- page -->
	<div class="services-breadcrumb">
		
	</div>
	<!-- //page -->
	<!-- top Products -->
	<div class="ads-grid">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Products
				<span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
			</h3>
			<!-- //tittle heading -->
			
			<!-- product right -->
			<div class="agileinfo-ads-display col-md-12 w3l-rightpro">
				<div class="wrapper">
					
					<div class="product-sec1">
                        <asp:Repeater ID="rptdept" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
						    
                            <div class="col-xs-4 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src='<%# Eval("image1") %>' alt="" style="width:160px; height:160px;">
									<div class="men-cart-pro">
										<div class="inner-men-cart-pro">
											<a href='product_details.aspx?pro_sno=<%# Eval("id") %>' class="link-product-add-cart">View Details</a>
										</div>
									</div>
									<span class="product-new-top">New</span>
								</div>
								<div class="item-info-product ">
									<h4>
										<a href='product_details.aspx?pro_sno=<%# Eval("id") %>'><%# Eval("brand") %></a>
									</h4>
									<div class="info-product-price">
										<span class="item_price">Rs. <%# Eval("off_price") %></span>
										<del>Rs. <%# Eval("price") %></del>
									</div>
									

								</div>
							</div>
						</div>
						    </ItemTemplate>
                        </asp:Repeater>
						<div class="clearfix"></div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:sqlconnection %>" 
                            SelectCommand="SELECT * FROM [pro_detail] WHERE ([category_id] = @category_sno and [sub_category_id] = @sub_category_sno)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="category_sno" QueryStringField="category_sno" 
                                    Type="String" />
                                    <asp:QueryStringParameter Name="sub_category_sno" QueryStringField="sub_category_sno" 
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
					</div>
					

				</div>
			</div>
			<!-- //product right -->
		</div>
	</div>
	<!-- //top products -->
	
</asp:Content>

