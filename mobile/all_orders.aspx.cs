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
    public partial class all_orders : System.Web.UI.Page
    {
        public int t_qty = 0;
        public int t_price = 0;
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
                SqlCommand objsel_count = new SqlCommand("select count(*) from sale", obj);
                int a = Convert.ToInt32(objsel_count.ExecuteScalar().ToString());
                if (a > 0)
                {
                    Label1.Visible = true;
                    Label2.Visible = true;
                    t_qty1.Visible = true;
                    t_price1.Visible = true;
                }
                else
                {
                    Label3.Visible = true;
                }

                SqlDataReader myReader = null;
                SqlCommand objselect2 = new SqlCommand("select * from sale", obj);
                myReader = objselect2.ExecuteReader();
                while (myReader.Read())
                {
                    t_qty = t_qty + Int32.Parse(myReader["qty"].ToString());
                    t_price = t_price + Int32.Parse(myReader["price"].ToString());
                }
                myReader.Close();
                t_qty1.Text = t_qty.ToString();
                t_price1.Text = t_price.ToString();

                SqlCommand objselect = new SqlCommand("select a.dated,a.payment_mode,a.id,a.qty,a.price,b.image1,b.brand,c.category,d.name,d.email_id,d.address,d.mobile,e.sub_category from sale a, pro_detail b,category c ,user_signup d,sub_category e where b.id=a.pro_id and c.id = b.category_id and d.email_id = a.cust_email_id and e.id = b.sub_category_id Order By a.dated DESC", obj);
                SqlDataAdapter da = new SqlDataAdapter(objselect);
                DataSet ds = new DataSet();
                da.Fill(ds, "id");
                da.Fill(ds, "category");
                da.Fill(ds, "sub_category");
                da.Fill(ds, "brand");
                da.Fill(ds, "image1");
                da.Fill(ds, "qty");
                da.Fill(ds, "price");
                da.Fill(ds, "payment_mode");
                da.Fill(ds, "dated");
                da.Fill(ds, "name");
                da.Fill(ds, "email_id");
                da.Fill(ds, "address");
                da.Fill(ds, "mobile");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
    }
}