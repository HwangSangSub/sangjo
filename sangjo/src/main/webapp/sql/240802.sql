------------------------- 관리자 로그인 후 사용자 생성하기.
create user sangjo identified by sangjo; -- 유저 생성 아이디 : sangjo 비밀번호 : sangjo
grant connect, resource to sangjo;
alter user sangjo default tablespace users quota unlimited on users;

------------------------------ 생성된 테이블 삭제
DROP TABLE tbl_member PURGE;
DROP TABLE tbl_address PURGE;
DROP TABLE tbl_order PURGE;
DROP TABLE tbl_order_detail PURGE;
DROP TABLE tbl_category PURGE;
DROP TABLE tbl_product PURGE;
DROP TABLE tbl_product_option PURGE;
DROP TABLE tbl_inquiry PURGE;
DROP TABLE tbl_board PURGE;
DROP TABLE tbl_cart PURGE;

------------------------------ 생성된 시퀀스 삭제
DROP SEQUENCE order_seq;
DROP SEQUENCE od_seq;
DROP SEQUENCE address_seq;
DROP SEQUENCE product_seq;
DROP SEQUENCE po_seq;
DROP SEQUENCE category_seq;
DROP SEQUENCE board_seq;
DROP SEQUENCE inquiry_seq;
DROP SEQUENCE cart_seq;

------------------------- 테이블 생성 쿼리
------------------------- 테이블 생성(tbl_member)
CREATE TABLE tbl_member (
	member_id	VARCHAR2(20)		NOT NULL,
	member_pw	VARCHAR2(100)		NOT NULL,
	member_name	VARCHAR2(20)		NOT NULL,
	member_phone	VARCHAR2(20)		NOT NULL,
	member_email	VARCHAR2(30)		NOT NULL,
	member_rank	VARCHAR2(10)	DEFAULT 'User'	NOT NULL,
	reg_date	DATE	DEFAULT sysdate	NOT NULL,
	login_date	DATE		NULL,
	mod_date	DATE		NULL
);

COMMENT ON COLUMN tbl_member.member_id IS '회원 아이디';

COMMENT ON COLUMN tbl_member.member_pw IS '회원 비밀번호';

COMMENT ON COLUMN tbl_member.member_name IS '회원 이름';

COMMENT ON COLUMN tbl_member.member_phone IS '회원 전화번호';

COMMENT ON COLUMN tbl_member.member_email IS '회원 이메일';

COMMENT ON COLUMN tbl_member.member_rank IS '회원 등급  -> 관리자 : Admin, 회원 :  User, 블랙리스트 :  Blacklist';

COMMENT ON COLUMN tbl_member.reg_date IS '회원등록일';

COMMENT ON COLUMN tbl_member.login_date IS '마지막로그인일';

COMMENT ON COLUMN tbl_member.mod_date IS '마지막수정일';

