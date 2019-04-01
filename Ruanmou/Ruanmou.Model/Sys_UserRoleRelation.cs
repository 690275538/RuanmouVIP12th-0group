using System;

namespace Ruanmou.Model
{
    /// <summary>
    /// Sys_UserRoleRelation
    /// </summary>
    public class Sys_UserRoleRelation : BaseModel
    {

        /// <summary>
        /// 用户ID
        /// </summary>
        public int  UserId { get; set;}
		
		/// <summary>
		/// 角色ID
		/// </summary>
		public string  RoleId { get; set;}
		
		/// <summary>
		/// 创建人
		/// </summary>
		public string  CreateUser { get; set;}
		
		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime  CreateTime { get; set;}
		
	}
}
	