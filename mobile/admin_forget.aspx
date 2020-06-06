<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="admin_forget.aspx.cs" Inherits="mobile.admin_forget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- banner-2 -->

	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Admin Forget Password
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
                        ErrorMessage="Email-Id Must Be Filled" ControlToValidate="email_id" ForeColor="#CC0000"></asp:RequiredFieldValidator>
				        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Email must contain @,_ etc" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="email_id" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                        <asp:DropDownList ID="seq_ques" runat="server" 
                            Width="100%" >
                            <asp:ListItem>What is Your Pet Name?</asp:ListItem>
                            <asp:ListItem>What is Your School Name?</asp:ListItem>
                            <asp:ListItem>What is Your DOB?</asp:ListItem>
                            <asp:ListItem>What Is Last Phone Number?</asp:ListItem>
                        </asp:DropDownList>
                        <br />
					    <asp:TextBox ID="sec_ans" runat="server" placeholder="Enter Your Answer....."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Answer Must Be Filled" ControlToValidate="sec_ans" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <br />
					    <asp:Button ID="signin" runat="server" Text="Submit" onclick="signin_Click" />
			            <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
					</div>
					
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>