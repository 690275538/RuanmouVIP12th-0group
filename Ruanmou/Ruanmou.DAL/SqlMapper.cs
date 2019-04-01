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
        /// <summary>
        /// 通过sql查询，返回实体
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="queryString"></param>
        /// <returns></returns>
        public IEnumerable<T> Query<T>(string queryString)
        {
            Type t = typeof(T);
            List<T> list = new List<T>();
            if (Connection == null && !string.IsNullOrWhiteSpace(ConnectionString))
            {
                Connection = new SqlConnection(ConnectionString);
            }
            if (Connection == null)
            {
                throw new NullReferenceException(nameof(Connection));
            }
            SqlCommand cmd = new SqlCommand(queryString, Connection);
            Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                foreach (var prop in t.GetProperties())
                {
                    
                }
                while (reader.Read())
                {
                    var instanceT = Activator.CreateInstance<T>();
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        if ()
                        {
                            
                        }
                        var prop = t.GetProperty(reader.GetName(i));
                        prop?.SetValue(instanceT, reader[i] is DBNull ? null : reader[i]);
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
