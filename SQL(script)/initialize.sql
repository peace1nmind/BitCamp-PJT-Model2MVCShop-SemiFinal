
DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;


CREATE SEQUENCE seq_product_prod_no	 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no	INCREMENT BY 1 START WITH 10000;


CREATE TABLE users ( 
	user_id 			VARCHAR2(20)		NOT NULL,
	user_name 	VARCHAR2(50)		NOT NULL,
	password 		VARCHAR2(10)		NOT NULL,
	role 				VARCHAR2(5) 		DEFAULT 'user',
	ssn 					VARCHAR2(13),
	cell_phone	VARCHAR2(14),
	addr 				VARCHAR2(100),
	email 				VARCHAR2(50),
	reg_date 		DATE		DEFAULT SYSDATE,
	PRIMARY KEY(user_id)
);


CREATE TABLE product ( 
	prod_no 					NUMBER 				NOT NULL,
	prod_name 				VARCHAR2(100) 	NOT NULL,
	prod_detail 				VARCHAR2(200),
	manufacture_day DATE,
	price 							NUMBER(10),
	image_file 					VARCHAR2(100),
	reg_date 					DATE,
	pro_tran_code		CHAR(3)		DEFAULT '1', 
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	tran_no 						NUMBER 			NOT NULL,
	prod_no 					NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 					VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option		CHAR(3),
	receiver_name 		VARCHAR2(20),
	receiver_phone		VARCHAR2(14),
	dlvy_addr 				VARCHAR2(100),
	dlvy_request 			VARCHAR2(100),
	tran_status_code	CHAR(3)		DEFAULT '2',
	order_date 				DATE	DEFAULT SYSDATE,
	dlvy_date 				DATE,
	PRIMARY KEY(tran_no)
);


INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '서울시 서초구', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user20', 'SCOTT', '2020', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user21', 'SCOTT', '2121', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user22', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user23', 'SCOTT', '2323', 'user', NULL, NULL, NULL, NULL, sysdate);
           
           
insert into product values (seq_product_prod_no.nextval,'vaio vgn FS70B','소니 바이오 노트북 신동품','20120514',2000000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), '1');
insert into product values (seq_product_prod_no.nextval,'자전거','자전거 좋아요~','20120514',10000, 'AHlbAAAAvetFNwAA.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'), '1');
insert into product values (seq_product_prod_no.nextval,'보르도','최고 디자인 신품','20120201',1170000, 'AHlbAAAAvewfegAB.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'), '1');
insert into product values (seq_product_prod_no.nextval,'보드세트','한시즌 밖에 안썼습니다. 눈물을 머금고 내놓음 ㅠ.ㅠ','20120217', 200000, 'AHlbAAAAve1WwgAC.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'), '1');
insert into product values (seq_product_prod_no.nextval,'인라인','좋아욥','20120819', 20000, 'AHlbAAAAve37LwAD.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'), '1');
insert into product values (seq_product_prod_no.nextval,'삼성센스 2G','sens 메모리 2Giga','20121121',800000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'), '1');
insert into product values (seq_product_prod_no.nextval,'연꽃','정원을 가꿔보세요','20121022',232300, 'AHlbAAAAtDPSiQAA.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'), '1');


commit;

INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 1', 'Detail 1', '20230101', 1000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 2', 'Detail 2', '20230102', 2000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 3', 'Detail 3', '20230103', 3000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 4', 'Detail 4', '20230104', 4000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 5', 'Detail 5', '20230105', 5000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 6', 'Detail 6', '20230106', 6000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 7', 'Detail 7', '20230107', 7000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 8', 'Detail 8', '20230108', 8000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 9', 'Detail 9', '20230109', 9000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 10', 'Detail 10', '20230110', 10000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 11', 'Detail 11', '20230111', 11000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 12', 'Detail 12', '20230112', 12000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 13', 'Detail 13', '20230113', 13000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 14', 'Detail 14', '20230114', 14000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 15', 'Detail 15', '20230115', 15000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 16', 'Detail 16', '20230116', 16000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 17', 'Detail 17', '20230117', 17000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 18', 'Detail 18', '20230118', 18000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 19', 'Detail 19', '20230119', 19000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 20', 'Detail 20', '20230120', 20000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 21', 'Detail 21', '20230121', 21000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 22', 'Detail 22', '20230122', 22000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 23', 'Detail 23', '20230123', 23000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 24', 'Detail 24', '20230124', 24000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 25', 'Detail 25', '20230125', 25000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 26', 'Detail 26', '20230126', 26000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 27', 'Detail 27', '20230127', 27000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 28', 'Detail 28', '20230128', 28000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 29', 'Detail 29', '20230129', 29000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 30', 'Detail 30', '20230130', 30000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 31', 'Detail 31', '20230131', 31000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 32', 'Detail 32', '20230132', 32000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 33', 'Detail 33', '20230133', 33000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 34', 'Detail 34', '20230134', 34000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 35', 'Detail 35', '20230135', 35000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 36', 'Detail 36', '20230136', 36000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 37', 'Detail 37', '20230137', 37000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 38', 'Detail 38', '20230138', 38000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 39', 'Detail 39', '20230139', 39000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 40', 'Detail 40', '20230140', 40000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 41', 'Detail 41', '20230141', 41000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 42', 'Detail 42', '20230142', 42000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 43', 'Detail 43', '20230143', 43000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 44', 'Detail 44', '20230144', 44000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 45', 'Detail 45', '20230145', 45000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 46', 'Detail 46', '20230146', 46000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 47', 'Detail 47', '20230147', 47000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 48', 'Detail 48', '20230148', 48000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 49', 'Detail 49', '20230149', 49000, 'test.png', SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)), '1');
INSERT INTO product (prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date, pro_tran_code) 
VALUES (seq_product_prod_no.nextval, 'Product 50', 'Detail 50', '20230150', 50000, 'test.png', SYSDATE - TR


COMMIT;
