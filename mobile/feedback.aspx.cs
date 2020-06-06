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
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void save_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();

            SqlCommand objcmd = new SqlCommand("insert into feedback(name,email_id,message) values ('" + name.Text + "','" + email.Text + "','" + message.Text + "')", obj);
            objcmd.ExecuteNonQuery();
            Response.Write(@"<script language='javascript'>alert('Feedback Saved');window.location.href='contact.aspx';</script>");

        }
    }
}