using System;
using System.Collections.Generic;
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
    public partial class Registration : System.Web.UI.Page
    {
        private int m_userId = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                m_userId = Convert.ToInt32(Session["userid"]);
            }

            BookStoreCatalog.CurrentPage = "Регистрация";
        }

        private static String checkUserExistsSQL =
            "SELECT * FROM login WHERE user_name = @user_name";

        protected void btnReg_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text.Length > 0 &&
                txtPass.Text.Length > 0 &&
                txtLName.Text.Length > 0 &&
                txtName.Text.Length > 0 &&
                txtEmail.Text.Length > 0)
            {
                SqlCommand checkUsernameExistsCmd = new SqlCommand(checkUserExistsSQL);
                DatabaseHelper.AddParameter(checkUsernameExistsCmd, "@user_name", SqlDbType.VarChar, txtUserName.Text.ToLower());
                DatabaseHelper.SqlResult registered = DatabaseHelper.ExecuteQueryWithResult(checkUsernameExistsCmd);

                if (!registered.HasResults())
                {
                    registered.Close();

                    SqlCommand registerUserCmd = new SqlCommand("sp_insert_users");
                    registerUserCmd.CommandType = CommandType.StoredProcedure;
                    registerUserCmd.CommandText = "sp_insert_users";

                    DatabaseHelper.AddParameter(registerUserCmd, "@fname", SqlDbType.VarChar, txtName.Text);
                    DatabaseHelper.AddParameter(registerUserCmd, "@lname", SqlDbType.VarChar, txtLName.Text);
                    DatabaseHelper.AddParameter(registerUserCmd, "@email", SqlDbType.VarChar, txtEmail.Text.ToLower());
                    DatabaseHelper.AddParameter(registerUserCmd, "@user_name", SqlDbType.VarChar, txtUserName.Text.ToLower());
                    DatabaseHelper.AddParameter(registerUserCmd, "@password", SqlDbType.VarChar, txtPass.Text);

                    DatabaseHelper.SqlResult result = DatabaseHelper.ExecuteQueryWithResult(registerUserCmd);
                    if (result.GetAffectedRows() > 0)
                    {
                        RegistrationForm.Attributes["style"] = "display: none;";
                        lbMessage.Text = "Регистрацията премина успешно!";
                        lbUserName.Attributes["style"] = "display: none;";
                        lbPassword.Attributes["style"] = "display: none;";
                        lbLastName.Attributes["style"] = "display: none;";
                        lbFirstName.Attributes["style"] = "display: none;";
                        lbEmail.Attributes["style"] = "display: none;";
                        txtUserName.Attributes["style"] = "display: none;";
                        txtPass.Attributes["style"] = "display: none;";
                        txtLName.Attributes["style"] = "display: none;";
                        txtName.Attributes["style"] = "display: none;";
                        txtEmail.Attributes["style"] = "display: none;";
                        btnReg.Attributes["style"] = "display: none;";
                        btnCancel.Attributes["style"] = "display: none;";
                    }
                    else
                    {
                        lbMessage.Text = "Неуспешна регистрация: " + DatabaseHelper.GetLastError();
                    }
                    result.Close();
                }
                else
                {
                    registered.Close();
                    lbMessage.Text = "Вече съществува потребител с такова име (" + txtUserName.Text + ")!";
                }
            }
            else
            {
                lbMessage.Text = "Не са попълнени всички полета!";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}