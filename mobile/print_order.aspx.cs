using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace mobile
{
    public partial class print_order : System.Web.UI.Page
    {
        public string inv_no;
        public string dated;
        public string name;
        public string contact;
        public string address;
        public string email;
        public string payment_method;
        public string item;
        public string price;
        public string total;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminlogin"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
                SqlConnection obj = new SqlConnection(conn);
                obj.Open();
                string sno = Request.QueryString["sno"];
                

                SqlDataReader myReader = null;
                SqlCommand objselect = new SqlCommand("select a.dated,a.payment_mode,a.id,a.qty,a.price,b.image1,b.brand,c.category,d.name,d.email_id,d.address,d.mobile,e.sub_category from sale a, pro_detail b,category c ,user_signup d,sub_category e where b.id=a.pro_id and c.id = b.category_id and d.email_id = a.cust_email_id and e.id = b.sub_category_id and a.id = '" + sno + "' ", obj);
                myReader = objselect.ExecuteReader();
                myReader.Read();
                inv_no = (myReader["id"].ToString());
                dated = (myReader["dated"].ToString());
                name = (myReader["name"].ToString());
                contact = (myReader["mobile"].ToString());
                address = (myReader["address"].ToString());
                email = (myReader["email_id"].ToString());
                payment_method = (myReader["payment_mode"].ToString());
                item = (myReader["brand"].ToString());
                price = (myReader["price"].ToString());
                total = (myReader["price"].ToString());
                myReader.Close();

            }
        }
    }
}