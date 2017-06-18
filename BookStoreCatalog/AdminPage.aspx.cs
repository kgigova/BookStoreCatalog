using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace BookStoreCatalog
{
    public partial class AdminPage : System.Web.UI.Page
    {
        private int m_userId = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            BookStoreCatalog.CurrentPage = "Администрация";
            if (Session["username"] == null || Session["role"] == null || !Session["role"].Equals("администратор"))
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            DbParameterCollection CmdParams = e.Command.Parameters;

            foreach (DbParameter cp in CmdParams)
                Trace.Warn(cp.ParameterName, cp.Value.ToString());

            e.Cancel = true;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            FileUpload fileUpload = (FileUpload)DetailsView1.FindControl("FileUpload1");
            Label lblMessageText = (Label)DetailsView1.FindControl("lblMessageText");
            string[] fileBreak = fileUpload.FileName.Split(new char[] { '.' });

            if (!fileUpload.HasFile)
            { 
                lblMessageText.Text = "Не е избран файл."; 
            }
            else if (fileBreak[1].ToUpper() != "JPG")
            { 
                lblMessageText.Text = "Файлът трябва да e в JPG формат."; 
            }
            else if (fileUpload.PostedFile.ContentLength > 1024 * 1024)
            { 
                lblMessageText.Text = "Файлът трябва да e под 1 MB."; 
            }
            else
            {
                String filePath = Server.MapPath("./BookPictures/") + Guid.NewGuid() + ".jpg";
                fileUpload.SaveAs(filePath);
                lblMessageText.Text = "<b>Файлът е добавен</b><br/>";
                lblMessageText.Text += "Име: " + fileUpload.FileName + "<br/>";
                lblMessageText.Text += "Размер: " + fileUpload.PostedFile.ContentLength + " bytes<br/>";
                fileUpload.Attributes["style"] = "display: none;";
            }
        }

        protected void SqlDataSource1_Updating1(object sender, SqlDataSourceCommandEventArgs e)
        {
            /*DbParameterCollection CmdParams = e.Command.Parameters;

            foreach (DbParameter cp in CmdParams)
                Trace.Warn(cp.ParameterName, cp.Value != null ? cp.Value.ToString() : "null");*/
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            FileUpload fileUpload = (FileUpload)DetailsView1.FindControl("FileUpload1");
            Label lblMessageText = (Label)DetailsView1.FindControl("lblMessageText");
            Image imgBookImage = (Image)DetailsView1.FindControl("imgBookImage");
            Label label = (Label)DetailsView1.FindControl("lblImagePath");

            string[] fileBreak = fileUpload.FileName.Split(new char[] { '.' });

            if (!fileUpload.HasFile)
            {
                lblMessageText.Text = "Не е избран файл.";
                e.Cancel = true;
            }
            else if (fileBreak[1].ToUpper() != "JPG")
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
                e.NewValues["imagePath"] = "BookPictures/" + imageName;
            }
        }
    }
}