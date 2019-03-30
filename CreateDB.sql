/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2019/3/30 11:39:26                           */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Sys_Menu')
            and   type = 'U')
   drop table dbo.Sys_Menu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Sys_Organize')
            and   type = 'U')
   drop table dbo.Sys_Organize
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Sys_Role')
            and   type = 'U')
   drop table dbo.Sys_Role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Sys_RoleAuthorize')
            and   type = 'U')
   drop table dbo.Sys_RoleAuthorize
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Sys_User')
            and   type = 'U')
   drop table dbo.Sys_User
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Sys_UserRoleRelation')
            and   type = 'U')
   drop table dbo.Sys_UserRoleRelation
go

drop schema dbo
go

/*==============================================================*/
/* User: dbo                                                    */
/*==============================================================*/
 
go

/*==============================================================*/
/* Table: Sys_Menu                                              */
/*==============================================================*/
create table dbo.Sys_Menu (
   Id                   int                  identity(1,1) not for replication,
   ParentId             int                  null,
   Layer                int                  null,
   Name                 varchar(50)          null,
   Icon                 varchar(50)          null,
   Url                  varchar(300)         null,
   Remark               varchar(500)         null,
   SortCode             int                  null,
   IsEnable             bit                  null constraint DF_Sys_Permission_IsEnable default 1,
   DeleteMark           bit                  null constraint DF_Sys_Permission_DeleteMark default 0,
   CreateUser           varchar(50)          null,
   CreateTime           datetime             null,
   ModifyUser           varchar(50)          null,
   ModifyTime           datetime             null,
   constraint PK_Sys_Permission primary key (Id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('dbo.Sys_Menu') and minor_id = 0)
begin 
   execute sp_dropextendedproperty 'MS_Description',  
   'user', 'dbo', 'table', 'Sys_Menu' 
 
end 


execute sp_addextendedproperty 'MS_Description',  
   '菜单表', 
   'user', 'dbo', 'table', 'Sys_Menu'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParentId')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'ParentId'

end


execute sp_addextendedproperty 'MS_Description', 
   '父id',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'ParentId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Layer')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'Layer'

end


execute sp_addextendedproperty 'MS_Description', 
   '层级',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'Layer'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'Name'

end


execute sp_addextendedproperty 'MS_Description', 
   '菜单名',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Icon')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'Icon'

end


execute sp_addextendedproperty 'MS_Description', 
   '图标',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'Icon'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Url')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'Url'

end


execute sp_addextendedproperty 'MS_Description', 
   '路径',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'Url'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'Remark'

end


execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SortCode')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'SortCode'

end


execute sp_addextendedproperty 'MS_Description', 
   '序号',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'SortCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnable')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'IsEnable'

end


execute sp_addextendedproperty 'MS_Description', 
   '是否启用',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'IsEnable'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteMark')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'DeleteMark'

end


execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'DeleteMark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUser')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'CreateUser'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'CreateUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'CreateTime'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUser')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'ModifyUser'

end


execute sp_addextendedproperty 'MS_Description', 
   '修改人',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'ModifyUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'ModifyTime'

end


execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', 'dbo', 'table', 'Sys_Menu', 'column', 'ModifyTime'
go

/*==============================================================*/
/* Table: Sys_Organize                                          */
/*==============================================================*/
create table dbo.Sys_Organize (
   Id                   int                  identity(1,1) not for replication,
   ParentId             int                  null default 0,
   Layer                int                  null,
   FullName             varchar(50)          null,
   Type                 smallint             null,
   TelePhone            varchar(50)          null,
   WeChat               varchar(50)          null,
   Fax                  varchar(50)          null,
   Email                varchar(50)          null,
   Address              varchar(50)          null,
   SortCode             int                  null,
   DeleteMark           bit                  null,
   IsEnabled            bit                  null,
   Remark               varchar(500)         null,
   CreateUser           varchar(50)          null,
   CreateTime           datetime             null,
   ModifyUser           varchar(50)          null,
   ModifyTime           datetime             null,
   constraint PK_Sys_Organize primary key (Id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('dbo.Sys_Organize') and minor_id = 0)
begin 
   execute sp_dropextendedproperty 'MS_Description',  
   'user', 'dbo', 'table', 'Sys_Organize' 
 
end 


execute sp_addextendedproperty 'MS_Description',  
   '组织机构表', 
   'user', 'dbo', 'table', 'Sys_Organize'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParentId')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'ParentId'

end


execute sp_addextendedproperty 'MS_Description', 
   '父级ID',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'ParentId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Layer')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Layer'

end


execute sp_addextendedproperty 'MS_Description', 
   '层级',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Layer'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FullName')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'FullName'

end


execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'FullName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Type')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Type'

end


execute sp_addextendedproperty 'MS_Description', 
   '类型 0=公司 1=部门',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TelePhone')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'TelePhone'

