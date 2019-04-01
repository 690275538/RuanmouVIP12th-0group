using System;

namespace Ruanmou.Model
{
    //[AttributeUsage(AttributeTargets.All, AllowMultiple =true)]
    /// <summary>
    /// model中字段与数据库字段的映射
    /// 如果model的某个属性加上了这个特性，实际的sql选择列的名称对应此特性的DALName
    /// 例：Sys_Menu中Name字段，假如数据库是MenuName，那么只需要在字段上面加上[EntityMapping(sDALName: "MenuName")]即可，
    /// 对于表名同样适用
    /// </summary>
    public class EntityMappingAttribute : Attribute
    {
        public string DALName { get; private set; }
        public EntityMappingAttribute(string sDALName)
        {
            this.DALName = sDALName;
        }
    }
}
