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
                Label1.Text = "Здравейте, " + Session["username"].ToString() + "! Добре дошли в онлайн каталог за книги: KG E-books!  Датата и часът са: " + DateTime.Now + " Вашият браузър е: " + Request.Browser.Browser;

            }
            else
            {
                Label1.Text = "Здравейте! Добре дошли в онлайн каталог за книги: KG E-books!";
            }

            BookStoreCatalog.CurrentPage = "Начало";
        }
    }
}