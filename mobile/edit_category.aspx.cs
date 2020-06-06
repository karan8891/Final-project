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
    public partial class edit_category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
                SqlConnection obj = new SqlConnection(conn);
                obj.Open();
                string sno = Request.QueryString["sno"];
                SqlDataReader myReader = null;
                SqlCommand objselect = new SqlCommand("select * from category where id='" + sno + "'", obj);
                myReader = objselect.ExecuteReader();
                myReader.Read();
                category.Text = (myReader["category"].ToString());
                myReader.Close();

            }
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();
            string category_final = category.Text.ToUpper();
            string sno = Request.QueryString["sno"];

            SqlCommand objselect = new SqlCommand("select count(*) from category where category ='" + category_final + "' and id !='" + sno + "'", obj);
            int a = Convert.ToInt32(objselect.ExecuteScalar().ToString());
            if (a > 0)
            {
                Response.Write(@"<script language='javascript'>alert('Category Already Exist.');</script>");
            }
            else
            {
                SqlCommand objcmd = new SqlCommand("update category set category='" + category_final + "' where id ='" + sno + "'", obj);
                objcmd.ExecuteNonQuery();
                Response.Write(@"<script language='javascript'>alert('Category Successfully Updated');window.location.href='add_category.aspx';</script>");
            }
        }
    }
}