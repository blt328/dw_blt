
--����Դͷ������
create table t_ods_dept
(
id int,
dept_code varchar2(10),
dept_name varchar2(100),
parent_dept_code varchar2(10)
)


--��������
insert into t_ods_dept values(1,'001','�ܲ�',null);
insert into t_ods_dept values(2,'00101','����','001');
insert into t_ods_dept values(3,'00102','����','001');
insert into t_ods_dept values(4,'00103','����','001');

insert into t_ods_dept values(5,'0010101','����','00101');
insert into t_ods_dept values(6,'0010102','����','00101');
insert into t_ods_dept values(7,'0010103','��ݸ','00101');
insert into t_ods_dept values(8,'0010201','����','00102');
insert into t_ods_dept values(9,'0010202','���','00102');
insert into t_ods_dept values(10,'0010301','����','00103');
commit;

--��ʼ��������
begin
  -- Call the procedure
  p_abc_dim_dept(date'2019-05-01',1);
end;

select * from abc_dim_dept;

--5��10�ŰѶ�ݸ���������˻���������
update t_ods_dept a set a.parent_dept_code='00102' where a.dept_code='0010103';

begin
  -- Call the procedure
  p_abc_dim_dept(date'2019-05-10',0);
end;

select * from abc_dim_dept;


