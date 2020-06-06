<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="edit_product.aspx.cs" Inherits="mobile.edit_product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- banner-2 -->

	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Edit Product
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
                        DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="id" 
                        Width="100%" AutoPostBack="True">
                            </asp:DropDownList>
                        
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:sqlconnection %>" 
                                SelectCommand="SELECT [category], [id] FROM [category]"></asp:SqlDataSource>
                          <br />
                            <asp:DropDownList ID="sub_category" runat="server" 
                                DataSourceID="SqlDataSource2" DataTextField="sub_category" DataValueField="id" 
                                Width="100%">
                            </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:sqlconnection %>" 
                        
                            SelectCommand="SELECT * FROM [sub_category] WHERE ([category_id] = @category)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="category" Name="category" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                          <br />

				        <asp:TextBox ID="brand" runat="server" placeholder="Enter Product Name"></asp:TextBox>
				       
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ErrorMessage="Brand NAme Must Be Filled" ControlToValidate="brand" ForeColor="#CC0000"></asp:RequiredFieldValidator>
 
                        <br />
                        <asp:Image ID="Image1" runat="server"  Width="100px" Height="100px" />
                        <asp:FileUpload ID="PhotoUploadControl1" runat="server" />
                
                        <br />
                        <asp:Image ID="Image2" runat="server"  Width="100px" Height="100px" />
                        <asp:FileUpload ID="PhotoUploadControl2" runat="server" />
			   
                        <br />
                        <asp:Image ID="Image3" runat="server"  Width="100px" Height="100px" />
                        <asp:FileUpload ID="PhotoUploadControl3" runat="server" />
			    
					    <asp:TextBox ID="weight" runat="server" placeholder="Enter Description"></asp:TextBox>
				        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                            ErrorMessage="Description Must Be Filled" ControlToValidate="weight" ForeColor="#CC0000"></asp:RequiredFieldValidator>

					     <asp:TextBox ID="price" runat="server" placeholder="Enter Price"></asp:TextBox>
				       
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Enter Price" ForeColor="#CC0000" ControlToValidate="price"></asp:RequiredFieldValidator>
				        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                ErrorMessage="Only Number Allowed" ValidationExpression="[0-9]*" 
                                ControlToValidate="price" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                
					     <asp:TextBox ID="off_price" runat="server" placeholder="Enter Offer Price"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Enter Offer Price" ForeColor="#CC0000" ControlToValidate="off_price"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ErrorMessage="Only Number Allowed" ValidationExpression="[0-9]*" 
                                ControlToValidate="off_price" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="stock_qty" runat="server" placeholder="Enter Stock Qty"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Stock Qty" ForeColor="#CC0000" ControlToValidate="stock_qty"></asp:RequiredFieldValidator>
				        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Only Number Allowed" ValidationExpression="[0-9]*" 
                        ControlToValidate="stock_qty" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                         <br />

					     <asp:Button ID="edit" runat="server" Text="Update Product Details" 
                            onclick="edit_Click" />
					</div>
					
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>
