using System;

namespace Ruanmou.Model
{
    /// <summary>
    /// Sys_Organize
    /// </summary>
    public class Sys_Organize : BaseModel
    {
		
		/// <summary>
		/// 父级ID
		/// </summary>
		public int  ParentId { get; set;}
		
		/// <summary>
		/// 层级
		/// </summary>
		public int  Layer { get; set;}
		
		/// <summary>
		/// 名称
		/// </summary>
		public string  FullName { get; set;}
		
		/// <summary>
		/// 类型 0=公司 1=部门
		/// </summary>
		public short  Type { get; set;}
		
		/// <summary>
		/// 电话
		/// </summary>
		public string  TelePhone { get; set;}
		
		/// <summary>
		/// 微信
		/// </summary>
		public string  WeChat { get; set;}
		
		/// <summary>
		/// 传真
		/// </summary>
		public string  Fax { get; set;}
		
		/// <summary>
		/// 邮箱
		/// </summary>
		public string  Email { get; set;}
		
		/// <summary>
		/// 地址
		/// </summary>
		public string  Address { get; set;}
		
		/// <summary>
		/// 序号
		/// </summary>
		public int  SortCode { get; set;}
		
		/// <summary>
		/// 是否删除
		/// </summary>
		public bool  DeleteMark { get; set;}
		
		/// <summary>
		/// 是否启用
		/// </summary>
		public bool  IsEnabled { get; set;}
		
		/// <summary>
		/// 备注
		/// </summary>
		public string  Remark { get; set;}
		
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
	