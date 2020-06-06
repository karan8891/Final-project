<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="user_password.aspx.cs" Inherits="mobile.user_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- banner-2 -->
	
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Change Password
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
						<asp:TextBox ID="o_pass" runat="server" TextMode="password" placeholder="Enter Old PassWord"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Password Must Be Filled" ControlToValidate="o_pass" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "o_pass" ID="RegularExpressionValidator5" ForeColor="#CC0000" ValidationExpression = "^[\s\S]{8,}$" runat="server" ErrorMessage="Minimum 8 characters required."></asp:RegularExpressionValidator>
					    <asp:TextBox ID="n_pass" runat="server" TextMode="password" placeholder="Enter New PassWord"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Password Must Be Filled" ControlToValidate="n_pass" ForeColor="#CC0000"></asp:RequiredFieldValidator>
					    <asp:TextBox ID="c_pass" runat="server" TextMode="password" placeholder="Enter Confirm PassWord"></asp:TextBox>
                        <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "n_pass" ID="RegularExpressionValidator1" ForeColor="#CC0000" ValidationExpression = "^[\s\S]{8,}$" runat="server" ErrorMessage="Minimum 8 characters required."></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirm Password Must Be Filled" ControlToValidate="c_pass" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "c_pass" ID="RegularExpressionValidator6" ForeColor="#CC0000" ValidationExpression = "^[\s\S]{8,}$" runat="server" ErrorMessage="Minimum 8 characters required."></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="PassWord Do Not Match" ControlToCompare="n_pass" ControlToValidate="c_pass" ForeColor="#CC0000"></asp:CompareValidator>                
                        <br />
					    <asp:Button ID="change" runat="server" Text="Update Password" onclick="change_Click" />
					</div>
					
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>
