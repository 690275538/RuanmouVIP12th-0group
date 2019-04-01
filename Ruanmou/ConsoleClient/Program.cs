using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Ruanmou.IDAL;
using Ruanmou.Model;

namespace ConsoleClient
{
    class Program
    {
        static void Main(string[] args)
        {
            IBaseDAL dal = new Ruanmou.DAL.SqlMapper(new SqlConnection("Data Source=106.12.131.104;Database=RmAuthSystemDb;User ID=sa;Password=Ruanmou1200"));
            var users = dal.Query<Sys_User>(@"select *
                     from Sys_User");
            foreach (var user in users)
            {
                var tp = typeof(Sys_User);
                foreach (var prop in tp.GetProperties())
                {
                    Console.Write($"{prop.Name}: {prop.GetValue(user)??"null"}\t");
                }
                Console.WriteLine();
            }
            Console.ReadKey();
        }
    }
}
