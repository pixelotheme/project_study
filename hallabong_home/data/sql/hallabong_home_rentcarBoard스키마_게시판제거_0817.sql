drop table rentCarCompany CASCADE CONSTRAINTS;
drop SEQUENCE seq_RentCarCompany;


--렌트카 회사
CREATE TABLE rentCarCompany(
companyNo number ,
companyName VARCHAR2(100) not null,
tel VARCHAR2(30) not null,
address VARCHAR2(1000) not null,
id varchar2(30) --memeber REFERENCES 지정해줘야함
);

alter table rentCarCompany
ADD CONSTRAINT pk_rentCarCompany PRIMARY key (companyNo);

create SEQUENCE seq_RentCarCompany;


--drop table rentCarBoard CASCADE CONSTRAINTS;
--drop SEQUENCE seq_RentCarBoard;
--렌트카 게시판
--CREATE TABLE rentCarBoard(
--rentNo number ,
--title VARCHAR2(300) not null,
--id VARCHAR2(30) not null,
--carNo number not null, -- 게시판 입력할때 선택해서 넣어줌
--companyNo number not null, --rentCarCompany테이블 레퍼럼스
--insuranceInfo VARCHAR2(2000), --보험안내
--rentCarNote VARCHAR2(2000), -- 참고사항
--cancelAndRefund VARCHAR2(2000) --취소/환불
--);

--create SEQUENCE seq_RentCarBoard;

--alter table rentCarBoard
--ADD CONSTRAINT pk_RentCarBoard PRIMARY key (rentNo);

--rentCarCompany테이블 레퍼럼스
--alter table rentCarBoard
--ADD CONSTRAINT fk_RentCarBoard FOREIGN key(companyNo)
--REFERENCES rentCarCompany(companyNo);



drop table cars CASCADE CONSTRAINTS;
drop SEQUENCE seq_Cars;

-- 차 등록
CREATE TABLE cars(
carNo number,
companyNo number ,
carName VARCHAR2(100),
price number not null,
gearbox varchar2(10) default '자동' CHECK (gearbox in ('자동','수동','모두')), -- 수동,자동
modelYears Date , -- 연도만
insuranceType VARCHAR2(100) default '자차미포함' CHECK (InsuranceType in ('고급자차포함','일반자차포함','자차미포함')), -- 고급자차포함,일반자차포함, 자차미포함
carTypes VARCHAR2(100) CHECK (carTypes in ('소형','중형','고급','suv/승합','수입')), -- (차종) 소형,중형,고급,suv/승합,수입
rentAge number, --대여 기준 나이
rentExperience NUMBER, --운전경력
carFuel VARCHAR2(100), -- 차 연료
carCapacity number default 5,-- 승차 정원
license varchar2(50),
insuranceInfo VARCHAR2(2000), --보험안내
rentCarNote VARCHAR2(2000), -- 참고사항
cancelAndRefund VARCHAR2(2000), --취소/환불
writeDate Date default SYSDATE ,
updateDate Date default sysdate,
id VARCHAR2(50)
);

create SEQUENCE seq_Cars;

--rentCarCompany테이블 레퍼럼스
alter table cars
ADD CONSTRAINT fk_Cars FOREIGN key(companyNo)
REFERENCES rentCarCompany(companyNo);

alter table cars
ADD CONSTRAINT pk_Cars PRIMARY key (carNo);




drop table carOption CASCADE CONSTRAINTS;
drop SEQUENCE seq_CarOption;

--차옵션 --옵션이 있으면 1 없으면 0
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
carSeatPay varchar2(50), -- 아이용 추가의자
carSeatFree varchar2(50),
driverAirbag varchar2(50),
passengerAirbag varchar2(50), --승객용 에어백
fourWheel varchar2(50), --4륜
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
---보험
create table carInsurance(
carNo number,
insuranceNo number,
category VARCHAR2(100), -- 일반자차, 고급자차
insurancePrice number, -- 보험금
insuranceAge number, --보험가입가능나이 
insuranceExperience number, --운전경력
compensation number,--보상한도(숫자로만)
customerCharge VARCHAR2(1000)-- 고객 부담금
);

create SEQUENCE seq_CarInsurance;

alter table carInsurance
ADD CONSTRAINT fk_CarInsurance FOREIGN key(carNo)
REFERENCES cars(carNo);




--파일 업로드 rentCarBoard_fileUpload
drop table car_FileUpload CASCADE CONSTRAINTS;
drop SEQUENCE seq_car_FileUpload;

create table car_FileUpload(
carNo number, --carNo 로 변경
orgFileName varchar2(2000),
fileName varchar2(2000),
realSavePath varchar2(2000)
);

create SEQUENCE seq_car_FileUpload;

alter table car_FileUpload
ADD CONSTRAINT fk_car_FileUpload FOREIGN key(carNo)
REFERENCES cars(carNo);


