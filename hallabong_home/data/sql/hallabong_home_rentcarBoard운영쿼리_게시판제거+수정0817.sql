--�ڵ���ȸ�� ���
insert into rentCarCompany (companyNo, companyName, tel, address,id)
VALUES(seq_RentCarCompany.nextval, '�Ѷ�귻Ʈī','064-748-8222','����Ư����ġ�� ���ֽ� ����1�� 75 �����ϵ�1173-2����','admin');
insert into rentCarCompany (companyNo, companyName, tel, address,id)
VALUES(seq_RentCarCompany.nextval, '�Ѷ�귻Ʈītest1','064-748-8222','����Ư����ġ�� ���ֽ� ����1�� 75 �����ϵ�1173-2����','admin');
insert into rentCarCompany (companyNo, companyName, tel, address,id)
VALUES(seq_RentCarCompany.nextval, '�Ѷ�귻Ʈītest2','064-748-8222','����Ư����ġ�� ���ֽ� ����1�� 75 �����ϵ�1173-2����','admin');

commit;


--���� ��� --���������� ����, ���� ����
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 1, '�� �� �׷���IG', 112500, TO_DATE('2020-06','YYYY-MM'),
'���',26,3,'�ֹ���', 5, '2�������̻�'
,'�Ϲ�����- �ѵ������� ��å��20����.��������� �������� 50%�߻�
������� - �ѵ������� ��å��20������ ȸ�翡���� ','�� .���׿��� ��Ʋ�̿����� �����ð� ���ֵ����� ��ôٰ� �����̿��Ͻǰ��

�� ���� ������  ���θ��ּ�: ���ֽ� ����1��75
                   �����˻�: ���ֽ� �����ϵ� 1173-2������ ���ž��մϴ�','�� �Ѷ�귻Ʈī������ (�����ð�24�ð�����ҽ�) 100% ȯ�� ó�� �մϴ�.

   - �����ð�24�ð��� �� ����ĵ���� ����ݾ��� 50%�����ᰡ �����Ǿ� ȯ�ҵ˴ϴ�','admin');
   
commit;
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 1, '�� �� �׷���IG test1', 112500, TO_DATE('2020-06','YYYY-MM'),
'���',26,3,'�ֹ���', 5, '2�������̻�'
,'�Ϲ�����- �ѵ������� ��å��20����.��������� �������� 50%�߻�
������� - �ѵ������� ��å��20������ ȸ�翡���� ','�� .���׿��� ��Ʋ�̿����� �����ð� ���ֵ����� ��ôٰ� �����̿��Ͻǰ��

�� ���� ������  ���θ��ּ�: ���ֽ� ����1��75
                   �����˻�: ���ֽ� �����ϵ� 1173-2������ ���ž��մϴ�','�� �Ѷ�귻Ʈī������ (�����ð�24�ð�����ҽ�) 100% ȯ�� ó�� �մϴ�.

   - �����ð�24�ð��� �� ����ĵ���� ����ݾ��� 50%�����ᰡ �����Ǿ� ȯ�ҵ˴ϴ�','admin');

insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 1, '�� �� �׷���IG test2', 112500, TO_DATE('2020-06','YYYY-MM'),
'���',26,3,'�ֹ���', 5, '2�������̻�'
,'�Ϲ�����- �ѵ������� ��å��20����.��������� �������� 50%�߻�
������� - �ѵ������� ��å��20������ ȸ�翡���� ','�� .���׿��� ��Ʋ�̿����� �����ð� ���ֵ����� ��ôٰ� �����̿��Ͻǰ��

