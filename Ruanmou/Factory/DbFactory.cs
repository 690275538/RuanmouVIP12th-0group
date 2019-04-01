using Ruanmou.Common;
using Ruanmou.DAL;
using Ruanmou.IDAL;
using System;
using System.Reflection;

namespace Factory
{
    public class DbFactory
    {
        private static string DllName = StaticConstraint.IBaseDALConfig.Split(',')[0];
        private static string TypeName = StaticConstraint.IBaseDALConfig.Split(',')[1];

        public static IBaseDAL CreateDBHelper()
        {
            Assembly assembly = Assembly.Load(DllName);
            Type type = assembly.GetType(TypeName);
            return (IBaseDAL)(BaseDAL)Activator.CreateInstance(type);
        }
    }
}
