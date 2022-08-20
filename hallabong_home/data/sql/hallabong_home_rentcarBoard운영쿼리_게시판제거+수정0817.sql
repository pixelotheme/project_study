--자동차회사 등록
insert into rentCarCompany (companyNo, companyName, tel, address,id)
VALUES(seq_RentCarCompany.nextval, '한라산렌트카','064-748-8222','제주특별자치도 제주시 제성1길 75 도두일동1173-2번지','admin');
insert into rentCarCompany (companyNo, companyName, tel, address,id)
VALUES(seq_RentCarCompany.nextval, '한라산렌트카test1','064-748-8222','제주특별자치도 제주시 제성1길 75 도두일동1173-2번지','admin');
insert into rentCarCompany (companyNo, companyName, tel, address,id)
VALUES(seq_RentCarCompany.nextval, '한라산렌트카test2','064-748-8222','제주특별자치도 제주시 제성1길 75 도두일동1173-2번지','admin');

commit;


--차량 등록 --자차미포함 생략, 오토 생략
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 1, '더 뉴 그랜저IG', 112500, TO_DATE('2020-06','YYYY-MM'),
'고급',26,3,'휘발유', 5, '2종보통이상'
,'일반자차- 한도내사고시 면책금20만원.휴차보상료 정상요금의 50%발생
고급자차 - 한도내사고시 면책금20만원만 회사에지급 ','★ .공항에서 셔틀이용하지 않으시고 제주도내에 계시다가 직접이용하실경우

꼭 위에 고지된  도로명주소: 제주시 제성1길75
                   지번검색: 제주시 도두일동 1173-2번으로 오셔야합니다','★ 한라산렌트카에서는 (배차시간24시간전취소시) 100% 환불 처리 합니다.

   - 배차시간24시간내 및 당일캔슬은 결재금액의 50%수수료가 차감되어 환불됩니다','admin');
   
commit;
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 1, '더 뉴 그랜저IG test1', 112500, TO_DATE('2020-06','YYYY-MM'),
'고급',26,3,'휘발유', 5, '2종보통이상'
,'일반자차- 한도내사고시 면책금20만원.휴차보상료 정상요금의 50%발생
고급자차 - 한도내사고시 면책금20만원만 회사에지급 ','★ .공항에서 셔틀이용하지 않으시고 제주도내에 계시다가 직접이용하실경우

꼭 위에 고지된  도로명주소: 제주시 제성1길75
                   지번검색: 제주시 도두일동 1173-2번으로 오셔야합니다','★ 한라산렌트카에서는 (배차시간24시간전취소시) 100% 환불 처리 합니다.

   - 배차시간24시간내 및 당일캔슬은 결재금액의 50%수수료가 차감되어 환불됩니다','admin');

insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 1, '더 뉴 그랜저IG test2', 112500, TO_DATE('2020-06','YYYY-MM'),
'고급',26,3,'휘발유', 5, '2종보통이상'
,'일반자차- 한도내사고시 면책금20만원.휴차보상료 정상요금의 50%발생
고급자차 - 한도내사고시 면책금20만원만 회사에지급 ','★ .공항에서 셔틀이용하지 않으시고 제주도내에 계시다가 직접이용하실경우

꼭 위에 고지된  도로명주소: 제주시 제성1길75
                   지번검색: 제주시 도두일동 1173-2번으로 오셔야합니다','★ 한라산렌트카에서는 (배차시간24시간전취소시) 100% 환불 처리 합니다.

   - 배차시간24시간내 및 당일캔슬은 결재금액의 50%수수료가 차감되어 환불됩니다','admin');
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 2, '더 뉴 그랜저IGcom2test1', 112500, TO_DATE('2020-06','YYYY-MM'),
'고급',26,3,'휘발유', 5, '2종보통이상'
,'일반자차- 한도내사고시 면책금20만원.휴차보상료 정상요금의 50%발생
고급자차 - 한도내사고시 면책금20만원만 회사에지급 ','★ .공항에서 셔틀이용하지 않으시고 제주도내에 계시다가 직접이용하실경우