------------------------- 테이블 생성(tbl_address)
CREATE TABLE tbl_address (
	address_no	NUMBER		NOT NULL,
	member_id	VARCHAR2(20)		NOT NULL,
	address_code	NUMBER		NOT NULL,
	address_main	VARCHAR2(100)		NOT NULL,
	address_detail	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN tbl_address.address_no IS '주소번호';

COMMENT ON COLUMN tbl_address.member_id IS '회원 아이디';

COMMENT ON COLUMN tbl_address.address_code IS '우편번호';

COMMENT ON COLUMN tbl_address.address_main IS '주소';

COMMENT ON COLUMN tbl_address.address_detail IS '상세주소';

------------------------- 테이블 생성(tbl_order)
CREATE TABLE tbl_order (
	order_no	NUMBER		NOT NULL,
	order_price	NUMBER	DEFAULT 0	NOT NULL,
	delivery_price	NUMBER	DEFAULT 0	NULL,
	order_status	CHAR	DEFAULT 1	NOT NULL,
	address_no	NUMBER		NOT NULL,
	member_id	VARCHAR2(20)		NOT NULL,
	order_date	DATE	DEFAULT sysdate	NOT NULL,
	delivery_date	DATE		NULL,
	cancle_date	DATE		NULL
);

COMMENT ON COLUMN tbl_order.order_no IS '주문번호';

COMMENT ON COLUMN tbl_order.order_price IS '주문금액';

COMMENT ON COLUMN tbl_order.delivery_price IS '배송비';

COMMENT ON COLUMN tbl_order.order_status IS '주문상태 1: 결제완료(배송전), 2배송시작, 3.배송완료,4 :주문취소';

COMMENT ON COLUMN tbl_order.address_no IS '배송지주소번호';

COMMENT ON COLUMN tbl_order.member_id IS '주문자';

COMMENT ON COLUMN tbl_order.order_date IS '주문일시';

COMMENT ON COLUMN tbl_order.delivery_date IS '배송일시';

COMMENT ON COLUMN tbl_order.cancle_date IS '취소일시';

------------------------- 테이블 생성(tbl_order_detail)
CREATE TABLE tbl_order_detail (
	od_no	NUMBER		NOT NULL,
	order_no	NUMBER		NOT NULL,
	product_no	NUMBER		NOT NULL,
	od_price	NUMBER		NULL,
	od_cnt	NUMBER		NULL
);

COMMENT ON COLUMN tbl_order_detail.od_no IS '주문상세번호';

COMMENT ON COLUMN tbl_order_detail.order_no IS '주문번호';

COMMENT ON COLUMN tbl_order_detail.product_no IS '상품번호';

COMMENT ON COLUMN tbl_order_detail.od_price IS '주문상세가격';

COMMENT ON COLUMN tbl_order_detail.od_cnt IS '주문수량';

------------------------- 테이블 생성(tbl_category)
CREATE TABLE tbl_category (
	category_no	NUMBER		NOT NULL,
	category	NUMBER		NULL,
	category_detail	NUMBER		NULL,
	category_name	VARCHAR2(20)		NULL,
	cd_name	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN tbl_category.category_no IS '상품카테고리번호';

COMMENT ON COLUMN tbl_category.category IS '카테고리번호';

COMMENT ON COLUMN tbl_category.category_detail IS '세부카테고리번호';

COMMENT ON COLUMN tbl_category.category_name IS '카테고리명';

COMMENT ON COLUMN tbl_category.cd_name IS '세부카테고리명';

------------------------- 테이블 생성(tbl_product)
CREATE TABLE tbl_product (
	product_no	NUMBER		NOT NULL,
	category_no	NUMBER		NOT NULL,
	product_name	VARCHAR2(20)		NULL,
	product_price	VARCHAR2(20)		NULL,
	product_img	VARCHAR2(50)		NULL,
	product_thumbnail_img	VARCHAR2(50)		NULL,
	product_content	VARCHAR2(1000)		NULL,
	reg_date	DATE	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN tbl_product.product_no IS '상품번호';

COMMENT ON COLUMN tbl_product.category_no IS '상품카테고리번호';

COMMENT ON COLUMN tbl_product.product_name IS '상품명';

COMMENT ON COLUMN tbl_product.product_price IS '상품가격';

COMMENT ON COLUMN tbl_product.product_img IS '상품이미지';

COMMENT ON COLUMN tbl_product.product_thumbnail_img IS '상품이미지(썸네일)';

COMMENT ON COLUMN tbl_product.product_content IS '상품내용';

COMMENT ON COLUMN tbl_product.reg_date IS '상품등록일';

------------------------- 테이블 생성(tbl_product_option)
CREATE TABLE tbl_product_option (
	po_no	NUMBER		NOT NULL,
	product_no	NUMBER		NOT NULL,
	po_name	VARCHAR2(20)		NULL,
	po_value	VARCHAR2(500)		NULL
);

COMMENT ON COLUMN tbl_product_option.po_no IS '상품옵션번호';

COMMENT ON COLUMN tbl_product_option.product_no IS '상품번호';

COMMENT ON COLUMN tbl_product_option.po_name IS '상품옵션명';

COMMENT ON COLUMN tbl_product_option.po_value IS '상품옵션값(,구분)';

------------------------- 테이블 생성(tbl_inquiry)
CREATE TABLE tbl_inquiry (
	inquiry_no	NUMBER		NOT NULL,
	inquiry_inquirer	VARCHAR2(20)		NOT NULL,
	inquiry_type	VARCHAR2(20)	DEFAULT 1	NOT NULL,
	inquiry_title	VARCHAR2(100)		NOT NULL,
	inquiry_content	VARCHAR2(1000)		NOT NULL,
	inquiry_responser	VARCHAR2(20)		NULL,
	inquiry_answer	VARCHAR2(1000)		NULL,
	ref_no	NUMBER		NULL,
	inquiry_date	DATE	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN tbl_inquiry.inquiry_no IS '문의번호';

COMMENT ON COLUMN tbl_inquiry.inquiry_inquirer IS '문의자';

COMMENT ON COLUMN tbl_inquiry.inquiry_type IS '문의 타입->1. 일반 2. 상품 3. 주문';

COMMENT ON COLUMN tbl_inquiry.inquiry_title IS '문의 제목';

COMMENT ON COLUMN tbl_inquiry.inquiry_content IS '문의 내용';

COMMENT ON COLUMN tbl_inquiry.inquiry_responser IS '답변자';

COMMENT ON COLUMN tbl_inquiry.inquiry_answer IS '문의답변';

COMMENT ON COLUMN tbl_inquiry.ref_no IS '참조 번호->상품일경우 상품번호, 주문일 경우 주문번호';

COMMENT ON COLUMN tbl_inquiry.inquiry_date IS '문의날짜';

------------------------- 테이블 생성(tbl_board)
CREATE TABLE tbl_board (
	board_no	NUMBER		NOT NULL,
	board_title	VARCHAR2(100)		NULL,
	board_content	VARCHAR2(1000)		NULL,
	board_type	CHAR	DEFAULT 1	NOT NULL,
	member_id	VARCHAR2(20)		NOT NULL,
	reg_date	DATE	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN tbl_board.board_no IS '게시판 번호';

COMMENT ON COLUMN tbl_board.board_title IS '제목';

COMMENT ON COLUMN tbl_board.board_content IS '내용';

COMMENT ON COLUMN tbl_board.board_type IS '1 : 일반, 2:공지,3:자주묻는질문';

COMMENT ON COLUMN tbl_board.member_id IS '작성자';

COMMENT ON COLUMN tbl_board.reg_date IS '등록일';

------------------------- 테이블 생성(tbl_cart)
CREATE TABLE tbl_cart (
	cart_no	NUMBER		NOT NULL,
	product_no	NUMBER		NOT NULL,
	member_id	VARCHAR2(20)		NOT NULL,
	reg_date	DATE	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN tbl_cart.cart_no IS '장바구니 번호';

COMMENT ON COLUMN tbl_cart.product_no IS '상품번호';

COMMENT ON COLUMN tbl_cart.member_id IS '회원 아이디';

COMMENT ON COLUMN tbl_cart.reg_date IS '장바구니등록일';

------------------------- 테이블 pk 등록
ALTER TABLE tbl_member ADD CONSTRAINT PK_TBL_MEMBER PRIMARY KEY (
	member_id
);
ALTER TABLE tbl_address ADD CONSTRAINT PK_TBL_ADDRESS PRIMARY KEY (
	address_no
);
ALTER TABLE tbl_order ADD CONSTRAINT PK_TBL_ORDER PRIMARY KEY (
	order_no
);
ALTER TABLE tbl_order_detail ADD CONSTRAINT PK_TBL_ORDER_DETAIL PRIMARY KEY (
	od_no
);
ALTER TABLE tbl_product ADD CONSTRAINT PK_TBL_PRODUCT PRIMARY KEY (
	product_no
);
ALTER TABLE tbl_product_option ADD CONSTRAINT PK_TBL_PRODUCT_OPTION PRIMARY KEY (
	po_no
);
ALTER TABLE tbl_category ADD CONSTRAINT PK_TBL_CATEGORY PRIMARY KEY (
	category_no
);
ALTER TABLE tbl_inquiry ADD CONSTRAINT PK_TBL_INQUIRY PRIMARY KEY (
	inquiry_no
);
ALTER TABLE tbl_board ADD CONSTRAINT PK_TBL_BOARD PRIMARY KEY (
	board_no
);
ALTER TABLE tbl_cart ADD CONSTRAINT PK_TBL_CART PRIMARY KEY (
	cart_no
);

------------------------------ 시퀀스 생성
CREATE SEQUENCE order_seq;
CREATE SEQUENCE od_seq;
CREATE SEQUENCE address_seq;
CREATE SEQUENCE product_seq;
CREATE SEQUENCE po_seq;
CREATE SEQUENCE category_seq;
CREATE SEQUENCE board_seq;
CREATE SEQUENCE inquiry_seq;
CREATE SEQUENCE cart_seq;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
------------------------------ 샘플데이터 넣기(tbl_member)
-- 비밀번호는 1111로 통일하였다.
INSERT INTO tbl_member (member_id, member_pw, member_name, member_phone, member_email)
VALUES('admin', '$2a$10$I4eM/h.cd4C1QXWm2XVjPurdOmKE50EvNJtaGXfQkfB.h6EMrFMOC', '상주', '010-1111-1111', 'admin@sangjo.com');
INSERT INTO tbl_member (member_id, member_pw, member_name, member_phone, member_email)
VALUES('user01', '$2a$10$I4eM/h.cd4C1QXWm2XVjPurdOmKE50EvNJtaGXfQkfB.h6EMrFMOC', '김꽃님', '010-1111-1111', 'user01@sangjo.com');
INSERT INTO tbl_member (member_id, member_pw, member_name, member_phone, member_email)
VALUES('user02', '$2a$10$I4eM/h.cd4C1QXWm2XVjPurdOmKE50EvNJtaGXfQkfB.h6EMrFMOC', '김햇님', '010-1111-1111', 'user02@sangjo.com');
INSERT INTO tbl_member (member_id, member_pw, member_name, member_phone, member_email)
VALUES('user03', '$2a$10$I4eM/h.cd4C1QXWm2XVjPurdOmKE50EvNJtaGXfQkfB.h6EMrFMOC', '김달님', '010-1111-1111', 'user03@sangjo.com');

SELECT *
FROM tbl_member;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_category)
INSERT INTO tbl_category(category_no, category, category_detail, category_name, cd_name)
VALUES (category_seq.NEXTVAL, 1, 1, '홈인테리어', '주방');
INSERT INTO tbl_category(category_no, category, category_detail, category_name, cd_name)
VALUES (category_seq.NEXTVAL, 1, 2, '홈인테리어', '욕실');
INSERT INTO tbl_category(category_no, category, category_detail, category_name, cd_name)
VALUES (category_seq.NEXTVAL, 1, 3, '홈인테리어', '거실');
INSERT INTO tbl_category(category_no, category, category_detail, category_name, cd_name)
VALUES (category_seq.NEXTVAL, 2, 1, '유아용품', '아동잡화');
INSERT INTO tbl_category(category_no, category, category_detail, category_name, cd_name)
VALUES (category_seq.NEXTVAL, 2, 2, '유아용품', '아동의류');

SELECT *
FROM tbl_category;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_product)
INSERT INTO tbl_product(product_no, category_no, product_name, product_price, product_content)
VALUES (product_seq.NEXTVAL, '1', '국자', 10000, '겁나좋은 국자입니다. 너무 좋으니 제발 사주세요. 옆집 아줌마도 윗집 아저씨도 아랫집 학생도 좋아합니다 제발 사주세요');
INSERT INTO tbl_product(product_no, category_no, product_name, product_price, product_content)
VALUES (product_seq.NEXTVAL, '2', '욕실화', 4000, '비눗물 위에서도 미끄러지지 않습니다. 만수가 적극 추천하는 욕실화 일본인 우상상도 좋아하는 색감, 사시죠.');
INSERT INTO tbl_product(product_no, category_no, product_name, product_price, product_content)
VALUES (product_seq.NEXTVAL, '3', '쇼파', 170000000, '수성구에 살고 있는 정모씨 적극추천하는 쇼파입니다.');
INSERT INTO tbl_product(product_no, category_no, product_name, product_price, product_content)
VALUES (product_seq.NEXTVAL, '4', '만수르돼지', 10000000, '만수가 사용하는 만수르돼지입니다. 돈이 저절로 들어와요. 사기만 하면 돈이 늘어나는 신비한 물건입니다.');
INSERT INTO tbl_product(product_no, category_no, product_name, product_price, product_content)
VALUES (product_seq.NEXTVAL, '5', '아동기모노', 10000, '귀멸의 칼날을 좋아하는 아이들의 벽력일섬을 위한 필수아이템 아동기모노 팝니다.');

SELECT *
FROM tbl_product;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_address)

ALTER TABLE tbl_address ADD is_default NUMBER DEFAULT 0 NOT NULL ;

INSERT INTO tbl_address(address_no, member_id, address_code, address_main, address_detail, is_default)
VALUES(address_seq.NEXTVAL, 'user01', 41935, '대구 중구 중앙대로 403', '5층', 1);
INSERT INTO tbl_address(address_no, member_id, address_code, address_main, address_detail)
VALUES(address_seq.NEXTVAL, 'user01', 41935, '대구 중구 중앙대로 412-4', '1층');
INSERT INTO tbl_address(address_no, member_id, address_code, address_main, address_detail, is_default)
VALUES(address_seq.NEXTVAL, 'user02', 41935, '대구 중구 중앙대로 403', '5층', 1);
INSERT INTO tbl_address(address_no, member_id, address_code, address_main, address_detail)
VALUES(address_seq.NEXTVAL, 'user02', 41935, '대구 중구 중앙대로 412-4', '1층');
INSERT INTO tbl_address(address_no, member_id, address_code, address_main, address_detail, is_default)
VALUES(address_seq.NEXTVAL, 'user03', 41935, '대구 중구 중앙대로 403', '5층', 1);
INSERT INTO tbl_address(address_no, member_id, address_code, address_main, address_detail)
VALUES(address_seq.NEXTVAL, 'user03', 41935, '대구 중구 중앙대로 412-4', '1층');


SELECT *
FROM tbl_address;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_product_option)
INSERT INTO tbl_product_option(po_no, product_no, po_name, po_value)
VALUES(po_seq.NEXTVAL, 2, '색상', '빨강,노랑,파랑,뭐고');
INSERT INTO tbl_product_option(po_no, product_no, po_name, po_value)
VALUES(po_seq.NEXTVAL, 2, '사이즈', '220,225,230,235,240,245,250,255,260');
INSERT INTO tbl_product_option(po_no, product_no, po_name, po_value)
VALUES(po_seq.NEXTVAL, 4, '순도', '14K,18K,24K');
INSERT INTO tbl_product_option(po_no, product_no, po_name, po_value)
VALUES(po_seq.NEXTVAL, 4, '종류', '금,백금,은');
INSERT INTO tbl_product_option(po_no, product_no, po_name, po_value)
VALUES(po_seq.NEXTVAL, 5, '사이즈', 'S, M, L, XL');

SELECT *
FROM tbl_product_option;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_inquiry)
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer)
VALUES(inquiry_seq.NEXTVAL, 1, '일반문의 제목입니다', '일반문의 내용입니다', 'user01');
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer, ref_no)
VALUES(inquiry_seq.NEXTVAL, 2, '상품문의 제목입니다', '상품문의 내용입니다', 'user02', 1);
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer, ref_no)
VALUES(inquiry_seq.NEXTVAL, 3, '주문문의 제목입니다', '주문문의 내용입니다', 'user03', 1);

