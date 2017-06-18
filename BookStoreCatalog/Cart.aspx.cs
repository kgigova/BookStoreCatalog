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
    public partial class Cart : System.Web.UI.Page
    {
        private int m_userId = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            BookStoreCatalog.CurrentPage = "Количка";
            if (Session["username"] != null)
            {
                m_userId = Convert.ToInt32(Session["userid"]);
            }
            else
            {
                Response.Redirect("Home.aspx");
            }

            SqlCommand selectBooksCmd = new SqlCommand("sp_select_orders_for_user");
            selectBooksCmd.CommandType = CommandType.StoredProcedure;
            selectBooksCmd.CommandText = "sp_select_orders_for_user";

            DatabaseHelper.AddParameter(selectBooksCmd, "@user_id", SqlDbType.Int, m_userId);
            DatabaseHelper.SqlResult result = DatabaseHelper.ExecuteQueryWithResult(selectBooksCmd);
            if (!result.GetReader().HasRows)
            {
                btnOrder.Attributes["style"] = "display: none;";
                btnDelete.Attributes["style"] = "display: none;";
                Label2.Attributes["style"] = "display: none;";
                Label1.Text = "Вашата кошница е празна!";
            }
            else
            {
                btnOrder.Attributes["style"] = "display: ;";
                btnDelete.Attributes["style"] = "display: ;";
                Label2.Attributes["style"] = "display: ;";
                Label1.Text = "Във вашата кошница има:";

                SqlCommand totalPriceCmd = new SqlCommand("sp_select_total_price");
                totalPriceCmd.CommandType = CommandType.StoredProcedure;
                totalPriceCmd.CommandText = "sp_select_total_price";

                DatabaseHelper.AddParameter(totalPriceCmd, "@user_id", SqlDbType.Int, m_userId);
                result = DatabaseHelper.ExecuteQueryWithResult(totalPriceCmd);
                SqlDataReader reader = result.GetReader();
                reader.Read();
                lbSum.Text = result.GetReader().GetDecimal(0).ToString(); 
            }
            result.Close();


        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            foreach (DataListItem li in DataList1.Items)
            {
                CheckBox s = (CheckBox)li.FindControl("CheckBox1");
                if (s.Checked == true)
                {

                    SqlCommand delBooksCmd = new SqlCommand("sp_delete_books");
                    delBooksCmd.CommandType = CommandType.StoredProcedure;
                    delBooksCmd.CommandText = "sp_delete_books";

                    DatabaseHelper.AddParameter(delBooksCmd, "@book_id", SqlDbType.Int, ((Label)li.FindControl("lblBookID")).Text);
                    DatabaseHelper.AddParameter(delBooksCmd, "@user_id", SqlDbType.Int, m_userId);
                    DatabaseHelper.ExecuteQueryNoResult(delBooksCmd);

                    //try
                    //{                       
                    //    //SqlDataReader dr = delBooksCmd.ExecuteReader();
                    //    //int res = (Int32)delBooksCmd.Parameters["@s_id"].Value;
                    //}
                    //catch (Exception se)
                    //{

                    //}
                }
            }
            DataList1.DataBind();
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {

                SqlCommand orderBooksCmd = new SqlCommand("sp_update_order");
                orderBooksCmd.CommandType = CommandType.StoredProcedure;
                orderBooksCmd.CommandText = "sp_update_order";

                DatabaseHelper.AddParameter(orderBooksCmd, "@user_id", SqlDbType.Int, m_userId);
                DatabaseHelper.ExecuteQueryNoResult(orderBooksCmd);

                DataList1.DataBind();
                Label1.Text = "Вашата кошница е празна!";
                Label2.Attributes["style"] = "display: none;";
                lbSum.Attributes["style"] = "display: none;";
        }
    }
}