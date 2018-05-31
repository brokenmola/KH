create table emp1
as
select*from emp;
--영역 설정 후 alt x
create or replace procedure dell_all
is
begin
		delete from emp1;
end ;
--영역 설정 후 alt c

select*from emp1;

select*from emp;
--
create table emp2
as
select*from emp;

create or replace procedure
	del_name(vname emp.ename%TYPE)
is
 begin
	 delete from emp2 where ename=vename;
 end ;
 --영역 설정 후 alt c