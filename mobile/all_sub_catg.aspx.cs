using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mobile
{
    public partial class all_sub_catg : System.Web.UI.Page
    {
        public string category_sno;
        protected void Page_Load(object sender, EventArgs e)
        {
            category_sno = Request.QueryString["category_sno"];
        }

        protected void rptdept_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rptdept_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            
        }
    }
}