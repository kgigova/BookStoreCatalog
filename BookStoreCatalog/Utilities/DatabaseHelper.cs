using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

namespace BookStoreCatalog.Utilities
{
    public class DatabaseHelper
    {
        private static String s_lastError;

        private static SqlConnection ConnectDB()
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["BookstoreCatalog_1621448ConnectionString"].ConnectionString);
            return connection;
        }

        public static SqlResult ExecuteQueryWithResult(SqlCommand command)
        {
            SqlConnection connection = ConnectDB();
            try
            {
                connection.Open();
                command.Connection = connection;
                return new SqlResult(connection, command.ExecuteReader());
            }
            catch (SqlException se)
            {
                s_lastError = se.Message;
                return null;
            }
        }

        public static void ExecuteQueryNoResult(SqlCommand command)
        {
            SqlConnection connection = ConnectDB();
            try
            {
                connection.Open();
                command.Connection = connection;
                command.ExecuteNonQuery();
            }
            catch (SqlException se)
            {
                s_lastError = se.Message;
            }
        }

        public static void AddParameter(SqlCommand command, String paramName, SqlDbType paramType, Object value)
        {
            SqlParameter parameter = new SqlParameter(paramName, paramType);
            parameter.Value = value;
            command.Parameters.Add(parameter);
        }

        public static String GetLastError()
        {
            return s_lastError;
        }

        public class SqlResult
        {
            private SqlDataReader m_reader;
            private SqlConnection m_connection;

            public SqlResult(SqlConnection connection, SqlDataReader reader)
            {
                m_connection = connection;
                m_reader = reader;
            }

            public int GetAffectedRows()
            {
                return m_reader.RecordsAffected;
            }

            public bool HasResults()
            {
                return m_reader.HasRows;
            }

            public SqlDataReader GetReader()
            {
                return m_reader;
            }

            public Dictionary<string, object> GetNextRow()
            {
                if (m_reader != null && m_reader.Read())
                {
                    Dictionary<string, object> result = new Dictionary<string, object>();
                    for (int i = 0; i < m_reader.FieldCount; i++)
                    {
                        result.Add(m_reader.GetName(i), m_reader.GetValue(i));
                    }
                    return result;
                }

                return null;
            }

            public void Close()
            {
                m_reader.Close();
                m_connection.Close();
            }
        }

        static public void SendMail(string email, string title, string body)
        {
            MailProcessor mp = new MailProcessor();

            mp.Message.To.Add(email);
            mp.Message.Subject = title;
            mp.Message.Body = body;
            mp.SendMail();
        }
    }
}