end


execute sp_addextendedproperty 'MS_Description', 
   '电话',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'TelePhone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'WeChat')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'WeChat'

end


execute sp_addextendedproperty 'MS_Description', 
   '微信',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'WeChat'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Fax')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Fax'

end


execute sp_addextendedproperty 'MS_Description', 
   '传真',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Fax'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Email')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Email'

end


execute sp_addextendedproperty 'MS_Description', 
   '邮箱',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Email'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Address')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Address'

end


execute sp_addextendedproperty 'MS_Description', 
   '地址',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Address'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SortCode')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'SortCode'

end


execute sp_addextendedproperty 'MS_Description', 
   '序号',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'SortCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteMark')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'DeleteMark'

end


execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'DeleteMark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'IsEnabled'

end


execute sp_addextendedproperty 'MS_Description', 
   '是否启用',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Remark'

end


execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUser')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'CreateUser'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'CreateUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'CreateTime'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUser')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'ModifyUser'

end


execute sp_addextendedproperty 'MS_Description', 
   '修改人',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'ModifyUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Organize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'ModifyTime'

end


execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', 'dbo', 'table', 'Sys_Organize', 'column', 'ModifyTime'
go

/*==============================================================*/
/* Table: Sys_Role                                              */
/*==============================================================*/
create table dbo.Sys_Role (
   Id                   numeric              identity(1,1) not for replication,
   Name                 varchar(50)          null,
   DeleteMark           bit                  null,
   IsEnabled            bit                  null,
   Remark               varchar(500)         null,
   SortCode             int                  null,
   CreateUser           varchar(50)          null,
   CreateTime           datetime             null,
   ModifyUser           varchar(50)          null,
   ModifyTime           datetime             null,
   constraint PK_Sys_Role primary key (Id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('dbo.Sys_Role') and minor_id = 0)
begin 
   execute sp_dropextendedproperty 'MS_Description',  
   'user', 'dbo', 'table', 'Sys_Role' 
 
end 


execute sp_addextendedproperty 'MS_Description',  
   '角色表', 
   'user', 'dbo', 'table', 'Sys_Role'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'Name'

end


execute sp_addextendedproperty 'MS_Description', 
   '角色名称',
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteMark')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'DeleteMark'

end


execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'DeleteMark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'IsEnabled'

end


execute sp_addextendedproperty 'MS_Description', 
   '是否启用',
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'Remark'

end


execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SortCode')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'SortCode'

end


execute sp_addextendedproperty 'MS_Description', 
   '序号',
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'SortCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUser')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'CreateUser'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'CreateUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'CreateTime'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUser')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'ModifyUser'

end


execute sp_addextendedproperty 'MS_Description', 
   '修改人',
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'ModifyUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'ModifyTime'

end


execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', 'dbo', 'table', 'Sys_Role', 'column', 'ModifyTime'
go

/*==============================================================*/
/* Table: Sys_RoleAuthorize                                     */
/*==============================================================*/
create table dbo.Sys_RoleAuthorize (
   Id                   int                  identity(1,1) not for replication,
   RoleId               int                  null,
   MenuId               int                  null,
   CreateUser           varchar(50)          null,
   CreateTime           datetime             null,
   constraint PK_Sys_RoleAuthorize primary key (Id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('dbo.Sys_RoleAuthorize') and minor_id = 0)
begin 
   execute sp_dropextendedproperty 'MS_Description',  
   'user', 'dbo', 'table', 'Sys_RoleAuthorize' 
 
end 


execute sp_addextendedproperty 'MS_Description',  
   '角色权限表', 
   'user', 'dbo', 'table', 'Sys_RoleAuthorize'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_RoleAuthorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RoleId')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_RoleAuthorize', 'column', 'RoleId'

end


execute sp_addextendedproperty 'MS_Description', 
   '角色iD',
   'user', 'dbo', 'table', 'Sys_RoleAuthorize', 'column', 'RoleId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_RoleAuthorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MenuId')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_RoleAuthorize', 'column', 'MenuId'

end


execute sp_addextendedproperty 'MS_Description', 
   '菜单ID',
   'user', 'dbo', 'table', 'Sys_RoleAuthorize', 'column', 'MenuId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_RoleAuthorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUser')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_RoleAuthorize', 'column', 'CreateUser'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', 'dbo', 'table', 'Sys_RoleAuthorize', 'column', 'CreateUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_RoleAuthorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_RoleAuthorize', 'column', 'CreateTime'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', 'dbo', 'table', 'Sys_RoleAuthorize', 'column', 'CreateTime'
go

