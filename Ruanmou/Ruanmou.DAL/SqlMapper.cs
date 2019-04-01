using Ruanmou.IDAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net.Http.Headers;

namespace Ruanmou.DAL
{
    public class SqlMapper : IBaseDAL
    {
        public SqlConnection Connection { get; set; }
        public string ConnectionString { get; set; }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="conn">SqlConnection实例</param>
        /// <param name="connString">连接字符串</param>
        public SqlMapper(SqlConnection conn = null, string connString = null)
        {
            Connection = conn;
            ConnectionString = connString;
        }
        public IEnumerable<T> Query<T>(string queryString)
        {
            Type t = typeof(T);
            List<T> list = new List<T>();

            if (Connection == null)
            {
                throw new NullReferenceException(nameof(Connection));
            }
            if (Connection == null && !string.IsNullOrWhiteSpace(ConnectionString))
            {
                Connection = new SqlConnection(ConnectionString);
            }
            SqlCommand cmd = new SqlCommand(queryString, Connection);
            Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    var instanceT = Activator.CreateInstance<T>();
                    foreach (var property in t.GetProperties())
                    {
                        property.SetValue(instanceT, reader[property.Name] is DBNull ? null : reader[property.Name]);
                    }
                    list.Add(instanceT);
                }

                return list;
            }
            catch (Exception e)
            {
                throw;
            }
            finally
            {
                Connection.Close();
                Connection.Dispose();
            }





            return null;
        }

    }
}
