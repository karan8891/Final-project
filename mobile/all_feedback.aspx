<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="all_feedback.aspx.cs" Inherits="mobile.all_feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- banner-2 -->
	
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">All Feedback
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
					
                    <asp:GridView ID="GridView1" runat="server" 
                            AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource1" ForeColor="#333333" Width="100%" HorizontalAlign="Center">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="id" Visible="False" />
                                <asp:TemplateField HeaderText="SNO">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex +1 %>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                <asp:BoundField DataField="email_id" HeaderText="Email Id" 
                                    SortExpression="email_id" />
                                <asp:BoundField DataField="message" HeaderText="Message" 
                                    SortExpression="message" />
                            </Columns>
                            <FooterStyle BackColor="#FF6666" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#E45E33" Font-Bold="True" ForeColor="White" 
    HorizontalAlign="Center" />
        
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:sqlconnection %>" 
                                  
            SelectCommand="SELECT * FROM [feedback]"></asp:SqlDataSource>
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>
