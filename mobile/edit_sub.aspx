<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="edit_sub.aspx.cs" Inherits="mobile.edit_sub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- banner-2 -->
	
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Edit Sub Category
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
					    <asp:TextBox ID="sub_category" runat="server" placeholder="Enter Sub Category"></asp:TextBox>
					    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Sub Category Must Be Filled" ControlToValidate="sub_category" ForeColor="#CC0000"></asp:RequiredFieldValidator>
				        <br />
                        <asp:Image ID="Image1" runat="server"  Width="100px" Height="100px" />
                        <asp:FileUpload ID="PhotoUploadControl1" runat="server" />
                
			            <br />
					    <asp:Button ID="edit" runat="server" Text="Update Sub Category" onclick="edit_Click"/>
					</div>
					
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>
