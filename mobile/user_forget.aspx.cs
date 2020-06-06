using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace mobile
{
    public partial class user_forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signin_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            SqlConnection obj2 = new SqlConnection(conn);
            obj.Open();
            obj2.Open();
            Label1.Visible = true;

            SqlCommand objselect2 = new SqlCommand("select count(*) from user_signup where email_id='" + email_id.Text + "' and seq_question ='" + seq_ques.SelectedValue + "' and seq_ans = '" + sec_ans.Text + "' ", obj);
            int a = Convert.ToInt32(objselect2.ExecuteScalar().ToString());
            if (a > 0)
            {
                SqlDataReader myReader = null;
                SqlCommand objselect = new SqlCommand("select * from user_signup where email_id='" + email_id.Text + "' and seq_question ='" + seq_ques.SelectedValue + "' and seq_ans = '" + sec_ans.Text + "'", obj);
                myReader = objselect.ExecuteReader();
                myReader.Read();
                string password = (myReader["password"].ToString());
                myReader.Close();
                Label1.Text = "Your Password Is : " + password;
            }
            else
            {
                Label1.Text = " Either Email Address Not Registered Or Your Answer Is Incorrect";
            }
        }
    }
}