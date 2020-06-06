using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace mobile
{
    public partial class add_sub_catg : System.Web.UI.Page
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
                SqlCommand objselect = new SqlCommand("select * from pro_detail where sub_category_id='" + sno + "'", obj);
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
                SqlCommand objcmd5 = new SqlCommand("delete from sub_category where id ='" + sno + "'", obj2);
                objcmd5.ExecuteNonQuery();

                Response.Write(@"<script language='javascript'>alert('Sub Category Deleted Successfully');window.location.href='add_sub_catg.aspx';</script>");
            
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();
            string sub_category_final = sub_category.Text.ToUpper();


            string filename1 = "";

            if (PhotoUploadControl1.HasFile)
            {
                Random random = new Random();
                filename1 = Convert.ToString(random.Next(10, 200)) + Path.GetFileName(PhotoUploadControl1.PostedFile.FileName);
                PhotoUploadControl1.SaveAs(Server.MapPath("prod_pic/" + filename1));
                filename1 = "prod_pic/" + filename1;
            }

            SqlCommand objselect = new SqlCommand("select count(*) from sub_category where sub_category ='" + sub_category_final + "' and category_id = '" + category.SelectedValue + "'", obj);
            int a = Convert.ToInt32(objselect.ExecuteScalar().ToString());
            if (a > 0)
            {
                Response.Write(@"<script language='javascript'>alert('Sub-Category Already Exist.');</script>");
            }
            else
            {
                SqlCommand objcmd = new SqlCommand("insert into sub_category(category_id,sub_category,image) values ('" + category.SelectedValue + "','" + sub_category_final + "','" + filename1 + "')", obj);
                objcmd.ExecuteNonQuery();
                Response.Write(@"<script language='javascript'>alert('Sub Category Successfully Saved');window.location.href='add_sub_catg.aspx';</script>");
            }
        }
    }
}