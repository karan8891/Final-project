<%@ Page Title="" Language="C#" MasterPageFile="~/my_master.Master" AutoEventWireup="true" CodeBehind="add_sub_catg.aspx.cs" Inherits="mobile.add_sub_catg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- banner-2 -->
	
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Add Sub Category
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
                        <asp:FileUpload ID="PhotoUploadControl1" runat="server" />
                
			            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Choose Image" ForeColor="#CC0000" ControlToValidate="PhotoUploadControl1"></asp:RequiredFieldValidator>
					    <br />
                        <asp:Button ID="add" runat="server" Text="Add Sub Category" onclick="add_Click"/>
					</div>
					<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" ForeColor="#333333"  Width="100%" HorizontalAlign="Center">

                        <Columns>
                            <asp:TemplateField HeaderText="Sno">
                            <ItemTemplate>
                            <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                            </asp:TemplateField>
                                     
                                <asp:BoundField DataField="sub_category" HeaderText="Sub-Category" 
                                SortExpression="sub_category" />
                                <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <img src='<%# Eval("image") %>' style="height:100px;width:100px;" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                            <ItemTemplate>
                                    <a href='edit_sub.aspx?sno=<%# Eval("id") %>'>Edit</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <a href='add_sub_catg.aspx?sno=<%# Eval("id") %>'>Delete</a>
                       
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:sqlconnection %>" 
                        SelectCommand="SELECT * FROM [sub_category] WHERE ([category_id] = @category)">
                        <SelectParameters>
                    <asp:ControlParameter ControlID="category" Name="category" 
                        PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    </asp:SqlDataSource>
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	
</asp:Content>
