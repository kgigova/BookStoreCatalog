using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStoreCatalog
{
    public partial class Catalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BookStoreCatalog.CurrentPage = "Каталог";
            if (Request.QueryString["Criteria"] != null && Request.QueryString["Criteria"].Length > 0)
            {
                String criteria = Request.QueryString["Criteria"];
                SqlDataSource1.SelectCommand = "sp_select_search";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("criteria", System.Data.DbType.String, criteria);
                SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
                DataList1.DataBind();
            }
        }
    }
}