/*==============================================================*/
/* Table: Sys_User                                              */
/*==============================================================*/
create table dbo.Sys_User (
   Id                   int                  identity(1,1) not for replication,
   Account              varchar(50)          null,
   Pwd                  varchar(30)          null,
   RealName             varchar(50)          null,
   NickName             varchar(50)          null,
   Gender               bit                  null,
   Birthday             datetime             null,
   MobilePhone          varchar(20)          null,
   Email                varchar(50)          null,
   Address              varchar(500)         null,
   CompanyId            int                  null,
   DepartmentId         int                  null,
   IsEnabled            bit                  null,
   SortCode             int                  null,
   DeleteMark           bit                  null,
   CreateUser           varchar(50)          null,
   CreateTime           datetime             null,
   ModifyUser           varchar(50)          null,
   ModifyTime           datetime             null,
   constraint PK_Sys_User primary key (Id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('dbo.Sys_User') and minor_id = 0)
begin 
   execute sp_dropextendedproperty 'MS_Description',  
   'user', 'dbo', 'table', 'Sys_User' 
 
end 


execute sp_addextendedproperty 'MS_Description',  
   '系统用户表', 
   'user', 'dbo', 'table', 'Sys_User'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Account')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Account'

end


execute sp_addextendedproperty 'MS_Description', 
   '账号',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Account'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Pwd')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Pwd'

end


execute sp_addextendedproperty 'MS_Description', 
   '登录密码',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Pwd'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RealName')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'RealName'

end


execute sp_addextendedproperty 'MS_Description', 
   '真实姓名',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'RealName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'NickName')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'NickName'

end


execute sp_addextendedproperty 'MS_Description', 
   '昵称',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'NickName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Gender')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Gender'

end


execute sp_addextendedproperty 'MS_Description', 
   '性别',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Gender'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Birthday')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Birthday'

end


execute sp_addextendedproperty 'MS_Description', 
   '生日',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Birthday'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MobilePhone')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'MobilePhone'

end


execute sp_addextendedproperty 'MS_Description', 
   '手机号',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'MobilePhone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Email')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Email'

end


execute sp_addextendedproperty 'MS_Description', 
   '邮箱',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Email'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Address')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Address'

end


execute sp_addextendedproperty 'MS_Description', 
   '地址',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'Address'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CompanyId')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'CompanyId'

end


execute sp_addextendedproperty 'MS_Description', 
   '公司ID',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'CompanyId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DepartmentId')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'DepartmentId'

end


execute sp_addextendedproperty 'MS_Description', 
   '部门id',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'DepartmentId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'IsEnabled'

end


execute sp_addextendedproperty 'MS_Description', 
   '是否启用',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SortCode')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'SortCode'

end


execute sp_addextendedproperty 'MS_Description', 
   '序号',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'SortCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteMark')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'DeleteMark'

end


execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'DeleteMark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUser')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'CreateUser'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'CreateUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'CreateTime'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUser')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'ModifyUser'

end


execute sp_addextendedproperty 'MS_Description', 
   '修改人',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'ModifyUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_User', 'column', 'ModifyTime'

end


execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', 'dbo', 'table', 'Sys_User', 'column', 'ModifyTime'
go

/*==============================================================*/
/* Table: Sys_UserRoleRelation                                  */
/*==============================================================*/
create table dbo.Sys_UserRoleRelation (
   Id                   int                  identity(1,1) not for replication,
   UserId               int                  null,
   RoleId               varchar(50)          null,
   CreateUser           varchar(50)          null,
   CreateTime           datetime             null,
   constraint PK_Sys_UserRoleRelation primary key (Id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('dbo.Sys_UserRoleRelation') and minor_id = 0)
begin 
   execute sp_dropextendedproperty 'MS_Description',  
   'user', 'dbo', 'table', 'Sys_UserRoleRelation' 
 
end 


execute sp_addextendedproperty 'MS_Description',  
   '用户-角色对应表', 
   'user', 'dbo', 'table', 'Sys_UserRoleRelation'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_UserRoleRelation')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UserId')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_UserRoleRelation', 'column', 'UserId'

end


execute sp_addextendedproperty 'MS_Description', 
   '用户ID',
   'user', 'dbo', 'table', 'Sys_UserRoleRelation', 'column', 'UserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_UserRoleRelation')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RoleId')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_UserRoleRelation', 'column', 'RoleId'

end


execute sp_addextendedproperty 'MS_Description', 
   '角色ID',
   'user', 'dbo', 'table', 'Sys_UserRoleRelation', 'column', 'RoleId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_UserRoleRelation')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUser')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_UserRoleRelation', 'column', 'CreateUser'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', 'dbo', 'table', 'Sys_UserRoleRelation', 'column', 'CreateUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dbo.Sys_UserRoleRelation')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   execute sp_dropextendedproperty 'MS_Description', 
   'user', 'dbo', 'table', 'Sys_UserRoleRelation', 'column', 'CreateTime'

end


execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', 'dbo', 'table', 'Sys_UserRoleRelation', 'column', 'CreateTime'
go

