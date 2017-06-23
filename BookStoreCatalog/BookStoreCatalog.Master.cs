using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BookStoreCatalog.Utilities;

namespace BookStoreCatalog
{
    public partial class BookStoreCatalog : System.Web.UI.MasterPage
    {
        private static int m_loggedUserId;

        private Dictionary<String, String> m_links = new Dictionary<String, String>();

        private static string s_currentPage = "";

        public static string CurrentPage
        {
            get { return s_currentPage; }
            set { s_currentPage = value; }
        }

        public static SqlConnection CreateConnection()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["BookstoreCatalog_1621448ConnectionString"].ConnectionString);
            return connection;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                m_loggedUserId = Convert.ToInt32(Session["userid"]);
                txtPass.Attributes["style"] = "display: none;";
                lbUserName.Text = Session["username"].ToString();
                lbUserName.Attributes["style"] = "font-size: medium;";
                lbPass.Attributes["style"] = "display: none;";
                btnLogin.Attributes["style"] = "display: none;";
                txtUserName.Attributes["style"] = "display: none;";
                m_links["Начало"] = "Home.aspx";
                m_links["Каталог"] = "Catalog.aspx";
                m_links["Моите книги"] = "MyBooks.aspx";
                m_links["Количка"] = "Cart.aspx";

                if (Session["role"].Equals("администратор"))
                {
                    m_links["Администрация"] = "AdminPage.aspx";
                }
            }
            else
            {
                btnLogout.Attributes["style"] = "display: none;";
                m_links["Начало"] = "Home.aspx";
                m_links["Каталог"] = "Catalog.aspx";
                m_links["Регистрация"] = "Registration.aspx";
            }

            List<String> navigationItems = new List<String>();
            foreach (String name in m_links.Keys)
            {
                if (name.Equals(CurrentPage))
                {
                    navigationItems.Add("<li class=\"selected-item\"><a href=\"" + m_links[name] + "\">" + name + "</a></li>");
                }
                else
                {
                    navigationItems.Add("<li><a href=\"" + m_links[name] + "\">" + name + "</a></li>");
                }

            }

            navigationRepeater.DataSource = navigationItems;
            navigationRepeater.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Response.Redirect("Catalog.aspx?Category=" + btn.Text);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection connection = CreateConnection();
            using (connection)
            {
                SqlCommand myCommand = new SqlCommand("UsersP", connection);
                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = "UsersP";

                SqlParameter user_name = new SqlParameter("@user_name", SqlDbType.VarChar);
                user_name.Value = txtUserName.Text;
                myCommand.Parameters.Add(user_name);

                SqlParameter password = new SqlParameter("@password", SqlDbType.VarChar);
                password.Value = txtPass.Text;
                myCommand.Parameters.Add(password);

                try
                {
                    connection.Open();
                    object res = myCommand.ExecuteScalar();
                    if (res == null)
                    {
                        lbMessage.Text = "Грешен потребител или парола!";
                    }
                    else
                    {
                        m_loggedUserId = Convert.ToInt32(res);

                        SqlCommand getEmailCmd = new SqlCommand("SELECT email FROM users WHERE user_id = @user_id");
                        DatabaseHelper.AddParameter(getEmailCmd, "@user_id", SqlDbType.Int, m_loggedUserId);
                        DatabaseHelper.SqlResult result = DatabaseHelper.ExecuteQueryWithResult(getEmailCmd);

                        Session["username"] = txtUserName.Text;
                        Session["email"] = result.GetNextRow()["email"];
                        result.Close();

                        SqlCommand getUserRole = new SqlCommand("SELECT role FROM login WHERE user_id = @user_id");
                        DatabaseHelper.AddParameter(getUserRole, "@user_id", SqlDbType.Int, m_loggedUserId);
                        result = DatabaseHelper.ExecuteQueryWithResult(getUserRole);
                        Session["role"] = result.GetNextRow()["role"];
                        result.Close();

                        Session["userid"] = m_loggedUserId;
                        Response.Redirect("Home.aspx");

                    }
                }
                catch (SqlException ol)
                {
                    lbMessage.Text = ol.Message.ToString();

                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Home.aspx");
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Catalog.aspx?Criteria=" + txtSearchBox.Text);
        }
    }
}