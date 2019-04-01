using Ruanmou.DAL.EntityMappingExtend;
using Ruanmou.Model;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace Ruanmou.DAL
{
    /// <summary>
    /// 缓存固定Sql，curd根据主键
    /// </summary>
    public class SqlBuilderByKey<T> where T : BaseModel
    {
        public static string FindSql = null;
        public static string AddSql = null;
        public static string DeleteSql = null;
        public static string UpdateSql = null;

        static SqlBuilderByKey()
        {
            FindSql = GetFindSql();

            AddSql = GetAddSql();

            DeleteSql = GetDeleteSql();

            UpdateSql = GetUpdateSql();
        }

        private static string GetFindSql()
        {
            return $"SELECT {GetColumnString(BindingFlags.Instance | BindingFlags.Public)} FROM [{GetTableName()}] WHERE Id=@Id";
        }
        
        private static string GetAddSql()
        {
            return $"Insert [{GetTableName()}] ({GetColumnString(BindingFlags.DeclaredOnly | BindingFlags.Instance | BindingFlags.Public)}) values({GetValueColumn(BindingFlags.DeclaredOnly | BindingFlags.Instance | BindingFlags.Public)})";
        }

        private static string GetDeleteSql()
        {
            return $"DELETE FROM [{GetTableName()}] WHERE Id=@Id";
        }

        private static string GetUpdateSql()
        {
            Type type = typeof(T);
            List<string> columnSetStrList = new List<string>();
            //id是主键，避免碎片，不更新id
            foreach (var prop in type.GetProperties(BindingFlags.DeclaredOnly | BindingFlags.Instance | BindingFlags.Public))
            {
                if (prop.IsDefined(typeof(EntityMappingAttribute), true))
                {
                    foreach (EntityMappingAttribute attribute in prop.GetCustomAttributes(typeof(EntityMappingAttribute), true))
                    {
                        columnSetStrList.Add($"[{attribute.DALName}]= @{attribute.DALName}");
                    }
                }
                else
                {
                    columnSetStrList.Add($"[{prop.Name}] = @{prop.Name}");
                }
            }
            string setSql = string.Join(",", columnSetStrList); 
            return $"UPDATE [{GetTableName()}] SET {setSql} WHERE Id=@Id";
        }

        private static string GetColumnString(BindingFlags bindingFlags)
        {
            Type type = typeof(T);
            List<string> columnStringList = new List<string>();
            foreach (var prop in type.GetProperties(bindingFlags))
            {
                if (prop.IsDefined(typeof(EntityMappingAttribute), true))
                {
                    foreach (EntityMappingAttribute attribute in prop.GetCustomAttributes(typeof(EntityMappingAttribute), true))
                    {
                        columnStringList.Add($"[{attribute.DALName}]");
                    }
                }
                else
                {
                    columnStringList.Add($"[{prop.Name}]");
                }
            }
            return string.Join(",", columnStringList);
        }

        private static string GetValueColumn(BindingFlags bindingFlags)
        {
            Type type = typeof(T);
            List<string> columnStringList = new List<string>();
            foreach (var prop in type.GetProperties(bindingFlags))
            {
                if (prop.IsDefined(typeof(EntityMappingAttribute), true))
                {
                    foreach (EntityMappingAttribute attribute in prop.GetCustomAttributes(typeof(EntityMappingAttribute), true))
                    {
                        columnStringList.Add($"@{attribute.DALName}");
                    }
                }
                else
                {
                    columnStringList.Add($"@{prop.Name}");
                }
            }
            return string.Join(",", columnStringList);
        }

        private static string GetTableName()
        {
            Type type = typeof(T);
            string tableName = null;
            if (type.IsDefined(typeof(EntityMappingAttribute), true))
            {
                EntityMappingAttribute attributeType = type.GetCustomAttribute(typeof(EntityMappingAttribute)) as EntityMappingAttribute;
                tableName = attributeType.DALName;
            }
            else
            {
                tableName = type.Name;
            }
            return tableName;
        }

    }

    /// <summary>
    /// 缓存固定Sql，主要有urd，不包括where
    /// </summary>
    public class SqlBuilderNoWhere<T>
    {
        public static string QuerySql = null;
        public static string DeleteSql = null;

        static SqlBuilderNoWhere()
        {
            QuerySql = GetQuerySql();

            DeleteSql = GetDeleteSql();
        }

        private static string GetQuerySql()
        {
            return $"SELECT {GetColumnString(BindingFlags.Instance | BindingFlags.Public)} FROM [{GetTableName()}] ";
        }


        private static string GetDeleteSql()
        {
            return $"DELETE FROM [{GetTableName()}] ";
        }

        private static string GetColumnString(BindingFlags bindingFlags)
        {
            Type type = typeof(T);
            List<string> columnStringList = new List<string>();
            foreach (var prop in type.GetProperties(bindingFlags))
            {
                if (prop.IsDefined(typeof(EntityMappingAttribute), true))
                {
                    foreach (EntityMappingAttribute attribute in prop.GetCustomAttributes(typeof(EntityMappingAttribute), true))
                    {
                        columnStringList.Add($"[{attribute.DALName}]");
                    }
                }
                else
                {
                    columnStringList.Add($"[{prop.Name}]");
                }
            }
            return string.Join(",", columnStringList);
        }

        private static string GetTableName()
        {
            Type type = typeof(T);
            string tableName = null;
            if (type.IsDefined(typeof(EntityMappingAttribute), true))
            {
                EntityMappingAttribute attributeType = type.GetCustomAttribute(typeof(EntityMappingAttribute)) as EntityMappingAttribute;
                tableName = attributeType.DALName;
            }
            else
            {
                tableName = type.Name;
            }
            return tableName;
        }

    }
}
