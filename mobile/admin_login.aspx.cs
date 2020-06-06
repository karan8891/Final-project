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
    public partial class admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signin_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();
            SqlCommand objselect = new SqlCommand("select count(*) from admin_signup where email_id='" + email_id.Text + "' and password='" + pass.Text + "'", obj);
            int a = Convert.ToInt32(objselect.ExecuteScalar().ToString());
            if (a > 0)
            {

                Session["adminlogin"] = email_id.Text;
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Invalid Username Or Password');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_signup.aspx");
        }
    }
}