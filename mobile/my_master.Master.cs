using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace mobile
{
    public partial class my_master : System.Web.UI.MasterPage
    {
        public string cart_tot;
        protected void Page_Load(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();
            if (Session["adminlogin"] != null)
            {
                string email = Convert.ToString(Session["adminlogin"]);
                SqlDataReader myReader = null;
                SqlCommand objselect2 = new SqlCommand("select * from admin_signup where email_id ='" + email + "'", obj);
                myReader = objselect2.ExecuteReader();
                myReader.Read();
                HyperLink1.Visible = true;
                HyperLink1.NavigateUrl = "#";
                HyperLink1.Text = (myReader["name"].ToString());
                myReader.Close();

                HyperLink3.Visible = true;
                HyperLink3.NavigateUrl = "admin_password.aspx";
                HyperLink3.Text = "Change Password";
                HyperLink4.Visible = true;
                HyperLink4.NavigateUrl = "logout.aspx";
                HyperLink4.Text = "Logout";

                HyperLink5.Visible = true;
                HyperLink5.NavigateUrl = "add_category.aspx";
                HyperLink5.Text = "Category";
                HyperLink6.Visible = true;
                HyperLink6.NavigateUrl = "add_sub_catg.aspx";
                HyperLink6.Text = "Sub Category";
                HyperLink7.Visible = true;
                HyperLink7.NavigateUrl = "add_product.aspx";
                HyperLink7.Text = "Product";
                HyperLink8.Visible = true;
                HyperLink8.NavigateUrl = "all_products.aspx";
                HyperLink8.Text = "All Products";
                rptdept.Visible = false;
                HyperLink10.Visible = false;

                HyperLink11.Visible = true;
                HyperLink11.NavigateUrl = "all_orders.aspx";
                HyperLink11.Text = "All Orders";
                HyperLink2.Visible = true;
                HyperLink2.NavigateUrl = "all_feedback.aspx";
                HyperLink2.Text = "All Feedback";

            }
            else if (Session["user_login"] != null)
            {
                string email = Convert.ToString(Session["user_login"]);
                SqlDataReader myReader = null;
                SqlCommand objselect2 = new SqlCommand("select * from user_signup where email_id ='" + email + "'", obj);
                myReader = objselect2.ExecuteReader();
                myReader.Read();
                HyperLink1.Visible = true;
                HyperLink1.NavigateUrl = "#";
                HyperLink1.Text = (myReader["name"].ToString());
                myReader.Close();

                SqlCommand objsel_add = new SqlCommand("select count(*) from add_to_cart where cust_email_id='" + email + "'", obj);
                cart_tot = objsel_add.ExecuteScalar().ToString();

                HyperLink5.Visible = true;
                HyperLink5.NavigateUrl = "Default.aspx";
                HyperLink5.Text = "Home";

                HyperLink2.Visible = true;
                HyperLink2.NavigateUrl = "my_orders.aspx";
                HyperLink2.Text = "My Order";
                

                HyperLink9.Visible = true;
                HyperLink9.NavigateUrl = "checkout.aspx";
                HyperLink3.Visible = true;
                HyperLink3.NavigateUrl = "user_password.aspx";
                HyperLink3.Text = "Change Password";
                HyperLink4.Visible = true;
                HyperLink4.NavigateUrl = "logout.aspx";
                HyperLink4.Text = "Logout";
                HyperLink7.Visible = true;
                HyperLink7.NavigateUrl = "feedback.aspx";
                HyperLink7.Text = "Feedback";
                HyperLink6.Visible = true;
                HyperLink6.NavigateUrl = "contact.aspx";
                HyperLink6.Text = "Contact Us";
            }
            else
            {
                
                HyperLink3.Visible = true;
                HyperLink3.NavigateUrl = "user_login.aspx";
                HyperLink3.Text = "User Login";
                HyperLink4.Visible = true;
                HyperLink4.NavigateUrl = "admin_login.aspx";
                HyperLink4.Text = "Admin Login";

                HyperLink5.Visible = true;
                HyperLink5.NavigateUrl = "Default.aspx";
                HyperLink5.Text = "Home";
                HyperLink6.Visible = true;
                HyperLink6.NavigateUrl = "contact.aspx";
                HyperLink6.Text = "Contact Us";

                HyperLink7.Visible = true;
                HyperLink7.NavigateUrl = "feedback.aspx";
                HyperLink7.Text = "Feedback";
            }
        }
    }
}