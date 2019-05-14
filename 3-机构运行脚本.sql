
--创建源头机构表
create table t_ods_dept
(
id int,
dept_code varchar2(10),
dept_name varchar2(100),
parent_dept_code varchar2(10)
)


--生成数据
insert into t_ods_dept values(1,'001','总部',null);
insert into t_ods_dept values(2,'00101','华南','001');
insert into t_ods_dept values(3,'00102','华北','001');
insert into t_ods_dept values(4,'00103','华西','001');

insert into t_ods_dept values(5,'0010101','深圳','00101');
insert into t_ods_dept values(6,'0010102','广州','00101');
insert into t_ods_dept values(7,'0010103','东莞','00101');
insert into t_ods_dept values(8,'0010201','北京','00102');
insert into t_ods_dept values(9,'0010202','天津','00102');
insert into t_ods_dept values(10,'0010301','重庆','00103');
commit;

--初始化机构表
begin
  -- Call the procedure
  p_abc_dim_dept(date'2019-05-01',1);
end;

select * from abc_dim_dept;

--5月10号把东莞机构划到了华北地区。
update t_ods_dept a set a.parent_dept_code='00102' where a.dept_code='0010103';

begin
  -- Call the procedure
  p_abc_dim_dept(date'2019-05-10',0);
end;

select * from abc_dim_dept;


