using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace mobile
{
    public partial class edit_sub : System.Web.UI.Page
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
                SqlCommand objselect = new SqlCommand("select * from sub_category where id='" + sno + "'", obj);
                myReader = objselect.ExecuteReader();
                myReader.Read();
                category.SelectedValue = (myReader["category_id"].ToString());
                sub_category.Text = (myReader["sub_category"].ToString());
                Image1.ImageUrl = (myReader["image"].ToString());
                myReader.Close();
            }
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();

            string sno = Request.QueryString["sno"];
            string sub_category_final = sub_category.Text.ToUpper();
            string filename1 = Image1.ImageUrl;

            if (PhotoUploadControl1.HasFile)
            {
                Random random = new Random();
                filename1 = Convert.ToString(random.Next(10, 200)) + Path.GetFileName(PhotoUploadControl1.PostedFile.FileName);
                PhotoUploadControl1.SaveAs(Server.MapPath("prod_pic/" + filename1));
                filename1 = "prod_pic/" + filename1;
            }
            
            SqlCommand objselect = new SqlCommand("select count(*) from sub_category where sub_category ='" + sub_category_final + "' and category_id = '" + category.SelectedValue + "' and id !='" + sno + "' ", obj);
            int a = Convert.ToInt32(objselect.ExecuteScalar().ToString());
            if (a > 0)
            {
                Response.Write(@"<script language='javascript'>alert('Sub-Category Already Exist.');</script>");
            }
            else
            {
                SqlCommand objcmd = new SqlCommand("update sub_category set sub_category = '" + sub_category_final + "',category_id = '" + category.SelectedValue + "',image = '" + filename1 + "' where id = '" + sno + "'", obj);
                objcmd.ExecuteNonQuery();
                Response.Write(@"<script language='javascript'>alert('Sub Category Successfully update');window.location.href='add_sub_catg.aspx';</script>");

            }
        }
    }
}