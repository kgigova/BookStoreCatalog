﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BookStoreCatalog.Utilities;
using System.Web.UI.HtmlControls;

namespace BookStoreCatalog
{
    public partial class Details : System.Web.UI.Page
    {
        private int m_userId = -1;
        private Button btnAdd;
        private HtmlContainerControl addToCartContainer;

        protected void Page_Load(object sender, EventArgs e)
        {
            btnAdd = (Button)FormView1.FindControl("btnAdd");
            addToCartContainer = (HtmlContainerControl) FormView1.FindControl("addToCartContainer");

            if (Session["username"] != null)
            {
                btnAdd.Attributes["style"] = "display: ;";
                addToCartContainer.Attributes["style"] = "display: ;";
                m_userId = Convert.ToInt32(Session["userid"]);
            }
            else
            {
                btnAdd.Attributes["style"] = "display: none;";
                addToCartContainer.Attributes["style"] = "display: none;";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlCommand insertInCartCmd = new SqlCommand("sp_insert_incart");
            insertInCartCmd.CommandType = CommandType.StoredProcedure;
            insertInCartCmd.CommandText = "sp_insert_incart";

            DatabaseHelper.AddParameter(insertInCartCmd, "@user_id", SqlDbType.Int, m_userId);
            DatabaseHelper.AddParameter(insertInCartCmd, "@book_id", SqlDbType.Int, Int32.Parse(Request.QueryString["book_id"]));

            
            try
            {
                DatabaseHelper.SqlResult result = DatabaseHelper.ExecuteQueryWithResult(insertInCartCmd);
                if (result.GetReader().RecordsAffected > 0)
                {
                    //DatabaseHelper.ExecuteQueryNoResult(insertInCartCmd);
                    Button btn = (Button)sender;
                    btn.Text = "Книгата беше добавена успешно! ";
                    btn.Enabled = false;
                }
                else
                {
                    throw new Exception("Книгата вече е била поръчана или вече я има в кошницата");
                }
            }
            catch (Exception se)
            {
                Button btn = (Button)sender;
                btn.Text = "ГРЕШКА! " + se.Message;
                btn.Enabled = false;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Catalog.aspx");
        }

        protected void btnAddComment_Click(object sender, EventArgs e)
        {
            SqlCommand addCommentCmd = new SqlCommand("sp_insert_comment");
            addCommentCmd.CommandType = CommandType.StoredProcedure;
            addCommentCmd.CommandText = "sp_insert_comment";

            DatabaseHelper.AddParameter(addCommentCmd, "@user_id", SqlDbType.Int, m_userId);
            DatabaseHelper.AddParameter(addCommentCmd, "@book_id", SqlDbType.Int, Request.QueryString["book_id"]);
            DatabaseHelper.AddParameter(addCommentCmd, "@comment", SqlDbType.Text, txtComment.Text);

            DatabaseHelper.ExecuteQueryNoResult(addCommentCmd);
            txtComment.Text = "";
            GridView1.DataBind();
        }
    }
}