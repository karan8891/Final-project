<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="admin_signup.aspx.cs" Inherits="mobile.admin_signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- banner-2 -->
	
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Admin Signup
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
						<asp:TextBox ID="name" runat="server" placeholder="Name"></asp:TextBox>               
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Name Must Be Filled" ControlToValidate="name" ForeColor="#CC0000"></asp:RequiredFieldValidator>
				        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Only Alphabets Are Allowed" ValidationExpression="[a-zA-Z ]*$" 
                        ControlToValidate="name" ForeColor="#CC0000"></asp:RegularExpressionValidator>
					    <asp:TextBox ID="mob_no" runat="server" class="textbox" placeholder="Mobile No."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Mobile Number Must Be Filled" ControlToValidate="mob_no" 
                        ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ErrorMessage="Only Number Allowed" ValidationExpression="[0-9]*" 
                        ControlToValidate="mob_no" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "mob_no" ForeColor="#CC0000" ID="RegularExpressionValidator3" ValidationExpression = "^[\s\S]{10,10}$" runat="server" ErrorMessage="Enter 10 Digit"></asp:RegularExpressionValidator>
					    <asp:TextBox ID="email_id" runat="server" class="textbox" placeholder="E-Mail"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Email-Id Must Be Filled" ControlToValidate="email_id" ForeColor="#CC0000"></asp:RequiredFieldValidator>
			            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Email must contain @,_ etc" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="email_id" ForeColor="#CC0000"></asp:RegularExpressionValidator>
					    <asp:TextBox ID="pass" runat="server" TextMode="password" placeholder="PassWord"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Password Must Be Filled" ControlToValidate="pass" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "pass" ID="RegularExpressionValidator5" ForeColor="#CC0000" ValidationExpression = "^[\s\S]{8,}$" runat="server" ErrorMessage="Minimum 8 characters required."></asp:RegularExpressionValidator>
					    <asp:TextBox ID="c_pass" runat="server" TextMode="password" placeholder="Confirm PassWord"></asp:TextBox>	         
					    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirm Password Must Be Filled" ControlToValidate="c_pass" ForeColor="#CC0000"></asp:RequiredFieldValidator>        
                        <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "c_pass" ID="RegularExpressionValidator6" ForeColor="#CC0000" ValidationExpression = "^[\s\S]{8,}$" runat="server" ErrorMessage="Minimum 8 characters required."></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="PassWord Does Not Match" ControlToCompare="pass" ControlToValidate="c_pass" ForeColor="#CC0000"></asp:CompareValidator>
                        <asp:DropDownList ID="seq_ques" runat="server" 
                        Width="100%">
                            <asp:ListItem>What is Your Pet Name?</asp:ListItem>
                            <asp:ListItem>What is Your School Name?</asp:ListItem>
                            <asp:ListItem>What is Your DOB?</asp:ListItem>
                            <asp:ListItem>What Is Last Phone Number?</asp:ListItem>
                        </asp:DropDownList>
					    <asp:TextBox ID="sec_ans" runat="server" placeholder="Enter Your Answer....."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Answer Must Be Filled" ControlToValidate="sec_ans" ForeColor="#CC0000"></asp:RequiredFieldValidator>
					    <br />
                        <asp:Button ID="reg" runat="server" Text="Register" onclick="reg_Click" />
                        
					</div>
					
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>
