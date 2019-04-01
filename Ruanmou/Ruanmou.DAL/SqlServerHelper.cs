using Ruanmou.DAL.ExpressionVisitorLib;
using Ruanmou.IDAL;
using Ruanmou.Model;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace Ruanmou.DAL
{
    public class SqlServerHelper : BaseDAL, IBaseDAL
    {
        public bool Add<T>(T t) where T : BaseModel
        {
            Type type = t.GetType();
            //id是自增的  所以不能新增
            var parameterList = type.GetProperties(BindingFlags.DeclaredOnly | BindingFlags.Instance | BindingFlags.Public)
                .Select(p => new SqlParameter($"@{p.Name}", p.GetValue(t) ?? DBNull.Value));//注意可空类型
            string sql = SqlBuilderByKey<T>.AddSql;
            return ExecuteCommand(BuildExecuteNonQueryFunc<T>(sql, parameterList)) > 0;
        }

        public T Find<T>(int id) where T : BaseModel
        {
            string sql = SqlBuilderByKey<T>.FindSql;
            Func<DbCommand, T> func = command =>
            {
                T t = default(T);
                command.CommandText = sql;
                command.Parameters.Add(new SqlParameter("@Id", id));
                DbDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    t = this.Trans<T>(typeof(T), reader);
                };
                return t;
            };
            return ExecuteCommand(func);
        }

        public bool Delete<T>(int id) where T : BaseModel
        {
            string sql = SqlBuilderByKey<T>.DeleteSql;
            return ExecuteCommand(BuildExecuteNonQueryFunc<T>(sql, new SqlParameter[] { new SqlParameter($"@Id", id) })) > 0;
        }

        public bool Update<T>(T t) where T : BaseModel
        {
            Type type = t.GetType();
            var parameterList = type.GetProperties(BindingFlags.Instance | BindingFlags.Public)
                .Select(p => new SqlParameter($"@{p.Name}", p.GetValue(t) ?? DBNull.Value));//注意可空类型
            string sql = SqlBuilderByKey<T>.UpdateSql;
            return ExecuteCommand(BuildExecuteNonQueryFunc<T>(sql, parameterList)) > 0;
        }

        public IEnumerable<T> IQuery<T>()
        {
            return Query<T>();
        }

        public List<T> Query<T>()
        {
            string sql = SqlBuilderNoWhere<T>.QuerySql;
            return ExecuteCommand(BuildExecuteReaderFunc<T>(sql));
        }

        public List<T> Query<T>(Expression expressionWhere)
        {
            string sql =BulidWhere(SqlBuilderNoWhere<T>.QuerySql, expressionWhere);
            return ExecuteCommand(BuildExecuteReaderFunc<T>(sql));
        }

        public bool Delete<T>(Expression expressionWhere)
        {
            string sql = BulidWhere(SqlBuilderNoWhere<T>.DeleteSql, expressionWhere);
            return ExecuteCommand(BuildExecuteNonQueryFunc<T>(sql, null)) > 0;
        }

        private string BulidWhere(string sql, Expression expressionWhere)
        {
            ConditionBuilderVisitor vistor = new ConditionBuilderVisitor();
            vistor.Visit(expressionWhere);
            return $"{sql} WHERE {vistor.Condition()}";
        }

        private Func<DbCommand, List<T>> BuildExecuteReaderFunc<T>(string sql)
        {
            Func<DbCommand, List<T>> func = command =>
            {
                List<T> lst = new List<T>();
                command.CommandText = sql;
                DbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(this.Trans<T>(typeof(T), reader));
                };
                return lst;
            };
            return func;
        }

        private Func<DbCommand, int> BuildExecuteNonQueryFunc<T>(string sql, IEnumerable<SqlParameter> parameterList)
        {
            Func<DbCommand, int> func = command =>
            {
                command.CommandText = sql;
                if (parameterList != null)
                    command.Parameters.AddRange(parameterList.ToArray());
                return command.ExecuteNonQuery();
            };
            return func;
        }
    }
}
