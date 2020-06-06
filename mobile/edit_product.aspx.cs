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
    public partial class edit_product : System.Web.UI.Page
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
                SqlCommand objselect = new SqlCommand("select * from pro_detail where id='" + sno + "'", obj);
                myReader = objselect.ExecuteReader();
                myReader.Read();
                category.SelectedValue = (myReader["category_id"].ToString());
                sub_category.SelectedValue = (myReader["sub_category_id"].ToString());
                brand.Text = (myReader["brand"].ToString());
                weight.Text = (myReader["weight"].ToString());
                price.Text = (myReader["price"].ToString());
                off_price.Text = (myReader["off_price"].ToString());
                Image1.ImageUrl = (myReader["image1"].ToString());
                Image2.ImageUrl = (myReader["image2"].ToString());
                Image3.ImageUrl = (myReader["image3"].ToString());
                stock_qty.Text = (myReader["tot_qty"].ToString());
                myReader.Close();

            }
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();

            string sno = Request.QueryString["sno"];
            string filename1 = Image1.ImageUrl;
            string filename2 = Image2.ImageUrl;
            string filename3 = Image3.ImageUrl;
            if (PhotoUploadControl1.HasFile)
            {
                Random random = new Random();
                filename1 = Convert.ToString(random.Next(10, 200)) + Path.GetFileName(PhotoUploadControl1.PostedFile.FileName);
                PhotoUploadControl1.SaveAs(Server.MapPath("prod_pic/" + filename1));
                filename1 = "prod_pic/" + filename1;
            }
            
            if (PhotoUploadControl2.HasFile)
            {
                Random random = new Random();
                filename2 = Convert.ToString(random.Next(10, 200)) + Path.GetFileName(PhotoUploadControl2.PostedFile.FileName);
                PhotoUploadControl2.SaveAs(Server.MapPath("prod_pic/" + filename2));
                filename2 = "prod_pic/" + filename2;
            }
            
            if (PhotoUploadControl3.HasFile)
            {
                Random random = new Random();
                filename3 = Convert.ToString(random.Next(10, 200)) + Path.GetFileName(PhotoUploadControl3.PostedFile.FileName);
                PhotoUploadControl3.SaveAs(Server.MapPath("prod_pic/" + filename3));
                filename3 = "prod_pic/" + filename3;
            }


            SqlCommand objcmd = new SqlCommand("update pro_detail set category_id = '" + category.SelectedValue + "',sub_category_id='" + sub_category.SelectedValue + "',brand ='" + brand.Text + "',weight = '" + weight.Text + "',price = '" + price.Text + "',off_price = '" + off_price.Text + "',tot_qty = '" + stock_qty.Text + "',image1 = '" + filename1 + "',image2 = '" + filename2 + "',image3 = '" + filename3 + "' where id = '" + sno + "'", obj);
            objcmd.ExecuteNonQuery();
            Response.Write(@"<script language='javascript'>alert('Product Successfully Updated');window.location.href='all_products.aspx';</script>");

        }
    }
}