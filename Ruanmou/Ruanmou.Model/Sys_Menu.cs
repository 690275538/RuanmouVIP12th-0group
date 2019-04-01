using System;

namespace Ruanmou.Model
{
    /// <summary>
    /// Sys_Menu
    /// </summary>
    public class Sys_Menu : BaseModel
	{
		
		/// <summary>
		/// 父id
		/// </summary>
		public int  ParentId { get; set;}
		
		/// <summary>
		/// 层级
		/// </summary>
		public int  Layer { get; set;}
		
		/// <summary>
		/// 菜单名
		/// </summary>
		public string  Name { get; set;}
		
		/// <summary>
		/// 图标
		/// </summary>
		public string  Icon { get; set;}
		
		/// <summary>
		/// 路径
		/// </summary>
		public string  Url { get; set;}
		
		/// <summary>
		/// 备注
		/// </summary>
		public string  Remark { get; set;}
		
		/// <summary>
		/// 序号
		/// </summary>
		public int  SortCode { get; set;}
		
		/// <summary>
		/// 是否启用
		/// </summary>
		public bool  IsEnable { get; set;}
		
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
	