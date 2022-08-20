drop table rentCarCompany CASCADE CONSTRAINTS;
drop SEQUENCE seq_RentCarCompany;


--��Ʈī ȸ��
CREATE TABLE rentCarCompany(
companyNo number ,
companyName VARCHAR2(100) not null,
tel VARCHAR2(30) not null,
address VARCHAR2(1000) not null,
id varchar2(30) --memeber REFERENCES �����������
);

alter table rentCarCompany
ADD CONSTRAINT pk_rentCarCompany PRIMARY key (companyNo);

create SEQUENCE seq_RentCarCompany;


--drop table rentCarBoard CASCADE CONSTRAINTS;
--drop SEQUENCE seq_RentCarBoard;
--��Ʈī �Խ���
--CREATE TABLE rentCarBoard(
--rentNo number ,
--title VARCHAR2(300) not null,
--id VARCHAR2(30) not null,
--carNo number not null, -- �Խ��� �Է��Ҷ� �����ؼ� �־���
--companyNo number not null, --rentCarCompany���̺� ���۷���
--insuranceInfo VARCHAR2(2000), --����ȳ�
--rentCarNote VARCHAR2(2000), -- �������
--cancelAndRefund VARCHAR2(2000) --���/ȯ��
--);

--create SEQUENCE seq_RentCarBoard;

--alter table rentCarBoard
--ADD CONSTRAINT pk_RentCarBoard PRIMARY key (rentNo);

--rentCarCompany���̺� ���۷���
--alter table rentCarBoard
--ADD CONSTRAINT fk_RentCarBoard FOREIGN key(companyNo)
--REFERENCES rentCarCompany(companyNo);



drop table cars CASCADE CONSTRAINTS;
drop SEQUENCE seq_Cars;

-- �� ���
CREATE TABLE cars(
carNo number,
companyNo number ,
carName VARCHAR2(100),
price number not null,
gearbox varchar2(10) default '�ڵ�' CHECK (gearbox in ('�ڵ�','����','���')), -- ����,�ڵ�
modelYears Date , -- ������
insuranceType VARCHAR2(100) default '����������' CHECK (InsuranceType in ('�����������','�Ϲ���������','����������')), -- �����������,�Ϲ���������, ����������
carTypes VARCHAR2(100) CHECK (carTypes in ('����','����','���','suv/����','����')), -- (����) ����,����,���,suv/����,����
rentAge number, --�뿩 ���� ����
rentExperience NUMBER, --�������
carFuel VARCHAR2(100), -- �� ����
carCapacity number default 5,-- ���� ����
license varchar2(50),
insuranceInfo VARCHAR2(2000), --����ȳ�
rentCarNote VARCHAR2(2000), -- �������
cancelAndRefund VARCHAR2(2000), --���/ȯ��
writeDate Date default SYSDATE ,
updateDate Date default sysdate,
id VARCHAR2(50)
);

create SEQUENCE seq_Cars;

--rentCarCompany���̺� ���۷���
alter table cars
ADD CONSTRAINT fk_Cars FOREIGN key(companyNo)
REFERENCES rentCarCompany(companyNo);

alter table cars
ADD CONSTRAINT pk_Cars PRIMARY key (carNo);




drop table carOption CASCADE CONSTRAINTS;
drop SEQUENCE seq_CarOption;

--���ɼ� --�ɼ��� ������ 1 ������ 0
create table carOption(
carNo number ,
smoking varchar2(50),
navigation varchar2(50),
blackbox varchar2(50),
rearCamera varchar2(50),
rearSensor varchar2(50),
frontSensor varchar2(50),
sunroof varchar2(50),
bluetooth varchar2(50),
heatingSheet varchar2(50),
heatingHandle varchar2(50),
leatherSheet varchar2(50),
ventilationSheet varchar2(50),
carSeatPay varchar2(50), -- ���̿� �߰�����
carSeatFree varchar2(50),
driverAirbag varchar2(50),
passengerAirbag varchar2(50), --�°��� �����
fourWheel varchar2(50), --4��
smartKey varchar2(50),
rearAutomaticDoor varchar2(50),
freeCharge varchar2(50),
usb varchar2(50),
aux varchar2(50),
dmb varchar2(50),
camping varchar2(50)
);

create SEQUENCE seq_CarOption;

alter table carOption
ADD CONSTRAINT fk_CarOption FOREIGN key(carNo)
REFERENCES cars(carNo);


drop table carInsurance CASCADE CONSTRAINTS;
drop SEQUENCE seq_CarInsurance;
---����
create table carInsurance(
carNo number,
insuranceNo number,
category VARCHAR2(100), -- �Ϲ�����, �������
insurancePrice number, -- �����
insuranceAge number, --���谡�԰��ɳ��� 
insuranceExperience number, --�������
compensation number,--�����ѵ�(���ڷθ�)
customerCharge VARCHAR2(1000)-- �� �δ��
);

create SEQUENCE seq_CarInsurance;

alter table carInsurance
ADD CONSTRAINT fk_CarInsurance FOREIGN key(carNo)
REFERENCES cars(carNo);




--���� ���ε� rentCarBoard_fileUpload
drop table car_FileUpload CASCADE CONSTRAINTS;
drop SEQUENCE seq_car_FileUpload;

create table car_FileUpload(
carNo number, --carNo �� ����
orgFileName varchar2(2000),
fileName varchar2(2000),
realSavePath varchar2(2000)
);

create SEQUENCE seq_car_FileUpload;

alter table car_FileUpload
ADD CONSTRAINT fk_car_FileUpload FOREIGN key(carNo)
REFERENCES cars(carNo);


