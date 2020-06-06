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
    public partial class admin_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminlogin"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void change_Click(object sender, EventArgs e)
        {
            string email = Convert.ToString(Session["adminlogin"]);
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();
            SqlCommand objselect = new SqlCommand("select count(*) from admin_signup where email_id='" + email + "' and password='" + o_pass.Text + "'", obj);
            int a = Convert.ToInt32(objselect.ExecuteScalar().ToString());
            if (a > 0)
            {
                SqlCommand objcmd = new SqlCommand("update admin_signup set password = '" + n_pass.Text + "' where email_id = '" + email + "'", obj);
                objcmd.ExecuteNonQuery();
                Response.Write(@"<script language='javascript'>alert('PassWord Successfully Changed'); window.location.href='Default.aspx';</script>");

            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Old Password Is Incorrect');</script>");

            }
        }
    }
}