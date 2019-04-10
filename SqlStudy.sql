--创建序列
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
  
  
UPDATE department 
SET dept_name = 'hha' 
WHERE
	dept_name = ( SELECT deptnames FROM course d WHERE d.course_id = '2' );
