CREATE TABLE SCHEDULE(
	sch_no number, 	--���� ��ȣ(pk)
	user_no number not null, --ȸ����ȣ(����)
	start_date date not null, --���� ���� ����
	end_date date not null, --���� ���� ����
	sch_title varchar2(45) not null, --���� ����
	sch_content varchar2(3000) not null, --������ ���� ����,�޸�
	sch_review varchar2(3000) , --���������� �ı�
	constraint schedule_sch_no_pk primary key(sch_no), --sch_no�� pk�� ����
	constraint schedule_user_no_fk foreign key(user_no) references client(user_no)
	--user_no�� fk�� ���� user ���̺��� user_no �����ϵ���
) --���� �Ϸ�

create table sch_detail(
	detail_no number, --���� ���� ��ȣ(pk)
	user_no number not null,-- ȸ����ȣ(����)
	sch_no number not null,	--���� ��ȣ (����)
	travel_no number not null,--���� ��ȣ(����)
	festival_no number not null, --���� ��ȣ(����)
	det_content varchar2(3000), --���� ���� ����
	det_start date, --���� ���� ���� �ð�(�Ⱦ����� ����)
	det_end date, --���� ���� ���� �ð�(�Ⱦ����� ����)
	det_date date, --���� ���� ��¥
	constraint detail_user_no_fk foreign key(user_no) references client(user_no), 
	constraint detail_no_pk primary key(detail_no), --���� ���� ��ȣ pk�� ����
	constraint detail_sch_no_fk foreign key(sch_no) references schedule(sch_no), --sch_no ����Ű�� ����
	constraint detail_travel_no_fk foreign key(travel_no) references travel_information(travel_no), --travel_no ����Ű�� ����
	constraint detail_festival_no_fk foreign key(festival_no) references festival_information(festival_no) --festival_no ����Ű�� ����	
)



create table client(user_no number primary key) --���� �Ϸ�
create table travel_information(travel_no number primary key) --���� �Ϸ�
create table festival_information(Festival_no number primary key) --���� �Ϸ�

drop table client;
select * from schedule
drop table schedule;



create table test(date_test date, char_test varchar2(20));
insert into test values( TO_DATE('19550405'),'����');
SELECT * FROM TEST;
commit
alter table schedule modify sch_content not null;
alter table schedule modify sch_review  null;
insert into schedule (sch_no,start_date,end_date,sch_title,sch_content) values(1,to_date('19990502'),to_date('2005/04/05'), '�ٺ�','�ٺ���');
