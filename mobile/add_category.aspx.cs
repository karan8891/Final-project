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
    public partial class add_category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminlogin"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (Request.QueryString["sno"] != null)
            {
                string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
                SqlConnection obj = new SqlConnection(conn);
                obj.Open();
                SqlConnection obj2 = new SqlConnection(conn);
                obj2.Open();
                string sno = Request.QueryString["sno"];


                SqlDataReader myReader = null;
                SqlCommand objselect = new SqlCommand("select * from pro_detail where category_id='" + sno + "'", obj);
                myReader = objselect.ExecuteReader();
                while (myReader.Read())
                {
                    string pro_sno = (myReader["id"].ToString());
                    SqlCommand objcmd = new SqlCommand("delete from pro_detail where id ='" + pro_sno + "'", obj2);
                    objcmd.ExecuteNonQuery();
                    SqlCommand objcmd2 = new SqlCommand("delete from sale where pro_id ='" + pro_sno + "'", obj2);
                    objcmd2.ExecuteNonQuery();
                    SqlCommand objcmd3 = new SqlCommand("delete from add_to_cart where pro_id ='" + pro_sno + "'", obj2);
                    objcmd3.ExecuteNonQuery();
                    
                }
                myReader.Close();
                SqlCommand objcmd5 = new SqlCommand("delete from sub_category where category_id ='" + sno + "'", obj2);
                objcmd5.ExecuteNonQuery();
                SqlCommand objcmd4 = new SqlCommand("delete from category where id ='" + sno + "'", obj);
                objcmd4.ExecuteNonQuery();

                Response.Write(@"<script language='javascript'>alert('Category Deleted Successfully');window.location.href='add_category.aspx';</script>");
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();
            string category_final = category.Text.ToUpper();


            SqlCommand objselect = new SqlCommand("select count(*) from category where category ='" + category_final + "'", obj);
            int a = Convert.ToInt32(objselect.ExecuteScalar().ToString());
            if (a > 0)
            {
                Response.Write(@"<script language='javascript'>alert('Category Already Exist.');</script>");
            }
            else
            {
                SqlCommand objcmd = new SqlCommand("insert into category(category) values ('" + category_final + "')", obj);
                objcmd.ExecuteNonQuery();
                Response.Write(@"<script language='javascript'>alert('Category Successfully Saved');window.location.href='add_category.aspx';</script>");

            }
        }
    }
}