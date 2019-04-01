using Ruanmou.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;

namespace Ruanmou.DAL
{
    /// <summary>
    /// 为什么要约束？
    /// 1 希望调用者不要犯错，避免将其他实体传进来
    /// 2 BaseModel 保证一定有ID 而且是int 自增主键
    /// </summary>
    public abstract class BaseDAL
    {

        protected static List<T> ExecuteCommand<T>(Func<DbCommand, List<T>> dlgFunc)
        {
            List<T> lst = null;
            DbProviderFactory provider = DbProviderFactories.GetFactory(StaticConstraint.ProviderNameConfig);
            using (DbConnection conn = provider.CreateConnection())
            {
                conn.ConnectionString = StaticConstraint.DBConnConfig;
                //构建命令
                DbCommand cmd = provider.CreateCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                conn.Open();
                lst = dlgFunc(cmd);
            }
            return lst;
        }

        protected static T ExecuteCommand<T>(Func<DbCommand, T> dlgFunc)
        {
            T t = default(T);
            DbProviderFactory provider = DbProviderFactories.GetFactory(StaticConstraint.ProviderNameConfig);
            using (DbConnection conn = provider.CreateConnection())
            {
                conn.ConnectionString = StaticConstraint.DBConnConfig;
                //构建命令
                DbCommand cmd = provider.CreateCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                conn.Open();
                t = dlgFunc(cmd);
            }
            return t;
        }

        protected T Trans<T>(Type type, DbDataReader reader)
        {
            object oObject = Activator.CreateInstance(type);
            foreach (var prop in type.GetProperties())
            {
                //prop.SetValue(oObject, reader[prop.Name]]);
                //可空类型，如果数据库存储的是null，直接SetValue会报错的
                prop.SetValue(oObject, reader[prop.Name] is DBNull ? null : reader[prop.Name]);
            }
            return (T)oObject;
        }

    }
}
