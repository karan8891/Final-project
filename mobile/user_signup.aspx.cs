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
    public partial class user_signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void reg_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();
            SqlCommand objselect = new SqlCommand("select count(*) from user_signup where email_id='" + email_id.Text + "'", obj);
            int a = Convert.ToInt32(objselect.ExecuteScalar().ToString());
            if (a > 0)
            {
                Response.Write(@"<script language='javascript'>alert('UserName Already Exist Try Another User Name');</script>");

            }
            else
            {
                SqlCommand objcmd = new SqlCommand("insert into user_signup(name,email_id,mobile,password,state,city,pincode,address,seq_question,seq_ans) values ('" + name.Text + "','" + email_id.Text + "','" + mob_no.Text + "','" + pass.Text + "','" + state.Text + "','" + city.Text + "','" + pincode.Text + "','" + address.Text + "','" + seq_ques.SelectedValue + "','" + sec_ans.Text + "')", obj);
                objcmd.ExecuteNonQuery();
                Response.Write(@"<script language='javascript'>alert('You Are Successfully Registered');window.location.href='user_login.aspx';</script>");

            }
        }

        protected void mob_no_TextChanged(object sender, EventArgs e)
        {

        }
    }
}