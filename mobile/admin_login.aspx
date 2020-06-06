<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="mobile.admin_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- banner-2 -->
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Admin Login
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
						<asp:TextBox ID="email_id" runat="server" class="textbox" placeholder="E-Mail"></asp:TextBox>
					
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Email-Id Must Be Filled" ControlToValidate="email_id" 
                            ForeColor="#CC0000" ValidationGroup="log"></asp:RequiredFieldValidator>
				        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Email must contain @,_ etc" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="email_id" ForeColor="#CC0000" ValidationGroup="log"></asp:RegularExpressionValidator>
					    <asp:TextBox ID="pass" runat="server" TextMode="password" placeholder="PassWord"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Password Must Be Filled" ControlToValidate="pass" 
                            ForeColor="#CC0000" ValidationGroup="log"></asp:RequiredFieldValidator>
					    <br />
                        <asp:Button ID="signin" runat="server" Text="Log In" onclick="signin_Click" 
                            ValidationGroup="log" />
                        <asp:Button ID="Button1" runat="server" Text="SignUp" onclick="Button1_Click" />
				        &nbsp;&nbsp;
                        <br />
				        <a href="admin_forget.aspx" class=" hvr-skew-backward">Forgot Password</a>
					</div>
					
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>

