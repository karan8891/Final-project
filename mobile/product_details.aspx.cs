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
    public partial class product_details : System.Web.UI.Page
    {
        public string image1;
        public string image2;
        public string image3;
        public string category;
        public string sub_category;
        public string shw_brand;
        public string shw_weight;
        public string price;
        public string offer_price;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
                SqlConnection obj = new SqlConnection(conn);
                obj.Open();
                string pro_sno = Request.QueryString["pro_sno"];
                SqlDataReader myReader = null;
                SqlCommand objselect = new SqlCommand("select * from pro_detail where id='" + pro_sno + "'", obj);
                myReader = objselect.ExecuteReader();
                myReader.Read();
                string category_sno = (myReader["category_id"].ToString());
                string sub_category_sno = (myReader["sub_category_id"].ToString());

                shw_brand = (myReader["brand"].ToString());
                shw_weight = (myReader["weight"].ToString());
                price = (myReader["price"].ToString());
                sale_price.Text = (myReader["off_price"].ToString());
                image1 = (myReader["image1"].ToString());
                image2 = (myReader["image2"].ToString());
                image3 = (myReader["image3"].ToString());
                myReader.Close();
                SqlDataReader myReader2 = null;
                SqlCommand objselect2 = new SqlCommand("select * from category where id='" + category_sno + "'", obj);
                myReader2 = objselect2.ExecuteReader();
                myReader2.Read();
                category = (myReader2["category"].ToString());
                myReader2.Close();
                SqlDataReader myReader3 = null;
                SqlCommand objselect3 = new SqlCommand("select * from sub_category where id='" + sub_category_sno + "'", obj);
                myReader3 = objselect3.ExecuteReader();
                myReader3.Read();
                sub_category = (myReader3["sub_category"].ToString());
                myReader3.Close();
            }
        }

        protected void add_to_cart_Click(object sender, EventArgs e)
        {
            if (Session["user_login"] == null)
            {
                Response.Redirect("user_login.aspx");
            }
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();
            string pro_sno = Request.QueryString["pro_sno"];
            string email = Convert.ToString(Session["user_login"]);
            int quantity = Int32.Parse(qty.Text);
            int off_price = Int32.Parse(sale_price.Text);
            int total_price = quantity * off_price;
            SqlCommand objcmd = new SqlCommand("insert into add_to_cart(cust_email_id,pro_id,qty,price) values ('" + email + "','" + pro_sno + "','" + qty.Text + "','" + total_price + "')", obj);
            objcmd.ExecuteNonQuery();
            Response.Write(@"<script language='javascript'>alert('Product Successfully Added To Cart');window.location.href='product_details.aspx?pro_sno=" + pro_sno + "';</script>");
        }
    }
}