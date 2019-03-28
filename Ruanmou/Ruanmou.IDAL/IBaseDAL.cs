using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ruanmou.IDAL
{
    public interface IBaseDAL
    {
        IEnumerable<T> IQuery<T>();
    }
}
