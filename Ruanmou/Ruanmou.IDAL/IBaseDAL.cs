using Ruanmou.Model;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Ruanmou.IDAL
{
    public interface IBaseDAL
    {
        IEnumerable<T> IQuery<T>();

        #region 根据主键crud
        bool Add<T>(T t) where T : BaseModel;
        T Find<T>(int id) where T : BaseModel;
        bool Update<T>(T t) where T : BaseModel;
        bool Delete<T>(int id) where T : BaseModel;
        #endregion

        #region NoWhere 不加条件查询所有
        List<T> Query<T>();
        #endregion

        #region 加上where，参数是Expression的表达式，只支持单表
        /// <summary>
        /// 根据Expression动态拼装where，然后查询满足条件的
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="expressionWhere">例如：Expression<Func<People, bool>> lambda = x => x.Age > 5;</param>
        /// <returns></returns>
        List<T> Query<T>(Expression expressionWhere);
        /// <summary>
        /// 根据Expression动态拼装where，然后删除满足条件的
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="expressionWhere">例如：Expression<Func<People, bool>> lambda = x => x.Age > 5;</param>
        /// <returns></returns>
        bool Delete<T>(Expression expressionWhere);
        #endregion
    }
}