꼭 위에 고지된  도로명주소: 제주시 제성1길75
                   지번검색: 제주시 도두일동 1173-2번으로 오셔야합니다','★ 한라산렌트카에서는 (배차시간24시간전취소시) 100% 환불 처리 합니다.

   - 배차시간24시간내 및 당일캔슬은 결재금액의 50%수수료가 차감되어 환불됩니다','admin');
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 2, '더 뉴 그랜저IGcom2test2', 112500, TO_DATE('2020-06','YYYY-MM'),
'고급',26,3,'휘발유', 5, '2종보통이상'
,'일반자차- 한도내사고시 면책금20만원.휴차보상료 정상요금의 50%발생
고급자차 - 한도내사고시 면책금20만원만 회사에지급 ','★ .공항에서 셔틀이용하지 않으시고 제주도내에 계시다가 직접이용하실경우

꼭 위에 고지된  도로명주소: 제주시 제성1길75
                   지번검색: 제주시 도두일동 1173-2번으로 오셔야합니다','★ 한라산렌트카에서는 (배차시간24시간전취소시) 100% 환불 처리 합니다.

   - 배차시간24시간내 및 당일캔슬은 결재금액의 50%수수료가 차감되어 환불됩니다','admin');
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 2, '더 뉴 그랜저IGcom2test3', 112500, TO_DATE('2020-06','YYYY-MM'),
'고급',26,3,'휘발유', 5, '2종보통이상'
,'일반자차- 한도내사고시 면책금20만원.휴차보상료 정상요금의 50%발생
고급자차 - 한도내사고시 면책금20만원만 회사에지급 ','★ .공항에서 셔틀이용하지 않으시고 제주도내에 계시다가 직접이용하실경우

꼭 위에 고지된  도로명주소: 제주시 제성1길75
                   지번검색: 제주시 도두일동 1173-2번으로 오셔야합니다','★ 한라산렌트카에서는 (배차시간24시간전취소시) 100% 환불 처리 합니다.

   - 배차시간24시간내 및 당일캔슬은 결재금액의 50%수수료가 차감되어 환불됩니다','admin');
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 2, '더 뉴 그랜저IGcom2test4', 112500, TO_DATE('2020-06','YYYY-MM'),
'고급',26,3,'휘발유', 5, '2종보통이상'
,'일반자차- 한도내사고시 면책금20만원.휴차보상료 정상요금의 50%발생
고급자차 - 한도내사고시 면책금20만원만 회사에지급 ','★ .공항에서 셔틀이용하지 않으시고 제주도내에 계시다가 직접이용하실경우

꼭 위에 고지된  도로명주소: 제주시 제성1길75
                   지번검색: 제주시 도두일동 1173-2번으로 오셔야합니다','★ 한라산렌트카에서는 (배차시간24시간전취소시) 100% 환불 처리 합니다.

   - 배차시간24시간내 및 당일캔슬은 결재금액의 50%수수료가 차감되어 환불됩니다','admin');
commit;



--보험등록 --일반 자차
insert into carInsurance(carNo, insuranceNo, category, insurancePrice,
insuranceAge, insuranceExperience,compensation,customerCharge)
VALUES(1,SEQ_CARINSURANCE.nextval, '일반자차', 20000, 26, 3, 400, 
'수리비의20%부담.휴차보상료있음')
;
commit;

--보험등록 --고급 자차
insert into carInsurance(carNo, insuranceNo, category, insurancePrice,
insuranceAge, insuranceExperience,compensation,customerCharge)
VALUES(1,SEQ_CarINSURANCE.nextval, '고급자차', 25000, 26, 3, 400, 
'면책금20만원')
;
commit;

--차 옵션 입력 --영어는 대문자로 입력
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(1,'금연차량','네비게이션','블랙박스','후방카메라','후방센서',
'썬루프','블루투스','열선시트','열선핸들','가죽시트','운전석에어백','스마트키',
'USB','AUX','DMB');
commit;

insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(2,'금연차량','네비게이션','블랙박스','후방카메라','후방센서',
'썬루프','블루투스','열선시트','열선핸들','가죽시트','운전석에어백','스마트키',
'USB','AUX','DMB');
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(3,'금연차량','네비게이션','블랙박스','후방카메라','후방센서',
'썬루프','블루투스','열선시트','열선핸들','가죽시트','운전석에어백','스마트키',
'USB','AUX','DMB');
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(4,'금연차량','네비게이션','블랙박스','후방카메라','후방센서',
'썬루프','블루투스','열선시트','열선핸들','가죽시트','운전석에어백','스마트키',
'USB','AUX','DMB');
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(5,'금연차량','네비게이션','블랙박스','후방카메라','후방센서',
'썬루프','블루투스','열선시트','열선핸들','가죽시트','운전석에어백','스마트키',
'USB','AUX','DMB');
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(6,'금연차량','네비게이션','블랙박스','후방카메라','후방센서',
'썬루프','블루투스','열선시트','열선핸들','가죽시트','운전석에어백','스마트키',
'USB','AUX','DMB');
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(7,'금연차량','네비게이션','블랙박스','후방카메라','후방센서',
'썬루프','블루투스','열선시트','열선핸들','가죽시트','운전석에어백','스마트키',
'USB','AUX','DMB');

