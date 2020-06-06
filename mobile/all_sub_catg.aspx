<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="all_sub_catg.aspx.cs" Inherits="mobile.all_sub_catg" %>
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
                        <asp:Repeater ID="rptdept" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="rptdept_ItemCommand1">
                            <ItemTemplate>
						    <div class="col-xs-4 product-men">
							    <div class="men-pro-item simpleCart_shelfItem">
								    <div class="men-thumb-item">
									    <img src='<%# Eval("image") %>' alt="" style="width:160px; height:160px;">
									    
								    </div>
								    <div class="item-info-product ">
									    <h4>
										    <a href='products.aspx?category_sno=<%= category_sno %>&sub_category_sno=<%# Eval("id") %>'><%# Eval("sub_category") %></a>
									    </h4>
									    
								    </div>
							    </div>
						    </div>
						    </ItemTemplate>
                        </asp:Repeater>
						<div class="clearfix"></div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:sqlconnection %>" 
                            SelectCommand="SELECT DISTINCT * FROM [sub_category] WHERE ([category_id] = @category_sno)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="category_sno" QueryStringField="category_sno" 
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
