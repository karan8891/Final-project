<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="product_details.aspx.cs" Inherits="mobile.product_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- flexslider -->
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- page -->
	<div class="services-breadcrumb">
		
	</div>
	<!-- //page -->
	<!-- Single Page -->
	<div class="banner-bootom-w3-agileits">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l"><%= category %> - <%= sub_category%>
				<span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
			</h3>
			<!-- //tittle heading -->
			<div class="col-md-5 single-right-left ">
				<div class="grid images_3_of_2">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="<%=image1 %>" style="width:109px; height:150px;">
								<div class="thumb-image">
									<img src="<%=image1 %>" data-imagezoom="true" class="img-responsive" alt=""> </div>
							</li>
							
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="col-md-7 single-right-left simpleCart_shelfItem">
				<h3><%= shw_brand%></h3>
				
				<p>
					<span class="item_price">Rs. <asp:Label ID="sale_price" runat="server"></asp:Label></span>
					<del>Rs. <%= price%></del>
					<label><%= shw_weight%></label>
				</p>
				
				<div class="product-single-w3l">
					
					<p>
						<i class="fa fa-refresh" aria-hidden="true"></i>All products are
						<label>non-returnable.</label>
					</p>
				</div>
				<div class="occasion-cart">
					<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
						
							<fieldset>
                                Quantity : 
								<asp:TextBox ID="qty" runat="server" Text="1" Width="30px"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="qty"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                ErrorMessage="Only Number Allowed" ValidationExpression="[0-9]*" 
                                ControlToValidate="qty" ForeColor="#CC0000"></asp:RegularExpressionValidator>
								<br /><br />
                                <asp:Button ID="add_to_cart" runat="server" class="button" 
                                Text="Add To Cart" onclick="add_to_cart_Click" />
								
							</fieldset>
						
					</div>

				</div>

			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!-- //Single Page -->
</asp:Content>