�� ���� ������  ���θ��ּ�: ���ֽ� ����1��75
                   �����˻�: ���ֽ� �����ϵ� 1173-2������ ���ž��մϴ�','�� �Ѷ�귻Ʈī������ (�����ð�24�ð�����ҽ�) 100% ȯ�� ó�� �մϴ�.

   - �����ð�24�ð��� �� ����ĵ���� ����ݾ��� 50%�����ᰡ �����Ǿ� ȯ�ҵ˴ϴ�','admin');
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 2, '�� �� �׷���IGcom2test1', 112500, TO_DATE('2020-06','YYYY-MM'),
'���',26,3,'�ֹ���', 5, '2�������̻�'
,'�Ϲ�����- �ѵ������� ��å��20����.��������� �������� 50%�߻�
������� - �ѵ������� ��å��20������ ȸ�翡���� ','�� .���׿��� ��Ʋ�̿����� �����ð� ���ֵ����� ��ôٰ� �����̿��Ͻǰ��

�� ���� ������  ���θ��ּ�: ���ֽ� ����1��75
                   �����˻�: ���ֽ� �����ϵ� 1173-2������ ���ž��մϴ�','�� �Ѷ�귻Ʈī������ (�����ð�24�ð�����ҽ�) 100% ȯ�� ó�� �մϴ�.

   - �����ð�24�ð��� �� ����ĵ���� ����ݾ��� 50%�����ᰡ �����Ǿ� ȯ�ҵ˴ϴ�','admin');
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 2, '�� �� �׷���IGcom2test2', 112500, TO_DATE('2020-06','YYYY-MM'),
'���',26,3,'�ֹ���', 5, '2�������̻�'
,'�Ϲ�����- �ѵ������� ��å��20����.��������� �������� 50%�߻�
������� - �ѵ������� ��å��20������ ȸ�翡���� ','�� .���׿��� ��Ʋ�̿����� �����ð� ���ֵ����� ��ôٰ� �����̿��Ͻǰ��

�� ���� ������  ���θ��ּ�: ���ֽ� ����1��75
                   �����˻�: ���ֽ� �����ϵ� 1173-2������ ���ž��մϴ�','�� �Ѷ�귻Ʈī������ (�����ð�24�ð�����ҽ�) 100% ȯ�� ó�� �մϴ�.

   - �����ð�24�ð��� �� ����ĵ���� ����ݾ��� 50%�����ᰡ �����Ǿ� ȯ�ҵ˴ϴ�','admin');
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 2, '�� �� �׷���IGcom2test3', 112500, TO_DATE('2020-06','YYYY-MM'),
'���',26,3,'�ֹ���', 5, '2�������̻�'
,'�Ϲ�����- �ѵ������� ��å��20����.��������� �������� 50%�߻�
������� - �ѵ������� ��å��20������ ȸ�翡���� ','�� .���׿��� ��Ʋ�̿����� �����ð� ���ֵ����� ��ôٰ� �����̿��Ͻǰ��

�� ���� ������  ���θ��ּ�: ���ֽ� ����1��75
                   �����˻�: ���ֽ� �����ϵ� 1173-2������ ���ž��մϴ�','�� �Ѷ�귻Ʈī������ (�����ð�24�ð�����ҽ�) 100% ȯ�� ó�� �մϴ�.

   - �����ð�24�ð��� �� ����ĵ���� ����ݾ��� 50%�����ᰡ �����Ǿ� ȯ�ҵ˴ϴ�','admin');
