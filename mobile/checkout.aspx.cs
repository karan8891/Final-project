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
    public partial class checkout : System.Web.UI.Page
    {
        public int t_qty = 0;
        public int t_price = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_login"] == null)
            {
                Response.Redirect("user_login.aspx");
            }
            if (payment_mode.SelectedValue == "Credit Card")
            {
                cr_card_pan.Visible = true;
                net_bank_pan.Visible = false;

            }
            else if (payment_mode.SelectedValue == "Debit Card")
            {
                cr_card_pan.Visible = true;
                net_bank_pan.Visible = false;

            }
            else if (payment_mode.SelectedValue == "Net Banking")
            {
                cr_card_pan.Visible = false;
                net_bank_pan.Visible = true;

            }
            else
            {
                cr_card_pan.Visible = false;
                net_bank_pan.Visible = false;
            }

            if (!IsPostBack)
            {
                string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
                SqlConnection obj = new SqlConnection(conn);
                obj.Open();
                string email = Convert.ToString(Session["user_login"]);
                SqlCommand objsel_count = new SqlCommand("select count(*) from add_to_cart where cust_email_id='" + email + "'", obj);
                int a = Convert.ToInt32(objsel_count.ExecuteScalar().ToString());
                if (a > 0)
                {
                    Label1.Visible = true;
                    Label2.Visible = true;
                    t_qty1.Visible = true;
                    t_price1.Visible = true;
                    place.Visible = true;
                    panel1.Visible = true;

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }

                SqlDataReader myReader = null;
                SqlCommand objselect2 = new SqlCommand("select * from add_to_cart where cust_email_id='" + email + "'", obj);
                myReader = objselect2.ExecuteReader();
                while (myReader.Read())
                {
                    t_qty = t_qty + Int32.Parse(myReader["qty"].ToString());
                    t_price = t_price + Int32.Parse(myReader["price"].ToString());
                }
                myReader.Close();
                t_qty1.Text = t_qty.ToString();
                t_price1.Text = t_price.ToString();

                SqlCommand objselect = new SqlCommand("select a.id,a.qty,a.price,b.image1,b.brand,c.category,d.sub_category from add_to_cart a, pro_detail b,category c, sub_category d where b.id=a.pro_id and c.id = b.category_id and d.id = b.sub_category_id and a.cust_email_id = '" + email + "' ", obj);
                SqlDataAdapter da = new SqlDataAdapter(objselect);
                DataSet ds = new DataSet();
                da.Fill(ds, "id");
                da.Fill(ds, "category");
                da.Fill(ds, "sub_category");
                da.Fill(ds, "brand");
                da.Fill(ds, "image1");
                da.Fill(ds, "qty");
                da.Fill(ds, "price");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

            if (Request.QueryString["sno"] != null)
            {
                string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
                SqlConnection obj = new SqlConnection(conn);
                obj.Open();
                string sno = Request.QueryString["sno"];
                
                SqlCommand objupdate = new SqlCommand("delete from add_to_cart where id ='" + sno + "'", obj);
                objupdate.ExecuteNonQuery();

                Response.Write(@"<script language='javascript'>alert('Cart Item Successfully Deleted');window.location.href='checkout.aspx';</script>");
            }
        }

        protected void place_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
            SqlConnection obj = new SqlConnection(conn);
            obj.Open();

            string email = Convert.ToString(Session["user_login"]);
            SqlDataReader myReader = null;
            SqlCommand objselect = new SqlCommand("select * from add_to_cart where cust_email_id='" + email + "'", obj);
            myReader = objselect.ExecuteReader();
            string dated = DateTime.Now.ToString("yyyy-MM-dd");
            SqlConnection obj2 = new SqlConnection(conn);
            obj2.Open();
            while (myReader.Read())
            {
                string sale_pro_sno = (myReader["pro_id"].ToString());
                string sale_qty = (myReader["qty"].ToString());
                string sale_price = (myReader["price"].ToString());
                SqlCommand objinsert2 = new SqlCommand("insert into sale (cust_email_id,pro_id,qty,price,payment_mode,dated) values ('" + email + "','" + sale_pro_sno + "','" + sale_qty + "','" + sale_price + "','" + payment_mode.SelectedValue + "','" + dated + "')", obj2);
                objinsert2.ExecuteNonQuery();

                SqlCommand objcmd = new SqlCommand("update pro_detail set tot_qty = tot_qty - '" + Int32.Parse(sale_qty) + "'  where id = '" + sale_pro_sno + "'", obj2);
                objcmd.ExecuteNonQuery();
                
            }
            myReader.Close();

            SqlCommand objdelete = new SqlCommand("delete from add_to_cart where cust_email_id='" + email + "'", obj);
            objdelete.ExecuteNonQuery();
            Response.Write(@"<script language='javascript'>alert('Your Order Placed Successfully');window.location.href='my_orders.aspx';</script>");

        }
    }
}