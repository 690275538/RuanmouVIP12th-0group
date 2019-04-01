using System.Configuration;

namespace Ruanmou.Common
{
    /// <summary>
    /// 配置文件初始化类 常量类
    /// 集中管理配置文件
    /// </summary>
    public class StaticConstraint
    {
        /// <summary>
        /// 工厂生成DAL的配置文件
        /// </summary>
        public readonly static string IBaseDALConfig = ConfigurationManager.AppSettings["IBaseDALConfig"];

        public readonly static string DBConnConfig = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

        public readonly static string ProviderNameConfig = ConfigurationManager.ConnectionStrings["DbConnection"].ProviderName;

    }
}
