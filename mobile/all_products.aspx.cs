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
    public partial class all_products : System.Web.UI.Page
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
                string sno = Request.QueryString["sno"];
                SqlCommand objcmd = new SqlCommand("delete from pro_detail where id ='" + sno + "'", obj);
                objcmd.ExecuteNonQuery();
                SqlCommand del1 = new SqlCommand("delete from sale where pro_id ='" + sno + "'", obj);
                del1.ExecuteNonQuery();
                SqlCommand del2 = new SqlCommand("delete from add_to_cart where pro_id ='" + sno + "'", obj);
                del2.ExecuteNonQuery();
                Response.Write(@"<script language='javascript'>alert('Product Deleted Successfully');window.location.href='all_products.aspx';</script>");
            }
        }
    }
}