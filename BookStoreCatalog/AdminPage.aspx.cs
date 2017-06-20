using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;

namespace BookStoreCatalog
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BookStoreCatalog.CurrentPage = "Администрация";
            if (Session["username"] == null || Session["role"] == null || !Session["role"].Equals("администратор"))
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            FileUpload fileUpload = (FileUpload)DetailsView1.FindControl("FileUpload1");
            Label lblMessageText = (Label)DetailsView1.FindControl("lblMessageText");
            Image imgBookImage = (Image)DetailsView1.FindControl("imgBookImage");
            Label label = (Label)DetailsView1.FindControl("lblImagePath");

            string[] fileBreak = fileUpload.FileName.Split(new char[] { '.' });

            if (fileUpload.HasFile)
            {
                if (fileBreak[1].ToUpper() != "JPG")
                {
                    lblMessageText.Text = "Файлът трябва да e в JPG формат.";
                    e.Cancel = true;
                }
                else if (fileUpload.PostedFile.ContentLength > 1024 * 1024)
                {
                    lblMessageText.Text = "Файлът трябва да e под 1 MB.";
                    e.Cancel = true;
                }
                else
                {
                    String imageName = Guid.NewGuid() + ".jpg";
                    String directory = Server.MapPath("./BookPictures/");
                    if (!Directory.Exists(directory))
                    {
                        Directory.CreateDirectory(directory);
                    }
                    String filePath = directory + imageName;
                    fileUpload.SaveAs(filePath);
                    e.NewValues["imagePath"] = "BookPictures/" + imageName;
                }
            }

            DropDownList dropDownList = (DropDownList)DetailsView1.FindControl("CategoryName");
            e.NewValues.Add("c_fname", dropDownList.SelectedValue);
        }

        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {
            DropDownList dropDownList = (DropDownList)DetailsView1.FindControl("CategoryName");
            if (dropDownList != null)
            {
                dropDownList.DataSource = SqlDataSource2;
                dropDownList.DataTextField = "c_fname";
                dropDownList.DataValueField = "c_fname";
                dropDownList.DataBind();

                if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
                {
                    DataRowView rowView = (DataRowView)DetailsView1.DataItem;
                    if (rowView.Row["c_fname"] != null)
                    {
                        dropDownList.SelectedValue = (String)rowView.Row["c_fname"];
                    }
                }
            }
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            DropDownList dropDownList = (DropDownList)DetailsView1.FindControl("CategoryName");
            e.Values.Add("c_fname", dropDownList.SelectedValue);

            FileUpload fileUpload = (FileUpload)DetailsView1.FindControl("FileUpload1");
            Label lblMessageText = (Label)DetailsView1.FindControl("lblMessageText");
            Image imgBookImage = (Image)DetailsView1.FindControl("imgBookImage");
            Label label = (Label)DetailsView1.FindControl("lblImagePath");

            string[] fileBreak = fileUpload.FileName.Split(new char[] { '.' });

            if (fileUpload.HasFile)
            {
                if (fileBreak[1].ToUpper() != "JPG")
                {
                    lblMessageText.Text = "Файлът трябва да e в JPG формат.";
                    e.Cancel = true;
                }
                else if (fileUpload.PostedFile.ContentLength > 1024 * 1024)
                {
                    lblMessageText.Text = "Файлът трябва да e под 1 MB.";
                    e.Cancel = true;
                }
                else
                {
                    String imageName = Guid.NewGuid() + ".jpg";
                    String filePath = Server.MapPath("./BookPictures/") + imageName;
                    fileUpload.SaveAs(filePath);
                    e.Values["imagePath"] = "BookPictures/" + imageName;
                }
            }
        }
    }
}