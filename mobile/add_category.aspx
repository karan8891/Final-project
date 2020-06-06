<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="add_category.aspx.cs" Inherits="mobile.add_category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- banner-2 -->
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Add Category
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
						<asp:TextBox ID="category" runat="server" placeholder="Enter Category"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Category Must Be Filled" ControlToValidate="category" ForeColor="#CC0000"></asp:RequiredFieldValidator>
				        <br />
                        <asp:Button ID="add" runat="server" Text="Add Category" onclick="add_Click"/>
					</div>
					<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="#FF5722"  Width="100%" 
                        HorizontalAlign="Center">
                            <Columns>
                                <asp:TemplateField HeaderText="Sno">
                                <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="category" HeaderText="Category" 
                                    SortExpression="category" />
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <a href='edit_category.aspx?sno=<%# Eval("id") %>'>Edit</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <a href='add_category.aspx?sno=<%# Eval("id") %>'>Delete</a>
                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                      
                            </Columns>
                            <FooterStyle BackColor="#FF6666" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#FF5722" Font-Bold="True" ForeColor="White" 
                                HorizontalAlign="Center" />
       
                            <RowStyle BackColor="#FFFFCC" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:sqlconnection %>" 
                        SelectCommand="SELECT [id], [category] FROM [category]">
                    </asp:SqlDataSource>
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>
