<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="user_login.aspx.cs" Inherits="mobile.user_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- banner-2 -->
	
	<!-- contact page -->
    
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">User Login
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
                    </div>
					<div class="contact-form wthree">
						<asp:TextBox ID="email_id" runat="server" class="textbox" placeholder="E-Mail"></asp:TextBox>
					
				        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Email must contain @,_ etc" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="email_id" ForeColor="#CC0000" ValidationGroup="log"></asp:RegularExpressionValidator>
					    <asp:TextBox ID="pass" runat="server" TextMode="password" placeholder="PassWord" OnTextChanged="pass_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Password Must Be Filled" ControlToValidate="pass" 
                            ForeColor="#CC0000" ValidationGroup="log"></asp:RequiredFieldValidator>
					    <br />
                        <asp:Button ID="signin" runat="server" Text="Log In" onclick="signin_Click" 
                            ValidationGroup="log" />
                        &nbsp;<br />
                        <a href="user_forget.aspx" class=" hvr-skew-backward">Forgot Password</a><br />
&nbsp;<asp:Button ID="Button1" runat="server" Text="SignUp" onclick="Button1_Click" Height="47px" Width="190px" />
					</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	</div>
</asp:Content>