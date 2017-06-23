using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStoreCatalog
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Label1.Text = "Здравейте, " + Session["username"].ToString() + "!";
                Label2.Text = "Добре дошли в електронна книжарница: KG E-books!"; 
            }
            else
            {
                Label1.Text = "Здравейте!";
                Label2.Text = "Добре дошли в електронна книжарница: KG E-books!"; 
            }

            BookStoreCatalog.CurrentPage = "Начало";
        }
    }
}