--------------------------------------------------------
--  파일이 생성됨 - 화요일-6월-20-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence MENU_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "FORME"."MENU_NUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MYNUM
--------------------------------------------------------

   CREATE SEQUENCE  "FORME"."SEQ_MYNUM"  MINVALUE 10 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 50 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NOT
--------------------------------------------------------

   CREATE SEQUENCE  "FORME"."SEQ_NOT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REV
--------------------------------------------------------

   CREATE SEQUENCE  "FORME"."SEQ_REV"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table MEMBERS
--------------------------------------------------------

  CREATE TABLE "FORME"."MEMBERS" 
   (	"ID" VARCHAR2(60 BYTE), 
	"PASSWORD" VARCHAR2(60 BYTE), 
	"BIRTH" DATE, 
	"ADDRESS" VARCHAR2(1000 BYTE), 
	"NAME" VARCHAR2(100 BYTE), 
	"HP" VARCHAR2(100 BYTE), 
	"GENDER" VARCHAR2(10 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"TURN" NUMBER(10,0) DEFAULT 1
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MENU
--------------------------------------------------------

  CREATE TABLE "FORME"."MENU" 
   (	"MENUID" NUMBER(3,0), 
	"MENUNAME" VARCHAR2(2000 BYTE), 
	"MENUTYPE" NUMBER(3,0), 
	"SUBTYPE" NUMBER(6,0), 
	"CARBOHYDRATE" NUMBER(6,0) DEFAULT 0, 
	"PROTEIN" NUMBER(6,0) DEFAULT 0, 
	"FAT" NUMBER(6,0) DEFAULT 0, 
	"NATRIUM" NUMBER(6,0) DEFAULT 0, 
	"CALORIES" NUMBER(6,0) DEFAULT 0, 
	"ALLERGY" VARCHAR2(4000 BYTE), 
	"AVGPOINT" NUMBER(6,0) DEFAULT 0, 
	"THUMBNAIL" VARCHAR2(4000 BYTE), 
	"MENUIMG" VARCHAR2(4000 BYTE), 
	"RECIPE" VARCHAR2(4000 BYTE), 
	"WEIGHT" NUMBER(6,0), 
	"MCOMMENT" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MYME
--------------------------------------------------------

  CREATE TABLE "FORME"."MYME" 
   (	"MYNUM" NUMBER(6,0), 
	"ID" VARCHAR2(60 BYTE), 
	"MENUID" NUMBER(3,0), 
	"DELIADDRESS" VARCHAR2(1000 BYTE), 
	"DELIDATE" DATE DEFAULT SYSDATE, 
	"SUBPRICE" NUMBER(6,0), 
	"SUBDATE" DATE, 
	"SUBTYPE" NUMBER(6,0), 
	"STARTDATE" DATE, 
	"ENDDATE" DATE, 
	"TURN" NUMBER(10,0), 
	"DELIOK" VARCHAR2(20 BYTE) DEFAULT '배송 미완료'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "FORME"."NOTICE" 
   (	"NOTICENUM" NUMBER(6,0), 
	"ID" VARCHAR2(60 BYTE), 
	"NOTICONTENT" VARCHAR2(4000 BYTE), 
	"NOTIDATE" DATE DEFAULT SYSDATE, 
	"NOTICETITLE" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table QA
--------------------------------------------------------

  CREATE TABLE "FORME"."QA" 
   (	"QANUM" NUMBER(10,0), 
	"ID" VARCHAR2(60 BYTE), 
	"QATITLE" VARCHAR2(60 BYTE), 
	"QADATE" DATE DEFAULT SYSDATE, 
	"QACONTENT" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REVIEWS
--------------------------------------------------------

  CREATE TABLE "FORME"."REVIEWS" 
   (	"REVIEWNUM" NUMBER(5,0), 
	"MYNUM" NUMBER(5,0), 
	"POINTS" NUMBER(5,0) DEFAULT 0, 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"WRITEDATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into FORME.MEMBERS
SET DEFINE OFF;
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('asd1234','1q2w3e',to_date('90/10/16 00:00:00','RR/MM/DD HH24:MI:SS'),'경기','이동진','010-7121-8979','m','asder8979@naver.com',to_date('23/05/30 17:08:48','RR/MM/DD HH24:MI:SS'),1);
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('test','test',to_date('17/02/08 00:00:00','RR/MM/DD HH24:MI:SS'),'서울 구로구 경인로 577 53','이푸른','010516468','남성','test@gmail.com',to_date('23/05/24 17:25:22','RR/MM/DD HH24:MI:SS'),8);
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('admin','admin',to_date('00/01/01 00:00:00','RR/MM/DD HH24:MI:SS'),'경기 성남시 분당구 판교역로 166 101호','관리자','010-0000-0000','m','forme@forme.com',to_date('23/05/24 18:16:41','RR/MM/DD HH24:MI:SS'),9);
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('fafa12','1q2w3e',to_date('18/09/23 00:00:00','RR/MM/DD HH24:MI:SS'),'경기 성남시 분당구 백현동 472-314+123','이동진','010-7121-8979','m','sad123@naver.com',to_date('23/06/01 15:48:40','RR/MM/DD HH24:MI:SS'),1);
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('fana12','1q2w3e',to_date('17/10/30 00:00:00','RR/MM/DD HH24:MI:SS'),'경기 성남시 분당구 대왕판교로 373 123','이동진','111-1111-1111','m','sad1232@naver.com',to_date('23/06/01 15:57:58','RR/MM/DD HH24:MI:SS'),1);
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('aaaa11','1q2w3e',to_date('00/02/03 00:00:00','RR/MM/DD HH24:MI:SS'),'경기 성남시 분당구 백현동 472-314 1','a','111-1111-1111','m','asder897911@naver.com',to_date('23/06/08 16:02:18','RR/MM/DD HH24:MI:SS'),1);
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('test12','test12',to_date('23/06/21 00:00:00','RR/MM/DD HH24:MI:SS'),'충남 당진시 대덕동 1604 11-4','이름','111-1111-1111','w','test@test.com',to_date('23/06/08 17:54:45','RR/MM/DD HH24:MI:SS'),1);
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('test1111','testtest1111',to_date('94/02/26 00:00:00','RR/MM/DD HH24:MI:SS'),'서울 영등포구 대림동 778-46 대림사거리 ','이푸른','010-8297-2388','m','poornnara2@gmail.com',to_date('23/06/20 10:28:13','RR/MM/DD HH24:MI:SS'),5);
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('aaaaa1','aaaaa1',to_date('19/09/29 00:00:00','RR/MM/DD HH24:MI:SS'),'경기','홍길동','010-1111-3333','m','st7276@naver.com',to_date('23/06/09 10:20:04','RR/MM/DD HH24:MI:SS'),1);
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('test123','test123',to_date('96/09/24 00:00:00','RR/MM/DD HH24:MI:SS'),'경기 성남시 분당구 백현동 532 123동','김혜인','010-2384-4202','w','sheila456@naver.com',to_date('23/06/20 10:28:35','RR/MM/DD HH24:MI:SS'),1);
Insert into FORME.MEMBERS (ID,PASSWORD,BIRTH,ADDRESS,NAME,HP,GENDER,EMAIL,REGDATE,TURN) values ('test1234','test1234',to_date('87/06/12 00:00:00','RR/MM/DD HH24:MI:SS'),'경기 성남시 분당구 백현동 산 55-8 a동','김혜인','010-2384-4202','w','sheila45@naver.com',to_date('23/06/20 11:48:02','RR/MM/DD HH24:MI:SS'),1);
REM INSERTING into FORME.MENU
SET DEFINE OFF;
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (24,'티아시아 키마 커리 덮밥',2,8000,70,43,15,340,456,'우유, 대두, 밀, 돼지고기, 토마토, 아황산류',0,'N0091.jpg','N0092.jpg','뚜껑을 열고, 전자레인지에 약 2분(700w 기준) 데워드세요.',543,'고기가 왜 이리 많아? 소스 반 고기 반이네?');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (25,'떡갈비 마요 덮밥',2,8000,79,36,23,490,463,'난류(계란, 메추리알), 우유, 대두, 밀, 고등어, 돼지고기, 토마토, 쇠고기, 오징어, 조개류(굴, 전복, 홍합)',0,'N0101.jpg','N0102.jpg','뚜껑을 열고, 윗 칸의 토핑을 밥과 함께 1000W 1분 40초, 700W 1분 50초 전자레인지에 데운 후, 골고루 비벼 드세요.',345,'입이 떡- 달콤한 떡갈비에 부드러운 마요♡');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (26,'톡톡 김치 알밥',2,8000,97,43,14,345,456,'난류(계란, 메추리알), 대두, 밀, 게, 새우, 아황산류, 쇠고기',0,'N0111.jpg','N0112.jpg','뚜껑을 열고, 전자레인지에 약 1분 30초간 데워드세요.',325,'톡톡 튀는 날치알과 상큼한 김치의 만남');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (27,'중화풍 유니짜장밥',2,8000,89,54,15,235,643,'난류(계란, 메추리알), 대두, 밀, 돼지고기',0,'N0121.jpg','N0122.jpg','뚜껑을 열고 전자레인지 2분 30초(700w) 데운 후, 내피에 있는 토핑을 밥위에 붓고 비벼드세요.',460,'부드러운 유니짜장 어떠세요?');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (28,'향긋한 봄나물 비빔밥',2,8000,45,32,13,462,345,'난류(계란, 메추리알), 대두, 밀',0,'N0131.jpg','N0132.jpg','뚜껑을 열고 아랫칸의 밥&계란후라이를 1분 30초간 데운 후, 나머지 재료를 넣고 비벼드세요.',383,'봄봄봄 봄이 왔어요~ 향긋한 나물이 내 식탁위로!');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (29,'베이컨 김치볶음밥',2,8000,76,36,16,342,573,'난류(계란, 메추리알), 우유, 대두, 밀, 새우, 돼지고기, 토마토, 닭고기, 쇠고기, 조개류(굴, 전복, 홍합)',0,'N0141.jpg','N0142.jpg','포장을 1/3 개봉하여 전자레인지(700W기준 : 약 3분, 1000W기준 : 약 2분) 데워드세요.',320,'실패없는 베이컨 김치볶음밥 아 벌써부터 배고파요..');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (30,'갈릭치킨 커리덮밥',2,8000,80,34,13,300,464,'대두, 밀, 닭고기, 쇠고기, 조개류(굴, 전복, 홍합)',0,'N0151.jpg','N0152.jpg','뚜껑을 제거 후 전자레인지(700W기준 : 약 2분 30초, 1000W기준 : 약 2분) 데워드세요.',400,'카레 토핑으로 갈릭치킨.. 맛잘알 아니에요?');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (31,'얼큰 짬뽕덮밥',2,10000,70,43,15,340,456,'우유, 대두, 밀, 새우, 돼지고기, 토마토, 쇠고기, 오징어, 조개류(굴, 전복, 홍합)',0,'N0161.jpg','N0162.jpg','뚜껑을 제거 후 전자레인지(700W기준 : 약 1분, 1000W기준 : 약 50초) 데워드세요.',343,'짬뽕이 덮밥으로?! 해물 가득 짬뽕덮밥 궁금해!');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (32,'교자만두 간장버터덮밥',2,10000,78,35,23,490,463,'난류(계란, 메추리알), 우유, 대두, 밀, 돼지고기, 쇠고기, 닭고기, 조개류(굴, 전복, 홍합)',0,'N0171.jpg','N0172.jpg','뚜껑을 열고 1000W 1분 30초, 700W 1분 50초 전자레인지에 데운 후, 골고루 비벼 드세요.',377,'단짠단짠 고소고소가 만났어요!');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (33,'소불고기 규동',2,10000,97,43,14,345,456,'난류(계란, 메추리알), 우유, 대두, 쇠고기',0,'N0181.jpg','N0182.jpg','뚜껑과 비닐을 제거 후 전자레인지(700W기준 : 약 2분, 1000W기준 : 약 1분 40초) 데워드세요.',325,'불맛나는 규동으로 든든한 한 끼 되세요!');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (34,'꼬막해초비빔밥',2,10000,89,54,15,235,643,'대두, 밀',0,'N0191.jpg','N0192.jpg','비닐을 1/2 벗긴 후, 전자레인지(700W기준 : 약 2분 30초, 1000W기준 : 약 3분) 데워드세요.',320,'꼬막과 얼큰한 땡초, 그리고 해초..☆');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (35,'한돈 곤드레나물 덮밥',2,10000,45,32,13,462,345,'난류(계란, 메추리알), 밀, 돼지고기, 조개류(굴, 전복, 홍합), 우유, 대두, 쇠고기',0,'N0201.jpg','N0202.jpg','비닐을 1/2 벗긴 후, 전자레인지(700W기준 : 약 2분 30초, 1000W기준 : 약 3분) 데워드세요.',310,'돼지고기 하면 한돈! 믿고 든든한 한 끼 되세요');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (36,'제육 강된장 비빔밥',2,10000,76,36,16,342,573,'우유, 대두, 밀, 돼지고기, 토마토, 쇠고기, 조개류(굴, 전복, 홍합)',0,'N0211.jpg','N0212.jpg','뚜껑을 열고, 제육만 밥 위에 얹어 1분 30초간 데운 후 나머지 재료를 넣고 비벼드세요. 강된장소스는 기호에 따라 조절해 넣으세요.',374,'밥에 제육을 넣고 강된장으로 쓱쓱하면 얼마나 맛있게요?');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (37,'고소한 잡채 덮밥',2,10000,80,34,13,300,464,'난류(계란, 메추리알), 대두, 새우, 돼지고기, 조개류(굴, 전복, 홍합)',0,'N0221.jpg','N0222.jpg','뚜껑을 열고, 윗 칸의 토핑을 밥 위에 넣고 전자레인지에 1000W 1분 30초 / 700W 1분 40초간 데워드세요.',354,'꼬소한 잡채와 계란 후라이로 맛있는 한 끼');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (38,'반숙란을 더한 매콤 숯불 불고기 덮밥',2,10000,70,43,15,340,456,'난류(계란, 메추리알), 우유, 대두, 밀, 돼지고기, 쇠고기',0,'N0231.jpg','N0232.jpg','뚜껑을 제거 후 전자레인지(700W기준 : 약 2분 30초, 1000W기준 : 약 2분) 데워드세요.',402,'단백질 많이 챙겨 드렸어요 ^^');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (39,'영양 가득 훈제오리 새싹비빔밥',2,10000,78,35,23,490,463,'난류(계란, 메추리알), 대두, 밀',0,'N0241.jpg','N0242.jpg','뚜껑을 열고 전자레인지에 약 1분 30초 데워드세요.',336,'훈제오리의 고소함과 참기름의 고소함이라니 ㅇㅁㅇ');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (40,'구수한 가지 강된장 곤드레덮밥',2,10000,97,43,14,345,456,'대두, 밀',0,'N0251.jpg','N0252.jpg','비닐을 1/2 벗긴 후, 전자레인지(700W기준 : 약 2분 30초, 1000W기준 : 약 3분) 데워드세요.',330,'와 솔직히 관리자도 지금 침 꼴딱 삼켰어요 가지와 제육..');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (41,'베트남식 우삼겹 쌀국수',2,10000,98,43,15,340,464,'밀, 소고기',0,'N0261.jpg','N0262.jpg','뚜껑을 제거 후 전자레인지(700W기준 : 약 2분 30초, 1000W기준 : 약 2분) 데워드세요.',402,'고소한 우삼겹을 토핑으로 했어요 잘했죠? *^_^*');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (15,'멕시칸타코샐러드',1,10000,38,41,34,55,355,'돼지고기',0,'C151.jpg','C152.jpg','수령 후, 신선할 때 드세요.',424,'바삭바삭 나쵸와 멕시칸 치킨으로 다양한 샐러드 한 끼');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (16,'불닭&에그마요 덮밥',2,6000,80,34,13,300,464,'난류(계란, 메추리알), 대두, 밀, 아황산류, 닭고기, 쇠고기, 조개류(굴, 전복, 홍합)',0,'N0011.jpg','N0012.jpg','뚜껑을 제거 후 전자레인지(700W기준 : 약 2분 30초, 1000W기준 : 약 2분) 데워드세요.',353,'매콤한 불닭과 부드러운 에그마요로 스트레스 푸세요!');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (17,'맛있게 매운 훈제오리주물럭덮밥',2,6000,70,43,15,340,456,'우유, 대두, 밀, 쇠고기',0,'N0021.jpg','N0022.jpg','뚜껑을 제거 후 전자레인지(700W기준 : 약 3분, 1000W기준 : 약 2분 30초) 데워드세요.',382,'오리의 불포화지방산 몸에 얼마나 좋게요?');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (18,'포크 소보루 나시고랭',2,6000,78,35,23,490,463,'난류(계란, 메추리알), 우유, 대두, 밀, 돼지고기, 토마토, 닭고기, 쇠고기, 조개류(굴, 전복, 홍합)',0,'N0031.jpg','N0032.jpg','뚜껑을 개봉한 후, 전자레인지(700w기준) 4분 데워주세요',340,'포실포실 스크램블과 불 맛나는 돼지고기의 만남');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (19,'한끼 든든 토마토 치-즈 제육 덮밥',2,6000,97,43,14,345,456,'난류(계란, 메추리알), 우유, 대두, 밀, 고등어, 돼지고기, 토마토, 닭고기, 쇠고기, 조개류(굴, 전복, 홍합)',0,'N0041.jpg','N0042.jpg','뚜껑을 열고, 윗 칸의 토핑을 밥과 함께 1000W 1분 40초, 700W 1분 50초 전자레인지에 데운 후, 골고루 비벼 드세요.',382,'Cheeese~와 토마토를 넣어 이색적인 제육덮밥 어떠세요?');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (20,'성게알 해초 덮밥',2,6000,89,54,15,235,643,'대두, 밀',0,'N0051.jpg','N0052.jpg','비닐을 1/2 벗긴 후, 전자레인지(700W기준 : 약 2분 30초, 1000W기준 : 약 3분) 데워드세요.',320,'꼬독꼬독 해초와 부드러운 성게알의 만남!');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (21,'치킨마요 덮밥',2,6000,45,32,13,462,345,'난류(계란, 메추리알), 대두, 밀, 아황산류, 닭고기, 쇠고기',0,'N0061.jpg','N0062.jpg','비닐과 뚜껑을 제거 후 전자레인지에 (700W: 1분 50초, 1000W: 1분 30초) 데운 후 토핑을 밥에 넣어 비벼 드세요.',420,'말해뭐해 말해뭐해~ 당연히 맛있는 조합 아니에요?');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (22,'삼색조화 크래미날치알마요덮밥',2,6000,76,36,16,342,573,'난류(계란, 메추리알), 우유, 밀, 조개류(굴, 전복, 홍합), 대두, 게, 토마토, 아황산류, 쇠고기',0,'N0071.jpg','N0072.jpg','비닐을 1/3 벗겨 전자레인지(700W기준 : 약 3분, 1000W기준 : 약 2분 30초) 데워드세요.',320,'부드러운 크래미와 톡톡 터지는 날치알에 만남!');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (23,'눈꽃 치즈 로제 함박스테이크 덮밥',2,6000,80,34,13,300,464,'난류(계란, 메추리알), 우유, 대두, 밀, 돼지고기, 토마토, 닭고기, 쇠고기, 조개류(굴, 전복, 홍합)',0,'N0081.jpg','N0082.jpg','뚜껑을 제거 후 전자레인지(700W기준 : 약 2분 30초, 1000W기준 : 약 2분) 데워드세요.',436,'펑펑 치즈눈이 쏟아집니다 함박 위로 쏟아집니다♡');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (1,'마제소스&귀리현미밥',1,6000,60,20,8,200,400,'땅콩, 대두, 밀, 돼지고기, 조개류(굴, 전복, 홍합)',0,'C011.jpg','C012.jpg','뚜껑을 제거 후 전자레인지(700W기준 : 약 2분) 데운 후 모든 재료를 밥 위에 얹어 비벼 드세요.',333,'건강한 귀리밥으로 마제소스에 쓱쓱');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (2,'소이치킨구이&귀리현미밥',1,6000,60,21,7,150,340,'대두, 밀, 닭고기',0,'C021.jpg','C022.jpg','뚜껑을 제거 후, 와사비와 덮밥용 간장소스를 꺼낸 후, 전자레인지(700W기준 : 약 2분) 데워드세요.',363,'당 함량을 줄인 소이소스로 건강하게');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (3,'병아리콩 그레인보울 / 치킨 텐더 샐러드(렌치 드레싱)',1,6000,59,18,6,130,320,'난류(계란, 메추리알), 대두, 밀, 토마토, 닭고기',0,'C031.jpg','C032.jpg','드레싱을 넣어 골고루 섞어 드세요. 뚜껑을 닫고 흔들면, 더욱 쉽게 섞을 수 있어요.',200,'슈퍼푸드 병아리콩과 맛있는 텐더의 만남');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (4,'큐브 닭가슴살 샐러드(바질 오리엔탈 드레싱) / 블루베리 베이글 샌드',1,6000,48,20,12,200,385,'우유, 대두, 밀, 아황산류, 닭고기, 조개류(굴, 전복, 홍합)',0,'C041.jpg','C042.jpg','드레싱을 넣어 골고루 섞어 드세요. 뚜껑을 닫고 흔들면, 더욱 쉽게 섞을 수 있어요.',320,'향긋한 바질드레싱으로 산뜻하게');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (5,'아보카도쉬림프 랩',1,6000,45,30,18,30,365,'난류(계란, 메추리알), 우유, 대두, 밀, 새우, 토마토, 쇠고기, 조개류(굴, 전복, 홍합)',0,'C051.jpg','C052.jpg','수령 후, 신선할 때 드세요.',232,'부드러운 아보카도와 탱글한 새우의 만남');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (6,'와사비마요 크래미 샌드위치',1,8000,38,41,34,55,355,'난류(계란, 메추리알), 우유, 대두, 밀, 게, 토마토, 닭고기',0,'C061.jpg','C062.jpg','수령 후, 신선할 때 드세요.',235,'톡쏘는 와사비소스로 맛있는 한 끼');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (7,'치킨브레스트 샐러드밀(시저드레싱) / 아침 고구마 슬라이스',1,8000,45,30,18,30,365,'난류(계란, 메추리알), 우유, 대두, 밀, 닭고기',0,'C071.jpg','C072.jpg','수령 후, 신선할 때 드세요.',256,'닭가슴살로 건강한 한 끼');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (8,'고기듬뿍 렌틸콩 비빔밥',1,8000,60,20,8,200,400,'난류(계란, 메추리알), 우유, 대두, 밀, 돼지고기, 닭고기, 조개류(굴, 전복, 홍합)',0,'C081.jpg','C082.jpg','뚜껑을 제거 후 전자레인지(700W기준 : 약 2분) 데워드세요.',311,'슈퍼푸드 렌틸콩으로 고소한 한 끼');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (9,'계란듬뿍모닝샌드&모짜렐라샐러드(발사믹 비네거 드레싱)',1,8000,60,21,7,150,340,'난류(계란, 메추리알), 우유, 대두, 밀, 토마토',0,'C091.jpg','C092.jpg','가열없이 신선하게 드시기 바랍니다.',322,'단백질은 계란으로 부터');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (10,'허니리코타치즈 랩',1,8000,59,18,6,130,320,'난류(계란, 메추리알), 우유, 대두, 밀, 토마토, 아황산류, 호두, 쇠고기',0,'C101.jpg','C102.jpg','수령 후, 신선할 때 드세요.',242,'산뜻한 치즈로 맛있는 한 끼 되세요');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (11,'바다 내음 톳 명란 덮밥(with 참기름)',1,10000,48,20,12,200,385,'대두, 밀',0,'C111.jpg','C112.jpg','비닐을 1/2 벗긴 후, 전자레인지(700W기준 : 약 2분 30초, 1000W기준 : 약 3분) 데워드세요.',451,'엇 여긴 제주도인가? 향긋한 톳으로 나를 위한 한 끼');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (12,'새우파마산샐러드',1,10000,45,30,18,30,365,'새우',0,'C121.jpg','C122.jpg','수령 후, 신선할 때 드세요.',450,'새우에 고소한 파마산을 넣어 가벼운 한 끼');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (13,'훈제오리샐러드',1,10000,38,41,34,55,355,'오리고기',0,'C131.jpg','C132.jpg','수령 후, 신선할 때 드세요.',432,'샐러드에 훈제오리는 국룰이지 가벼운 한 끼');
Insert into FORME.MENU (MENUID,MENUNAME,MENUTYPE,SUBTYPE,CARBOHYDRATE,PROTEIN,FAT,NATRIUM,CALORIES,ALLERGY,AVGPOINT,THUMBNAIL,MENUIMG,RECIPE,WEIGHT,MCOMMENT) values (14,'불고기샐러드',1,10000,45,30,18,30,365,'돼지고기',0,'C141.jpg','C142.jpg','수령 후, 신선할 때 드세요.',434,'불 맛을 낸 불고기와 샐러드의 만남');
REM INSERTING into FORME.MYME
SET DEFINE OFF;
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (2,'test',24,'서울 강남 역삼',to_date('22/05/18 00:00:00','RR/MM/DD HH24:MI:SS'),5000,to_date('23/04/06 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('94/08/20 00:00:00','RR/MM/DD HH24:MI:SS'),to_date('23/05/24 00:00:00','RR/MM/DD HH24:MI:SS'),1,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (3,'test',24,'서울 강남 역삼',to_date('23/05/31 00:00:00','RR/MM/DD HH24:MI:SS'),5000,to_date('23/04/06 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('94/08/20 00:00:00','RR/MM/DD HH24:MI:SS'),to_date('23/05/24 00:00:00','RR/MM/DD HH24:MI:SS'),1,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (4,'test',24,'서울 강남 역삼',to_date('23/07/21 00:00:00','RR/MM/DD HH24:MI:SS'),5000,to_date('23/04/06 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/07/08 00:00:00','RR/MM/DD HH24:MI:SS'),to_date('23/05/24 00:00:00','RR/MM/DD HH24:MI:SS'),2,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (5,'asd1234',24,'서울 강남 역삼',to_date('24/01/31 00:00:00','RR/MM/DD HH24:MI:SS'),5000,to_date('23/05/06 00:00:00','RR/MM/DD HH24:MI:SS'),8000,to_date('94/08/20 00:00:00','RR/MM/DD HH24:MI:SS'),to_date('23/05/24 00:00:00','RR/MM/DD HH24:MI:SS'),3,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (6,'asd1234',4,'서울 강남 역삼',to_date('23/06/07 00:00:00','RR/MM/DD HH24:MI:SS'),5000,to_date('23/05/06 00:00:00','RR/MM/DD HH24:MI:SS'),8000,to_date('94/08/22 00:00:00','RR/MM/DD HH24:MI:SS'),to_date('23/05/30 00:00:00','RR/MM/DD HH24:MI:SS'),4,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (1,'test',16,'서울 구로구 경인로 577 53 ',to_date('23/06/22 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/19 18:41:59','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/22 00:00:00','RR/MM/DD HH24:MI:SS'),null,2,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (10,'test',17,'서울 구로구 경인로 577 53 ',to_date('23/07/04 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/19 18:44:32','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/27 00:00:00','RR/MM/DD HH24:MI:SS'),null,3,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (11,'test',18,'서울 구로구 경인로 577 53 ',to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/19 18:44:32','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),null,3,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (12,'test',19,'서울 구로구 경인로 577 53 ',to_date('23/06/22 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/19 18:44:32','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/22 00:00:00','RR/MM/DD HH24:MI:SS'),null,3,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (13,'test',17,'서울 구로구 경인로 577 53 ',to_date('23/06/23 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 10:09:12','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/23 00:00:00','RR/MM/DD HH24:MI:SS'),null,4,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (14,'test',18,'서울 구로구 경인로 577 53 ',to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 10:09:12','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),null,4,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (15,'test',19,'서울 구로구 경인로 577 53 ',to_date('23/06/26 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 10:09:13','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/26 00:00:00','RR/MM/DD HH24:MI:SS'),null,4,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (16,'test1111',17,'서울 영등포구 대림동 778-46 대림사거리  ',to_date('23/06/23 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 10:39:37','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/23 00:00:00','RR/MM/DD HH24:MI:SS'),null,5,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (17,'test1111',18,'서울 영등포구 대림동 778-46 대림사거리  ',to_date('23/06/25 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 10:39:37','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/25 00:00:00','RR/MM/DD HH24:MI:SS'),null,5,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (18,'test1111',19,'서울 영등포구 대림동 778-46 대림사거리  ',to_date('23/06/29 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 10:39:37','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/29 00:00:00','RR/MM/DD HH24:MI:SS'),null,5,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (19,'test',16,'서울 구로구 경인로 577 53 ',to_date('23/06/23 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 10:41:42','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/23 00:00:00','RR/MM/DD HH24:MI:SS'),null,6,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (20,'test',17,'서울 구로구 경인로 577 53 ',to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 10:41:42','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),null,6,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (21,'test',18,'서울 구로구 경인로 577 53 ',to_date('23/07/10 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 10:41:42','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/27 00:00:00','RR/MM/DD HH24:MI:SS'),null,6,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (22,'test',16,'서울 구로구 경인로 577 53 ',to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 11:55:18','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),null,7,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (23,'test',17,'서울 구로구 경인로 577 53 ',to_date('23/06/25 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 11:55:18','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/25 00:00:00','RR/MM/DD HH24:MI:SS'),null,7,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (24,'test',18,'서울 구로구 경인로 577 53 ',to_date('23/06/23 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 11:55:18','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/26 00:00:00','RR/MM/DD HH24:MI:SS'),null,7,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (25,'test',17,'서울 구로구 경인로 577 53 ',to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 12:28:59','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),null,8,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (26,'test',18,'서울 구로구 경인로 577 53 ',to_date('23/06/27 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 12:28:59','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/27 00:00:00','RR/MM/DD HH24:MI:SS'),null,8,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (27,'test',19,'서울 구로구 경인로 577 53 ',to_date('23/06/26 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 12:28:59','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/26 00:00:00','RR/MM/DD HH24:MI:SS'),null,8,'배송 완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (28,'admin',2,'경기 성남시 분당구 판교역로 166 123',to_date('23/06/25 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 16:22:09','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/25 00:00:00','RR/MM/DD HH24:MI:SS'),null,9,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (29,'admin',3,'경기 성남시 분당구 판교역로 166 123',to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 16:22:09','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/24 00:00:00','RR/MM/DD HH24:MI:SS'),null,9,'배송 미완료');
Insert into FORME.MYME (MYNUM,ID,MENUID,DELIADDRESS,DELIDATE,SUBPRICE,SUBDATE,SUBTYPE,STARTDATE,ENDDATE,TURN,DELIOK) values (30,'admin',4,'경기 성남시 분당구 판교역로 166 123',to_date('23/06/23 00:00:00','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/20 16:22:09','RR/MM/DD HH24:MI:SS'),6000,to_date('23/06/23 00:00:00','RR/MM/DD HH24:MI:SS'),null,9,'배송 완료');
REM INSERTING into FORME.NOTICE
SET DEFINE OFF;
Insert into FORME.NOTICE (NOTICENUM,ID,NOTICONTENT,NOTIDATE,NOTICETITLE) values (21,'admin','<p>안녕하세요, For 味 입니다.&nbsp;</p><p>😊 6월 7일부터 리뷰 기능이 개선되어 소식 알려드립니다.&nbsp;</p><p>&nbsp;</p><p>이제부터 For味 사이트에서 빠르고 쉽게 리뷰를 작성할 수 있습니다.&nbsp;</p><p>여러분이 남기시는 각각의 리뷰는 For味상품기획팀에서 항상 모니터링하고 있습니다.&nbsp;</p><p>맛, 양, 음식에 대한 개인적인 경험을 공유해 주시면, 다른 고객님들에게도 큰 도움이 됩니다&nbsp;</p><p>🙏 마지막으로, For味가 계속 발전하고 성장할 수 있도록 항상 성심껏 리뷰를 작성해 주시는 모든 고객님들께 다시 한번 감사의 말씀을 드립니다.&nbsp;</p><p>앞으로도 고객님들의 소중한 의견을 기다리겠습니다. 감사합니다.</p>',to_date('23/06/07 00:00:00','RR/MM/DD HH24:MI:SS'),' 리뷰 기능 업데이트 안내');
Insert into FORME.NOTICE (NOTICENUM,ID,NOTICONTENT,NOTIDATE,NOTICETITLE) values (2,'admin','<h4>&nbsp;</h4><h4><strong>안녕하세요 For 味입니다.</strong></h4><p>&nbsp;</p><p>다음 주 월요일은 현충일로 For 味의 서비스와 고객 상담도 모두 휴무입니다. 휴무를 앞두고 서비스 이용 방법을 안내 드리니, 꼭 확인해주세요!😃</p><p>✅ 신청하신 기간 중 휴무일이 포함되어 있다면, 👉 휴무일은 ‘자동 제외’ 되어 신청 및 결제됩니다.</p><ul><li>희망 신청 기간 : 6월 6일(월) ~ 6월 10일(금) (5일)</li><li>❗실제 신청 기간 : 6월 7일(화) ~ 6월 10일(금) (4일)❗</li></ul><p>✅ 희망 구독일에 받기 원하시면, 👉 휴무일을 제외한 영업일 기준 3일 전에 주문해주세요.</p><ul><li>6월 7일(화)부터 구독하실 경우, 6월 1일(수)까지 신청 및 결제가 완료</li></ul><p>✅ 다음 주 일정을 변경해야 한다면, 👉 영업일 기준 3일 전 나의 味 &gt; 나의 식단 보러 가기 에서 변경해주세요.</p><p>✅ 주소 변경을 원하시면, &nbsp;3일 전 23:59까지 홈페이지에서 변경해주세요.</p><p>&nbsp;</p><p>📍 문의: 카카오톡 채널 ‘위잇 고객센터'' 평일 9:00~16:30 사이에 가능합니다.</p>',to_date('23/06/01 00:00:00','RR/MM/DD HH24:MI:SS'),'   6월6일 현충일 휴무안내');
Insert into FORME.NOTICE (NOTICENUM,ID,NOTICONTENT,NOTIDATE,NOTICETITLE) values (22,'admin','<p>안녕하세요For 味 입니다</p><p>다음 주 월요일은 광복절로 For 味의 서비스와 고객 상담도 모두 휴무입니다.&nbsp;</p><p>휴무를 앞두고 서비스 이용 방법을 안내 드리니, 꼭 확인해주세요!</p><ul><li>신청하신 기간 중 휴무일이 포함되어 있다면, 👉 휴무일은 ‘자동 제외’ 되어 신청 및 결제됩니다. 희망 신청 기간 : 8월 15일(월) ~ 8월 19일(금) (5일) ❗실제 신청 기간 : 8월 16일(화) ~ 8월 19일(금) (4일)❗&nbsp;</li><li>희망 구독일에 받기 원하시면, 👉 휴무일을 제외한 영업일 기준 2일 전에 주문해주세요. 8월 16일(화)부터 구독하실 경우, 8월 11일(목)까지 신청 및 결제가 완료&nbsp;</li><li>✅ 다음 주 일정을 변경해야 한다면, 👉 영업일 기준 2일 전 마이페이지 &gt; 구독확인/변경에서 변경해주세요. 8월 16일(화) 일정 변경 및 취소는 8월 11일(목)까지 8월 17일(수) 일정 변경 및 취소는 8월 15일(월)까지&nbsp;</li><li>✅ 주소 변경을 원하시면, 하루 전 16:59까지 홈페이지에서 변경해주세요. 8월 16일 (화) 주소 변경은 8월 15일(월) 16:59 까지&nbsp;</li></ul><p>📍 문의: 카카오톡 채널 ‘For 味'' 평일 9:00~16:30 사이에 가능합니다.</p>',to_date('23/06/09 00:00:00','RR/MM/DD HH24:MI:SS'),' 8월15일 광복절 휴무안내!');
Insert into FORME.NOTICE (NOTICENUM,ID,NOTICONTENT,NOTIDATE,NOTICETITLE) values (83,'admin','<p>고객님들!, 안녕하세요. For味 팀입니다😊</p><p>인류가 낭비한 쓰레기로 인해 우리의 소중한 지구가 몸살을 앓고 있습니다. 전 세계적으로 환경 오염에 대한 문제점이 대두되고 있는데요, 현재 For味에서는 환경 보호와 자원의 순환을 위해 다음과 같은 친환경 정책을 시행하고 있습니다.</p><p>💧 <strong>물을 활용한 친환경 아이스팩 사용</strong></p><p>📦 <strong>재활용이 용이한 골판지 박스 사용</strong></p><p>♻️ <strong>세척 후 분리배출이 가능한 포장 용기 사용</strong></p><h4><strong>그리고,</strong></h4><p>더 나아가 <strong>추후</strong> 구독 신청 시 직접<strong> </strong>일회용품 수령 여부를 선택하실 수 있도록 중비 중 입니다.</p><p>예정) 🌱 <strong>일회용품을 줄이기 위한 ‘일회용품 옵션’ 추가</strong></p><p>✔️ 일회용품 : 수저(숟가락, 젓가락), 포크, 종이컵, 요거트 스푼 등</p><p>&nbsp;<strong>일회용품 줄이기에 많은 관심 부탁드립니다</strong>🙏</p>',to_date('23/06/12 00:00:00','RR/MM/DD HH24:MI:SS'),'친환경 정책 시행 안내');
Insert into FORME.NOTICE (NOTICENUM,ID,NOTICONTENT,NOTIDATE,NOTICETITLE) values (1,'admin','<p>사이트 오픈!!! / 밀키트 구독 사이트 For 味 / 味친 가성비 / 味인들이 즐기는 For味 /</p>',to_date('23/06/01 00:00:00','RR/MM/DD HH24:MI:SS'),'For 味 오픈!!!!');
Insert into FORME.NOTICE (NOTICENUM,ID,NOTICONTENT,NOTIDATE,NOTICETITLE) values (86,'admin','<p>안녕하세요, <strong>For 味</strong>팀입니다. 😊</p><p>이제는 <strong>토요일에도 味 식단을 주문할 수 있다는 기쁜 소식</strong>을 알려드립니다.</p><p>혹시, 평일에 너무 바빠서 다음 주 주문을 깜빡하신 적이 있으신가요?</p><p>하지만 걱정마세요! 이제는 &nbsp;<strong>토요일</strong>에도 주문할 수 있어요. 😍</p><p>평일에 바쁜 고객님들도 이제 걱정 없이 味 식단을 즐겨보세요! ✨</p><h4><strong>🙋구독을 신청하고 싶어요!</strong></h4><p>원하시는 <strong>배송일 3일 전 23:59까지</strong> 신청해 주세요.</p><h4><strong>✏️구독을 변경/취소하고 싶어요!</strong></h4><p><strong>배송일 3일 전 23:59까지</strong> 나의 味 &gt; &nbsp;나의 식단 보러 가기 에서 변경해 주세요.</p><h4><strong>🏠주소를 변경하고 싶어요!</strong></h4><p><strong>배송일 3일 전 23:59까지</strong> 변경해 주세요.</p><p>ex)- 6월 20일(화)부터 구독하실 경우, 6월 17일(토) 23:59까지 신청 및 결제 완료</p><p>&nbsp;</p><p>이제 토요일에도 걱정 없이 위잇을 신청해 보세요!</p><p>For 味 팀 드림!</p><p>&nbsp;</p>',to_date('23/06/15 00:00:00','RR/MM/DD HH24:MI:SS'),'For 味 주문, 이제 토요일에 하세요');
REM INSERTING into FORME.QA
SET DEFINE OFF;
REM INSERTING into FORME.REVIEWS
SET DEFINE OFF;
Insert into FORME.REVIEWS (REVIEWNUM,MYNUM,POINTS,COMMENTS,WRITEDATE) values (62,5,5,'커리 맛집이네요',to_date('23/06/15 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into FORME.REVIEWS (REVIEWNUM,MYNUM,POINTS,COMMENTS,WRITEDATE) values (3,6,4,'새우가 살아있네요',to_date('23/06/05 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into FORME.REVIEWS (REVIEWNUM,MYNUM,POINTS,COMMENTS,WRITEDATE) values (61,2,3,'자주먹어요 진짜',to_date('23/06/15 00:00:00','RR/MM/DD HH24:MI:SS'));
--------------------------------------------------------
--  DDL for Index QNA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FORME"."QNA_PK" ON "FORME"."QA" ("QANUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007260
--------------------------------------------------------

  CREATE UNIQUE INDEX "FORME"."SYS_C007260" ON "FORME"."MEMBERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007265
--------------------------------------------------------

  CREATE UNIQUE INDEX "FORME"."SYS_C007265" ON "FORME"."MENU" ("MENUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007272
--------------------------------------------------------

  CREATE UNIQUE INDEX "FORME"."SYS_C007272" ON "FORME"."MYME" ("MYNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007260
--------------------------------------------------------

  CREATE UNIQUE INDEX "FORME"."SYS_C007260" ON "FORME"."MEMBERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007265
--------------------------------------------------------

  CREATE UNIQUE INDEX "FORME"."SYS_C007265" ON "FORME"."MENU" ("MENUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007272
--------------------------------------------------------

  CREATE UNIQUE INDEX "FORME"."SYS_C007272" ON "FORME"."MYME" ("MYNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index QNA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FORME"."QNA_PK" ON "FORME"."QA" ("QANUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table MEMBERS
--------------------------------------------------------

  ALTER TABLE "FORME"."MEMBERS" MODIFY ("TURN" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MEMBERS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FORME"."MEMBERS" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MEMBERS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MEMBERS" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MEMBERS" MODIFY ("HP" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MEMBERS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MEMBERS" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MEMBERS" MODIFY ("BIRTH" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MEMBERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MEMBERS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MENU
--------------------------------------------------------

  ALTER TABLE "FORME"."MENU" ADD PRIMARY KEY ("MENUID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FORME"."MENU" MODIFY ("SUBTYPE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MENU" MODIFY ("MENUTYPE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MENU" MODIFY ("MENUNAME" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MENU" MODIFY ("MENUID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MYME
--------------------------------------------------------

  ALTER TABLE "FORME"."MYME" MODIFY ("DELIOK" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MYME" ADD PRIMARY KEY ("MYNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FORME"."MYME" MODIFY ("SUBTYPE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MYME" MODIFY ("SUBDATE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MYME" MODIFY ("SUBPRICE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MYME" MODIFY ("DELIDATE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MYME" MODIFY ("DELIADDRESS" NOT NULL ENABLE);
  ALTER TABLE "FORME"."MYME" MODIFY ("MYNUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "FORME"."NOTICE" MODIFY ("NOTICETITLE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."NOTICE" MODIFY ("NOTIDATE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."NOTICE" MODIFY ("NOTICONTENT" NOT NULL ENABLE);
  ALTER TABLE "FORME"."NOTICE" MODIFY ("NOTICENUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QA
--------------------------------------------------------

  ALTER TABLE "FORME"."QA" ADD CONSTRAINT "QNA_PK" PRIMARY KEY ("QANUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FORME"."QA" MODIFY ("QACONTENT" NOT NULL ENABLE);
  ALTER TABLE "FORME"."QA" MODIFY ("QADATE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."QA" MODIFY ("QATITLE" NOT NULL ENABLE);
  ALTER TABLE "FORME"."QA" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "FORME"."QA" MODIFY ("QANUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEWS
--------------------------------------------------------

  ALTER TABLE "FORME"."REVIEWS" MODIFY ("COMMENTS" NOT NULL ENABLE);
  ALTER TABLE "FORME"."REVIEWS" MODIFY ("MYNUM" NOT NULL ENABLE);
  ALTER TABLE "FORME"."REVIEWS" MODIFY ("REVIEWNUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table MYME
--------------------------------------------------------

  ALTER TABLE "FORME"."MYME" ADD CONSTRAINT "FK_ID" FOREIGN KEY ("ID")
	  REFERENCES "FORME"."MEMBERS" ("ID") ENABLE;
  ALTER TABLE "FORME"."MYME" ADD CONSTRAINT "FK_MENUID" FOREIGN KEY ("MENUID")
	  REFERENCES "FORME"."MENU" ("MENUID") DISABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "FORME"."NOTICE" ADD CONSTRAINT "FK_MID" FOREIGN KEY ("ID")
	  REFERENCES "FORME"."MEMBERS" ("ID") ENABLE;
