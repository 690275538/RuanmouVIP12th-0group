using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ruanmou.Model
{
    [AttributeUsage(AttributeTargets.Property)]
    class ModelDbColumnNameAttribute : Attribute
    {
        private string _dbColumnName;
        /// <summary>
        /// 数据字段名
        /// </summary>
        /// <param name="dbColumnName"></param>
        public ModelDbColumnNameAttribute(string dbColumnName)
        {
            _dbColumnName = dbColumnName;
        }

        public string GetDbColumnName()
        {
            return _dbColumnName;
        }
    }
}
