using System;

namespace Ruanmou.Model
{
    /// <summary>
    /// Sys_RoleAuthorize
    /// </summary>
    public class Sys_RoleAuthorize : BaseModel
    {

        /// <summary>
        /// 角色iD
        /// </summary>
        public int  RoleId { get; set;}
		
		/// <summary>
		/// 菜单ID
		/// </summary>
		public int  MenuId { get; set;}
		
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
	