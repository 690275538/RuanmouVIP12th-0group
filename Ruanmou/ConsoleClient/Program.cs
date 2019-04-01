using Factory;
using Ruanmou.IDAL;
using Ruanmou.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace ConsoleClient
{
    class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("Hello World!");
            Console.WriteLine("翟超到此一游"   );

            #region test
            IBaseDAL baseDAL = DbFactory.CreateDBHelper();



            //测试单个的curd
            //Sys_RoleAuthorize sys_RoleAuthorize = new Sys_RoleAuthorize() {CreateTime = DateTime.Now, CreateUser = "2528", MenuId = 1, RoleId = 1 };
            //baseDAL.Add(sys_RoleAuthorize);

            //sys_RoleAuthorize.CreateTime = DateTime.Now;
            //baseDAL.Update(sys_RoleAuthorize);

            //Sys_RoleAuthorize sys_RoleAuthorize1 = baseDAL.Find<Sys_RoleAuthorize>(sys_RoleAuthorize.Id);

            //baseDAL.Delete<Sys_RoleAuthorize>(sys_RoleAuthorize.Id);

            //测试查询所有Query
            //Sys_RoleAuthorize sys_RoleAuthorize1 = new Sys_RoleAuthorize() { Id = 1, CreateTime = DateTime.Now, CreateUser = "2528", MenuId = 1, RoleId = 1 };
            //baseDAL.Add(sys_RoleAuthorize1);
            //List<Sys_RoleAuthorize> aaa = baseDAL.Query<Sys_RoleAuthorize>();


            //测试 加上where，参数是Expression的表达式，只支持单表 
            //Expression<Func<Sys_RoleAuthorize, bool>> lambda = x => x.Id > 3;
            //List<Sys_RoleAuthorize> list = baseDAL.Query<Sys_RoleAuthorize>(lambda);

            //Expression<Func<Sys_RoleAuthorize, bool>> lambda = x => x.Id <= 3;
            //baseDAL.Delete<Sys_RoleAuthorize>(lambda);

            Console.Read();
            #endregion
        }
    }
}