commit;
--delete from caroption 
--where carNo = 1;
--commit;

--인덱스 설정....
--

--list 한번에 데이터 뽑기 서브쿼리
-- 파일업로드 아직 없음 -> 나중에 추가예정
select 
rcc.companyName, rcc.companyNo,
cars.insuranceInfo,cars.rentCarNote,cars.cancelAndRefund,rcc.id,
cars.carNo,cars.carName, cars.carTypes, cars.carFuel,cars.modelYears,cars.rentAge, cars.price,
cop.smoking,cop.navigation,cop.blackbox,cop.rearCamera,cop.rearSensor,cop.frontSensor,cop.sunroof,
cop.bluetooth,cop.heatingSheet,cop.heatingHandle
from rentcarcompany rcc,cars cars,caroption cop
where rcc.companyno = cars.companyno and cop.carno = cars.carno 
order by cars.carno desc
;

---검색, 페이징
select 
    rcc.companyName, rcc.companyNo,
    cars.insuranceInfo,cars.rentCarNote,cars.cancelAndRefund,rcc.id,
    cars.carNo,cars.carName, cars.carTypes, cars.carFuel,cars.modelYears,cars.rentAge, cars.price,
    cop.smoking,cop.navigation,cop.blackbox,cop.rearCamera,cop.rearSensor,cop.frontSensor,cop.sunroof,
    cop.bluetooth,cop.heatingSheet,cop.heatingHandle
from 
    rentcarcompany rcc,cars cars,caroption cop
where 
    rcc.companyno = cars.companyno and cop.carno = cars.carno 
    and (cars.carname like '%test1%' and rcc.companyname like '%test1%')
order by cars.carno desc
;


--각 vo 마다 정보 가져오기 list 용도
--rentcarcompany
select
/*+ index_desc(rentCarCompany pk_rentCarCompany) */
companyName, companyNo,insuranceInfo,rentCarNote,cancelAndRefund,id
from rentcarcompany;

--cars
select
/*+ index_desc(cars pk_cars) */
companyNo,carNo,carName, carTypes, carFuel,modelYears,rentAge, price
from cars;

--carOption
select
carNo,smoking,navigation,blackbox,rearCamera,rearSensor,frontSensor,sunroof,
bluetooth,heatingSheet,heatingHandle
from caroption;

--carOption list 용으로 따로 뽑기
	select
		cop.carNo,cop.smoking,cop.navigation,cop.blackbox,cop.rearCamera,cop.rearSensor,cop.frontSensor,cop.sunroof,
		cop.bluetooth,cop.heatingSheet,cop.heatingHandle
		
	from
		caroption cop, cars cars
	where cop.carNo = cars.carNo;

-----
--view 데이터 가져오기 carNo 기준 
--렌트카 회사
select rcc.companyNo, rcc.companyName, rcc.tel, rcc.address, rcc.id
from rentcarcompany rcc, cars cars
where rcc.companyNo = cars.companyNo and cars.carNo = 1;

--cars
select carNo, companyNo, carName, price, gearbox, modelyears, carTypes, rentAge,
rentExperience,carFuel,carCapacity ,license,insuranceInfo ,
rentCarNote ,cancelAndRefund,writeDate ,updateDate, id
from cars
where carNo = 1;

--carOption
select carNo ,smoking,navigation,blackbox,rearCamera,rearSensor,frontSensor,
sunroof,bluetooth,heatingSheet,leatherSheet,ventilationSheet,carSeatPay ,carSeatFree,
driverAirbag,passengerAirbag ,fourWheel ,smartKey,rearAutomaticDoor,freeCharge,usb,
aux,dmb,camping
from caroption
where carNo = 1;

--Insurance 
select carNo, insuranceNo,category ,insurancePrice ,insuranceAge,
insuranceExperience ,compensation, customerCharge 
from carinsurance
where carNo = 1;

--car_FileUpload
select carNo, orgFileName, fileName, realSavePath
from car_fileupload
where carNo = 1;