insert into cars(carNo, companyNo, carName, price, modelYears, 
carTypes, rentAge, rentExperience, carFuel, carCapacity,license,insuranceInfo,rentCarNote,cancelAndRefund,id)
VALUES(seq_Cars.nextval, 2, '�� �� �׷���IGcom2test4', 112500, TO_DATE('2020-06','YYYY-MM'),
'���',26,3,'�ֹ���', 5, '2�������̻�'
,'�Ϲ�����- �ѵ������� ��å��20����.��������� �������� 50%�߻�
������� - �ѵ������� ��å��20������ ȸ�翡���� ','�� .���׿��� ��Ʋ�̿����� �����ð� ���ֵ����� ��ôٰ� �����̿��Ͻǰ��

�� ���� ������  ���θ��ּ�: ���ֽ� ����1��75
                   �����˻�: ���ֽ� �����ϵ� 1173-2������ ���ž��մϴ�','�� �Ѷ�귻Ʈī������ (�����ð�24�ð�����ҽ�) 100% ȯ�� ó�� �մϴ�.

   - �����ð�24�ð��� �� ����ĵ���� ����ݾ��� 50%�����ᰡ �����Ǿ� ȯ�ҵ˴ϴ�','admin');
commit;



--������ --�Ϲ� ����
insert into carInsurance(carNo, insuranceNo, category, insurancePrice,
insuranceAge, insuranceExperience,compensation,customerCharge)
VALUES(1,SEQ_CARINSURANCE.nextval, '�Ϲ�����', 20000, 26, 3, 400, 
'��������20%�δ�.�������������')
;
commit;

--������ --��� ����
insert into carInsurance(carNo, insuranceNo, category, insurancePrice,
insuranceAge, insuranceExperience,compensation,customerCharge)
VALUES(1,SEQ_CarINSURANCE.nextval, '�������', 25000, 26, 3, 400, 
'��å��20����')
;
commit;

--�� �ɼ� �Է� --����� �빮�ڷ� �Է�
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(1,'�ݿ�����','�׺���̼�','���ڽ�','�Ĺ�ī�޶�','�Ĺ漾��',
'�����','�������','������Ʈ','�����ڵ�','���׽�Ʈ','�����������','����ƮŰ',
'USB','AUX','DMB');
commit;

insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(2,'�ݿ�����','�׺���̼�','���ڽ�','�Ĺ�ī�޶�','�Ĺ漾��',
'�����','�������','������Ʈ','�����ڵ�','���׽�Ʈ','�����������','����ƮŰ',
'USB','AUX','DMB');
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(3,'�ݿ�����','�׺���̼�','���ڽ�','�Ĺ�ī�޶�','�Ĺ漾��',
'�����','�������','������Ʈ','�����ڵ�','���׽�Ʈ','�����������','����ƮŰ',
'USB','AUX','DMB');
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(4,'�ݿ�����','�׺���̼�','���ڽ�','�Ĺ�ī�޶�','�Ĺ漾��',
'�����','�������','������Ʈ','�����ڵ�','���׽�Ʈ','�����������','����ƮŰ',
'USB','AUX','DMB');
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(5,'�ݿ�����','�׺���̼�','���ڽ�','�Ĺ�ī�޶�','�Ĺ漾��',
'�����','�������','������Ʈ','�����ڵ�','���׽�Ʈ','�����������','����ƮŰ',
'USB','AUX','DMB');
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(6,'�ݿ�����','�׺���̼�','���ڽ�','�Ĺ�ī�޶�','�Ĺ漾��',
'�����','�������','������Ʈ','�����ڵ�','���׽�Ʈ','�����������','����ƮŰ',
'USB','AUX','DMB');
insert into caroption(carNo, smoking, navigation, blackbox,rearCamera,rearSensor,
sunroof,bluetooth,heatingSheet, heatingHandle, leatherSheet, driverAirbag,smartKey,
usb,aux,dmb)
values(7,'�ݿ�����','�׺���̼�','���ڽ�','�Ĺ�ī�޶�','�Ĺ漾��',
'�����','�������','������Ʈ','�����ڵ�','���׽�Ʈ','�����������','����ƮŰ',
'USB','AUX','DMB');

commit;
--delete from caroption 
--where carNo = 1;
--commit;

--�ε��� ����....
--

--list �ѹ��� ������ �̱� ��������
-- ���Ͼ��ε� ���� ���� -> ���߿� �߰�����
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

---�˻�, ����¡
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


--�� vo ���� ���� �������� list �뵵
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

--carOption list ������ ���� �̱�
	select
		cop.carNo,cop.smoking,cop.navigation,cop.blackbox,cop.rearCamera,cop.rearSensor,cop.frontSensor,cop.sunroof,
		cop.bluetooth,cop.heatingSheet,cop.heatingHandle
		
	from
		caroption cop, cars cars
	where cop.carNo = cars.carNo;

-----
--view ������ �������� carNo ���� 
--��Ʈī ȸ��
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