SELECT *
FROM tbl_inquiry;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_order)
INSERT INTO tbl_order(order_no, order_price, address_no, member_id)
VALUES(order_seq.NEXTVAL, 170010000, 1, 'user01');
INSERT INTO tbl_order(order_no, order_price, address_no, member_id)
VALUES(order_seq.NEXTVAL, 10010000, 3, 'user02');
INSERT INTO tbl_order(order_no, order_price, address_no, member_id)
VALUES(order_seq.NEXTVAL, 10000, 5, 'user03');

SELECT *
FROM tbl_order;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_order_detail)
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 1, 3, 170000000, 1);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 1, 1, 10000, 1);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 2, 4, 10000000, 1);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 2, 5, 10000, 1);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 3, 1, 10000, 1);


SELECT *
FROM tbl_order_detail;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_board)
INSERT INTO tbl_board(board_no, board_title, board_content, board_type, member_id)
VALUES(board_seq.NEXTVAL, '게시글제목입니다', '게시글내용입니다', 1, 'user01');
INSERT INTO tbl_board(board_no, board_title, board_content, board_type, member_id)
VALUES(board_seq.NEXTVAL, '게시글제목입니다2', '게시글내용입니다2', 1, 'user02');
INSERT INTO tbl_board(board_no, board_title, board_content, board_type, member_id)
VALUES(board_seq.NEXTVAL, '게시글제목입니다3', '게시글내용입니다3', 2, 'user02');
INSERT INTO tbl_board(board_no, board_title, board_content, board_type, member_id)
VALUES(board_seq.NEXTVAL, '게시글제목입니다4', '게시글내용입니다4', 3, 'user03');


SELECT *
FROM tbl_board;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_cart)
INSERT INTO tbl_cart(cart_no, product_no, member_id)
VALUES(cart_seq.NEXTVAL, 1, 'user01');
INSERT INTO tbl_cart(cart_no, product_no, member_id)
VALUES(cart_seq.NEXTVAL, 2, 'user01');
INSERT INTO tbl_cart(cart_no, product_no, member_id)
VALUES(cart_seq.NEXTVAL, 3, 'user01');
INSERT INTO tbl_cart(cart_no, product_no, member_id)
VALUES(cart_seq.NEXTVAL, 1, 'user02');
INSERT INTO tbl_cart(cart_no, product_no, member_id)
VALUES(cart_seq.NEXTVAL, 4, 'user02');
INSERT INTO tbl_cart(cart_no, product_no, member_id)
VALUES(cart_seq.NEXTVAL, 4, 'user03');
INSERT INTO tbl_cart(cart_no, product_no, member_id)
VALUES(cart_seq.NEXTVAL, 5, 'user03');

SELECT *
FROM tbl_cart;

COMMIT;