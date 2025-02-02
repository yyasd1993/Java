﻿--创建序列
create sequence SEQ_USER_NO  --Sequence实例名
minvalue 1                                --最小值，可以设置为0
maxvalue 2147483647                       --最大值
start with 1                              --从1开始计数
increment by 1                            --每次加几个
nocache;                                 --设置缓存cache个序列，如果系统down掉了或者其它情况将会导致序列不连续，也可以设置为---------NOCACHE

SELECT SEQ_USER_NO.NEXTVAL FROM dual;
 
SELECT * FROM student;


create table department(  
id varchar2(4) primary key not null,
dept_name varchar2(20),  
budget varchar2(20),  
descript varchar2(20)
);  


create table course(  
course_id varchar2(20),  
deptnames varchar2(20),  
credits varchar2(20)); 


INSERT INTO department(id, dept_name, budget, descript) VALUES (1, '张三', NULL, NULL);
INSERT INTO department(id, dept_name, budget, descript) VALUES (2, '李四', NULL, NULL);
INSERT INTO department(id, dept_name, budget, descript) VALUES (3, '李四', NULL, NULL);
INSERT INTO department(id, dept_name, budget, descript) VALUES (4, '王无', NULL, NULL);

SELECT * FROM department;
SELECT * from course for update;

UPDATE department 
SET dept_name = 'hha' 
WHERE
	dept_name in ( SELECT ddd FROM course d WHERE d.course_id = '1' );
  
  
UPDATE course 
SET course_id = '3' 
WHERE
	deptname = ( SELECT deptname FROM department d WHERE d.dept_name = '张三' );


UPDATE course 
SET course_id = '3' 
WHERE
	deptname = 'deptname'
  SELECT 'deptname' FROM dual
  
select user#,name from user$;
SELECT * FROM fduser;

孙崇武
对不起，我是哑巴。
oracle 的用户管理 sqlplus的常用命令
创建用户：create user 用户名 identified by 密码；

SQL> create user scw identified by 123;

用户已创建。

SQL>
在oracle中创建用户只能由管理员或者具有管理员的权限的用户创建

修改密码：

1.修改自己的密码：

复制代码
SQL> passw;
更改 SCW 的口令
旧口令:
新口令:
重新键入新口令:
口令已更改
SQL> conn scw/123;
ERROR:
ORA-01017: invalid username/password; logon denied


警告: 您不再连接到 ORACLE。
SQL> conn scw/234;
已连接。
复制代码
2.修改其他用户密码  需要权限；

复制代码
SQL> conn system/123;
已连接。
SQL> alter user scw identified by 123;

用户已更改。

SQL>
复制代码
解锁用户/锁定用户：

复制代码
SQL> alter user scw account unlock;

用户已更改。

SQL> conn scw/123;
已连接。
SQL> conn system/123;
已连接。
SQL> alter user scw account lock;

用户已更改。

SQL> conn scw/123;
ERROR:
ORA-28000: the account is locked


警告: 您不再连接到 ORACLE。
复制代码
删除用户：

drop user 用户名;
                                   如果当前用户拥有数据库表、视图、序列等等，删除用户就需要指定关键字：cascade.
drop user zhangsan cascade;
授权：

新建的用户是没有任何权限的，包括连接数据库的权限。
新创建的用户是没有任何权限的，直接登录会报如下错误：

SQL> conn scw/123;
ERROR:
ORA-01045: user SCW lacks CREATE SESSION privilege; logon denied


警告: 您不再连接到 ORACLE。
如果新建的用户想要连接数据库，就需要被赋予权限，只有管理员才能赋予新用户权限。

系统权限：create table，create session，drop user，drop table等等
角色权限：dba 管理员
               connect：连接数据库
                resource: 创建表的权限

赋予用户连接数据库的权限：

grant create session to zhansgan;
复制代码
SQL> conn system/123;
已连接。
SQL> grant create session to scw;

授权成功。

SQL> conn scw/123;
已连接。
SQL>
复制代码
system赋予用户dba的角色：

复制代码
SQL> grant dba to scw;
grant dba to scw
*
第 1 行出现错误:
ORA-01031: 权限不足


SQL>
复制代码
复制代码
SQL> conn system/123;
已连接。

SQL> grant dba to scw;

授权成功。

SQL>

复制代码
(dba是数据库管理员
它除了重启数据库 修改字符集的权限没有外 具有其它全部权限)
DBA: 数据库管理员

用Scott给其他用户查看的权限：

复制代码
SQL> conn scott/123;
已连接。
SQL> grant select on emp to scw;

授权成功。

SQL> conn scw/234;
已连接。
SQL> select * from scott.emp;
复制代码
用system给其他用户查看的权限：

SQL> grant select on scott.emp to scw;                        grant all on scott.emp to scw; （查看所有表）  
授权成功。

SQL>
给其他用户授权的能力：

with admin option: 授予系统相关的admin权限
with grant option：授予对象相关的grant 权限
注意多级权限的回收;

撤销权限：

revoke 权限 from 用户   
注意：多级权限的回收：

对于对象权限，sys——>abc1——>abc3,当sys回收abc1权限的时候，abc3的权限也被回收了。

总结：对于系统权限，sys——>abc1——>abc2，然后由sys将abc1的权限回收，abc2依然可以连接数据库。

对表的操作：

查看当前用户的所有表：

SQL> conn scott/123;
已连接。
SQL> select * from user_tables;
查看当前用户所有表的表名：

复制代码
SQL> select table_name from user_tables;




Select *from all_users;
update user$  set name = 'root' where user# = 87; 

create user mytest
  identified by "root"
  default tablespace EFLEX_DATA001
  temporary tablespace TEMP
  profile DEFAULT
  password expire
  quota 1024m on eflex_data001;
  
  
 select * from dba_sys_privs;
select * from user_sys_privs;


