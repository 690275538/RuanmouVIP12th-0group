using System;

namespace Ruanmou.Model
{
    /// <summary>
    /// Sys_User
    /// </summary>
    public class Sys_User : BaseModel
    {

        /// <summary>
        /// 账号
        /// </summary>
        public string  Account { get; set;}
		
		/// <summary>
		/// 登录密码
		/// </summary>
		public string  Pwd { get; set;}
		
		/// <summary>
		/// 真实姓名
		/// </summary>
		public string  RealName { get; set;}
		
		/// <summary>
		/// 昵称
		/// </summary>
		public string  NickName { get; set;}
		
		/// <summary>
		/// 性别
		/// </summary>
		public bool  Gender { get; set;}
		
		/// <summary>
		/// 生日
		/// </summary>
		public DateTime  Birthday { get; set;}
		
		/// <summary>
		/// 手机号
		/// </summary>
		public string  MobilePhone { get; set;}
		
		/// <summary>
		/// 邮箱
		/// </summary>
		public string  Email { get; set;}
		
		/// <summary>
		/// 地址
		/// </summary>
		public string  Address { get; set;}
		
		/// <summary>
		/// 公司ID
		/// </summary>
		public int  CompanyId { get; set;}
		
		/// <summary>
		/// 部门id
		/// </summary>
		public int  DepartmentId { get; set;}
		
		/// <summary>
		/// 是否启用
		/// </summary>
		public bool  IsEnabled { get; set;}
		
		/// <summary>
		/// 序号
		/// </summary>
		public int  SortCode { get; set;}
		
		/// <summary>
		/// 是否删除
		/// </summary>
		public bool  DeleteMark { get; set;}
		
		/// <summary>
		/// 创建人
		/// </summary>
		public string  CreateUser { get; set;}
		
		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime  CreateTime { get; set;}
		
		/// <summary>
		/// 修改人
		/// </summary>
		public string  ModifyUser { get; set;}
		
		/// <summary>
		/// 修改时间
		/// </summary>
		public DateTime  ModifyTime { get; set;}
		
	}
}
	