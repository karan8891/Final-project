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
    public partial class add_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminlogin"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();

            string filename1 = "";
            string filename2 = "";
            string filename3 = "";

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

            SqlCommand objcmd = new SqlCommand("insert into pro_detail(category_id,sub_category_id,brand,weight,image1,image2,image3,price,off_price,tot_qty) values ('" + category.SelectedValue + "','" + sub_category.SelectedValue + "','" + brand.Text + "','" + weight.Text + "','" + filename1 + "','" + filename2 + "','" + filename3 + "','" + price.Text + "','" + off_price.Text + "','" + stock_qty.Text + "')", obj);
            objcmd.ExecuteNonQuery();
            Response.Write(@"<script language='javascript'>alert('Product Details Successfully Saved');window.location.href='add_product.aspx';</script>");

        }
    }
}