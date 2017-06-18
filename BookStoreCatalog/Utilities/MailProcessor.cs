using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Net.Mail;

namespace BookStoreCatalog.Utilities
{
    public class MailProcessor
    {
        private string host = "smtp.gmail.com";
        private int port = 587;
        private string username = "kristiana.gigova@gmail.com";
        private string password = "12118071";
        private MailMessage message;

        public MailProcessor()
        {
            this.message = new MailMessage();

            this.message.From = new MailAddress(username, username, System.Text.Encoding.UTF8);
            this.message.SubjectEncoding = System.Text.Encoding.UTF8;
            this.message.BodyEncoding = System.Text.Encoding.UTF8;
            this.message.IsBodyHtml = true;
            this.message.Priority = MailPriority.High;
        }

        public MailMessage Message
        {
            get { return message; }
            set { message = value; }
        }

        public void SendMail()
        {
            /*
            MailMessage mail = new MailMessage();
            mail.To.Add("to gmail address");
            mail.From = new MailAddress("from gmail address", "Email head", System.Text.Encoding.UTF8);
            mail.Subject = "This mail is send from asp.net application";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "This is Email Body Text";
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
             */
            System.Net.NetworkCredential mycredentials = new System.Net.NetworkCredential(username, password);

            SmtpClient client = new SmtpClient();
            client.Credentials = mycredentials;
            client.Port = port;
            client.Host = host;
            client.EnableSsl = true;
            try
            {

                client.Send(this.message);
            }
            catch (Exception e)
            {
                String msg = e.Message;
            }
        }
    }
}