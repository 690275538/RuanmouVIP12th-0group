using System.Collections.Generic;

namespace Ruanmou.IDAL
{
    public interface IBaseDAL
    {
        IEnumerable<T> Query<T>(string queryString);
    }
}
