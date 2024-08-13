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
DROP TABLE tbl_review PURGE;

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
DROP SEQUENCE review_seq;

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
	mod_date	DATE		NULL,
	verification_code VARCHAR2(10)
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

COMMENT ON COLUMN tbl_member.verification_code IS '이메일 인증코드';

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
	product_name	VARCHAR2(2000)		NULL,
	product_price	VARCHAR2(20)		NULL,
	product_img	VARCHAR2(2000)		NULL,
	product_thumbnail_img	VARCHAR2(2000)		NULL,
	product_content	VARCHAR2(2000)		NULL,
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

------------------------- 테이블 생성(tbl_review)
CREATE TABLE tbl_review (
	review_no	NUMBER		NOT NULL,
	product_no 	NUMBER		NOT NULL,
	member_id	VARCHAR2(20)		NOT NULL,
	review_content	VARCHAR2(1000)		NOT NULL,
    review_point	NUMBER		NOT NULL,
	reg_date	 DATE	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN tbl_review.review_no IS '리뷰번호';

COMMENT ON COLUMN tbl_review.product_no IS '상품번호';

COMMENT ON COLUMN tbl_review.member_id IS '회원 아이디';

COMMENT ON COLUMN tbl_review.review_content IS '리뷰내용';

COMMENT ON COLUMN tbl_review.reg_date IS '등록일';

COMMENT ON COLUMN tbl_review.review_point IS '리뷰점수>1~5점';

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

ALTER TABLE tbl_review ADD CONSTRAINT PK_TBL_REVIEW PRIMARY KEY (
	review_no
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
CREATE SEQUENCE review_seq;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
------------------------------ 샘플데이터 넣기(tbl_member)
-- 비밀번호는 1111로 통일하였다.
INSERT INTO tbl_member (member_id, member_pw, member_name, member_phone, member_email)
VALUES('admin', '1111', '상주', '010-1111-1111', 'admin@sangjo.com');
INSERT INTO tbl_member (member_id, member_pw, member_name, member_phone, member_email)
VALUES('user01', '1111', '김꽃님', '010-1111-1111', 'user01@sangjo.com');
INSERT INTO tbl_member (member_id, member_pw, member_name, member_phone, member_email)
VALUES('user02', '1111', '김햇님', '010-1111-1111', 'user02@sangjo.com');
INSERT INTO tbl_member (member_id, member_pw, member_name, member_phone, member_email)
VALUES('user03', '1111', '김달님', '010-1111-1111', 'user03@sangjo.com');

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
--주방용품추가
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','멀티 사이즈 실리콘 매트, 대형 비닐 테이블 플레이스 매트, 내열성 미끄럼 방지 피크닉 다이닝 접시 매트, 조리대 보호대 ESD 패드',24729,'멀티 사이즈 실리콘 매트, 대형 비닐 테이블 플레이스 매트, 내열성 미끄럼 방지 피크닉 다이닝 접시 매트, 조리대 보호대 ESD 패드.jpg','멀티 사이즈 실리콘 매트, 대형 비닐 테이블 플레이스 매트, 내열성 미끄럼 방지 피크닉 다이닝 접시 매트, 조리대 보호대 ESD 패드.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','테이블용 접시 컵 건조 코스터 플레이스매트, 주방 식기 배수 패드, 흡수성 인쇄 배수 매트, 테이블 커피 테이블 장식',2723,'테이블용 접시 컵 건조 코스터 플레이스매트, 주방 식기 배수 패드, 흡수성 인쇄 배수 매트, 테이블 커피 테이블 장식.jpg','테이블용 접시 컵 건조 코스터 플레이스매트, 주방 식기 배수 패드, 흡수성 인쇄 배수 매트, 테이블 커피 테이블 장식.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','플레이스매트 미끄럼 방지 책상 매트, 다이닝 데코레이션, 이벤트 파티, 웨딩, 홀리데이, 캠핑, 컨퍼런스 테이블',2836,'플레이스매트 미끄럼 방지 책상 매트, 다이닝 데코레이션, 이벤트 파티, 웨딩, 홀리데이, 캠핑, 컨퍼런스 테이블.jpg','플레이스매트 미끄럼 방지 책상 매트, 다이닝 데코레이션, 이벤트 파티, 웨딩, 홀리데이, 캠핑, 컨퍼런스 테이블.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','크리스마스 트리 실리콘 매트 접시 절연 패드, 나무 모양 삼발이 세트 코스터, 티팟 핫 팟, 할로윈 플레이스매트 테이블',5500,'크리스마스 트리 실리콘 매트 접시 절연 패드, 나무 모양 삼발이 세트 코스터, 티팟 핫 팟, 할로윈 플레이스매트 테이블.jpg','크리스마스 트리 실리콘 매트 접시 절연 패드, 나무 모양 삼발이 세트 코스터, 티팟 핫 팟, 할로윈 플레이스매트 테이블.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','코스터 컵 라운드 매트 패드, 커피 음료 실리콘 컵, 거치대 두꺼운 미끄럼 방지 열 두꺼운 주방 테이블 액세서리',3019,'코스터 컵 라운드 매트 패드, 커피 음료 실리콘 컵, 거치대 두꺼운 미끄럼 방지 열 두꺼운 주방 테이블 액세서리.jpg','코스터 컵 라운드 매트 패드, 커피 음료 실리콘 컵, 거치대 두꺼운 미끄럼 방지 열 두꺼운 주방 테이블 액세서리.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','라운드 내열성 실리콘 매트 음료 컵 받침, 미끄럼 방지 냄비 거치대 테이블 플레이스매트, 주방 액세서리 온더제터, 18 cm, 14cm',2750,'라운드 내열성 실리콘 매트 음료 컵 받침, 미끄럼 방지 냄비 거치대 테이블 플레이스매트, 주방 액세서리 온더제터, 18 cm, 14cm.jpg','라운드 내열성 실리콘 매트 음료 컵 받침, 미끄럼 방지 냄비 거치대 테이블 플레이스매트, 주방 액세서리 온더제터, 18 cm, 14cm.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','북유럽 테이블 식탁 방수 매트 테이블보',1300,'북유럽 테이블 식탁 방수 매트 테이블보.jpg','북유럽 테이블 식탁 방수 매트 테이블보.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','초흡수성 식기 식기 건조 매트, 책상 배수 패드, 내열성 카운터 탑 매트, 미끄럼 방지 배수 플레이스매트, 주방',3936,'초흡수성 식기 식기 건조 매트, 책상 배수 패드, 내열성 카운터 탑 매트, 미끄럼 방지 배수 플레이스매트, 주방.jpg','초흡수성 식기 식기 건조 매트, 책상 배수 패드, 내열성 카운터 탑 매트, 미끄럼 방지 배수 플레이스매트, 주방.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','Miflame 식탁 매트용 PVC 플레이스매트 세트, 리넨 플레이스 매트 액세서리, 컵 와인 장식 매트, 테이블용 플레이스매트 4 개 세트',7928,'Miflame 식탁 매트용 PVC 플레이스매트 세트, 리넨 플레이스 매트 액세서리, 컵 와인 장식 매트, 테이블용 플레이스매트 4 개 세트.jpg','Miflame 식탁 매트용 PVC 플레이스매트 세트, 리넨 플레이스 매트 액세서리, 컵 와인 장식 매트, 테이블용 플레이스매트 4 개 세트.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','기하학적 내열성 실리콘 매트, 음료 컵 받침, 미끄럼 방지 냄비 거치대, 테이블 플레이스매트, 주방 액세서리, 컵 받침 패드',1397,'기하학적 내열성 실리콘 매트, 음료 컵 받침, 미끄럼 방지 냄비 거치대, 테이블 플레이스매트, 주방 액세서리, 컵 받침 패드.jpg','기하학적 내열성 실리콘 매트, 음료 컵 받침, 미끄럼 방지 냄비 거치대, 테이블 플레이스매트, 주방 액세서리, 컵 받침 패드.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','골드 미러 웨딩 테이블 번호, 웨딩 테이블 표지판, 3D 테이블 번호, 웨딩 테이블 장식, 스탠드 포함 ',35606,'골드 미러 웨딩 테이블 번호, 웨딩 테이블 표지판, 3D 테이블 번호, 웨딩 테이블 장식, 스탠드 포함 .jpg','골드 미러 웨딩 테이블 번호, 웨딩 테이블 표지판, 3D 테이블 번호, 웨딩 테이블 장식, 스탠드 포함 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','멀티 컬러 패션 미니멀리스트 격자 코스터, 신선한 코튼 코스터, 테이블 천 절연 매트, DIY 홈 ',5245,'멀티 컬러 패션 미니멀리스트 격자 코스터, 신선한 코튼 코스터, 테이블 천 절연 매트, DIY 홈 .jpg','멀티 컬러 패션 미니멀리스트 격자 코스터, 신선한 코튼 코스터, 테이블 천 절연 매트, DIY 홈 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','녹색 몬스테라 데리코 잎 버클 베켓 호텔 웨딩 파티 이벤트 식탁 장식, 참신한 디자인 냅킨 링 홀더 ',1340,'녹색 몬스테라 데리코 잎 버클 베켓 호텔 웨딩 파티 이벤트 식탁 장식, 참신한 디자인 냅킨 링 홀더 .jpg','녹색 몬스테라 데리코 잎 버클 베켓 호텔 웨딩 파티 이벤트 식탁 장식, 참신한 디자인 냅킨 링 홀더 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','튼튼한 아크릴 테이블 탑 사인 거치대, 목재 베이스, 메뉴 디스플레이 스탠드, 양면 그림 카드 프레임, 홈 오피스, A4, A5, A6 ',0,'튼튼한 아크릴 테이블 탑 사인 거치대, 목재 베이스, 메뉴 디스플레이 스탠드, 양면 그림 카드 프레임, 홈 오피스, A4, A5, A6 .jpg','튼튼한 아크릴 테이블 탑 사인 거치대, 목재 베이스, 메뉴 디스플레이 스탠드, 양면 그림 카드 프레임, 홈 오피스, A4, A5, A6 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','물결 모양 원형 플레이스매트 세트, 식탁용 주방 테이블 매트, 세탁 가능, 6 개의 우븐 브레이드, 15 인치 원형 플레이스매트, 6 개, 4 개, 1 개 ',21612,'물결 모양 원형 플레이스매트 세트, 식탁용 주방 테이블 매트, 세탁 가능, 6 개의 우븐 브레이드, 15 인치 원형 플레이스매트, 6 개, 4 개, 1 개 .jpg','물결 모양 원형 플레이스매트 세트, 식탁용 주방 테이블 매트, 세탁 가능, 6 개의 우븐 브레이드, 15 인치 원형 플레이스매트, 6 개, 4 개, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','야외 웨딩 이벤트 스트레치 테이블 커버, 직사각형 탄성 식탁보, 블랙 화이트 칵테일 테이블, 1pc ',2002,'야외 웨딩 이벤트 스트레치 테이블 커버, 직사각형 탄성 식탁보, 블랙 화이트 칵테일 테이블, 1pc .jpg','야외 웨딩 이벤트 스트레치 테이블 커버, 직사각형 탄성 식탁보, 블랙 화이트 칵테일 테이블, 1pc .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','귀여운 일본 벚꽃 코스터 차 컵 매트, 사쿠라 코스터, 단열 테이블 매트, 차 우유 머그잔, 음료 컵 코스터, 1 개 ',1397,'귀여운 일본 벚꽃 코스터 차 컵 매트, 사쿠라 코스터, 단열 테이블 매트, 차 우유 머그잔, 음료 컵 코스터, 1 개 .jpg','귀여운 일본 벚꽃 코스터 차 컵 매트, 사쿠라 코스터, 단열 테이블 매트, 차 우유 머그잔, 음료 컵 코스터, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','실리콘 내열성 패드 접이식 미끄럼 방지 냄비 팬 매트, 접시 접시 접시, 크로스 거치대 코스터, 주방 테이블 삼발이 ',1397,'실리콘 내열성 패드 접이식 미끄럼 방지 냄비 팬 매트, 접시 접시 접시, 크로스 거치대 코스터, 주방 테이블 삼발이 .jpg','실리콘 내열성 패드 접이식 미끄럼 방지 냄비 팬 매트, 접시 접시 접시, 크로스 거치대 코스터, 주방 테이블 삼발이 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','기하학적 격자 무늬 리넨 얼룩 방지 직사각형 테이블 러너, 식탁 휴일 장식 파티 장식 ',5432,'기하학적 격자 무늬 리넨 얼룩 방지 직사각형 테이블 러너, 식탁 휴일 장식 파티 장식 .jpg','기하학적 격자 무늬 리넨 얼룩 방지 직사각형 테이블 러너, 식탁 휴일 장식 파티 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','관음 연꽃 잎 인공 식물, 신선한 목가적인 스타일 홈 장식, 거실 테이블 장식, 90cm, 35.4 인치 ',1397,'관음 연꽃 잎 인공 식물, 신선한 목가적인 스타일 홈 장식, 거실 테이블 장식, 90cm, 35.4 인치 .jpg','관음 연꽃 잎 인공 식물, 신선한 목가적인 스타일 홈 장식, 거실 테이블 장식, 90cm, 35.4 인치 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','헬로 여름 그놈 수박 린넨 테이블 러너, 농가 테이블 장식, 실내 식탁 러너, 휴일 파티 장식 ',6108,'헬로 여름 그놈 수박 린넨 테이블 러너, 농가 테이블 장식, 실내 식탁 러너, 휴일 파티 장식 .jpg','헬로 여름 그놈 수박 린넨 테이블 러너, 농가 테이블 장식, 실내 식탁 러너, 휴일 파티 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','활 식탁 장식, 러너 장식, 파티 파티 액세서리, 아버지날 러너 ',6518,'활 식탁 장식, 러너 장식, 파티 파티 액세서리, 아버지날 러너 .jpg','활 식탁 장식, 러너 장식, 파티 파티 액세서리, 아버지날 러너 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','라운드 테이블 플레이스매트 수제 직조 미끄럼 방지 플레이스매트 코스터, 옥수수 선체, 테이블 단열 패드, 홈 데코 ',552,'라운드 테이블 플레이스매트 수제 직조 미끄럼 방지 플레이스매트 코스터, 옥수수 선체, 테이블 단열 패드, 홈 데코 .jpg','라운드 테이블 플레이스매트 수제 직조 미끄럼 방지 플레이스매트 코스터, 옥수수 선체, 테이블 단열 패드, 홈 데코 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','빈티지 베이지 테이블 러너 크리스마스 크로셰 레이스 코튼 혼방 원단, 술 포함, 커피 테이블 장식 웨딩 장식 ',1397,'빈티지 베이지 테이블 러너 크리스마스 크로셰 레이스 코튼 혼방 원단, 술 포함, 커피 테이블 장식 웨딩 장식 .jpg','빈티지 베이지 테이블 러너 크리스마스 크로셰 레이스 코튼 혼방 원단, 술 포함, 커피 테이블 장식 웨딩 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','둥근 테이블 매트 디너 테이블, 산호 나무 패턴, 내열 중공 테이블 코스터, 그릇 패드, 홈 크리스마스 장식, 38cm ',1058,'둥근 테이블 매트 디너 테이블, 산호 나무 패턴, 내열 중공 테이블 코스터, 그릇 패드, 홈 크리스마스 장식, 38cm .jpg','둥근 테이블 매트 디너 테이블, 산호 나무 패턴, 내열 중공 테이블 코스터, 그릇 패드, 홈 크리스마스 장식, 38cm .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','라운드 테이블 천 식탁 커버, 웨딩 크리스마스 장식, 생일 연회 장식, 가정용 식탁 커버, 160cm ',6364,'라운드 테이블 천 식탁 커버, 웨딩 크리스마스 장식, 생일 연회 장식, 가정용 식탁 커버, 160cm .jpg','라운드 테이블 천 식탁 커버, 웨딩 크리스마스 장식, 생일 연회 장식, 가정용 식탁 커버, 160cm .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','주방 코튼 린넨 식탁 매트, 패션 티 코스터 패드, 그릇 컵 매트, 홈 데코, 26 글자, 42*32cm ',2285,'주방 코튼 린넨 식탁 매트, 패션 티 코스터 패드, 그릇 컵 매트, 홈 데코, 26 글자, 42*32cm .jpg','주방 코튼 린넨 식탁 매트, 패션 티 코스터 패드, 그릇 컵 매트, 홈 데코, 26 글자, 42*32cm .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','새틴 테이블 러너, 레스토랑 크리스마스 생일 베이비 샤워 연회 장식, 웨딩 파티 테이블 러너, 30x18, 0cm, 275cm ',6685,'새틴 테이블 러너, 레스토랑 크리스마스 생일 베이비 샤워 연회 장식, 웨딩 파티 테이블 러너, 30x18, 0cm, 275cm .jpg','새틴 테이블 러너, 레스토랑 크리스마스 생일 베이비 샤워 연회 장식, 웨딩 파티 테이블 러너, 30x18, 0cm, 275cm .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','방수 PVC 코스터 플레이스 매트, 45*30 직사각형, 장식 그릇 매트, 단열 패드, 테이블 코스터 ',1143,'방수 PVC 코스터 플레이스 매트, 45*30 직사각형, 장식 그릇 매트, 단열 패드, 테이블 코스터 .jpg','방수 PVC 코스터 플레이스 매트, 45*30 직사각형, 장식 그릇 매트, 단열 패드, 테이블 코스터 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','주방 조리대용 흡수성 건조 매트, 주방 싱크대 매트, 테이블 매트, 규조토 흡수 패드, 싱크대 수도꼭지 배수 패드 ',4506,'주방 조리대용 흡수성 건조 매트, 주방 싱크대 매트, 테이블 매트, 규조토 흡수 패드, 싱크대 수도꼭지 배수 패드 .jpg','주방 조리대용 흡수성 건조 매트, 주방 싱크대 매트, 테이블 매트, 규조토 흡수 패드, 싱크대 수도꼭지 배수 패드 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','테이블 매트 세트 미끄럼 방지 볼 패드 코스터 세트, 세탁 가능한 PVC 식탁 플레이스매트, 모던 홈 데코 액세서리, 4 개 ',5010,'테이블 매트 세트 미끄럼 방지 볼 패드 코스터 세트, 세탁 가능한 PVC 식탁 플레이스매트, 모던 홈 데코 액세서리, 4 개 .jpg','테이블 매트 세트 미끄럼 방지 볼 패드 코스터 세트, 세탁 가능한 PVC 식탁 플레이스매트, 모던 홈 데코 액세서리, 4 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','삼베 테이블 매트 레이스 플레이스매트 세트, 자연 황마 우븐 식기 매트, 웨딩 파티 용품, 커피 티 패드, 홈 데코, 1 개 ',2638,'삼베 테이블 매트 레이스 플레이스매트 세트, 자연 황마 우븐 식기 매트, 웨딩 파티 용품, 커피 티 패드, 홈 데코, 1 개 .jpg','삼베 테이블 매트 레이스 플레이스매트 세트, 자연 황마 우븐 식기 매트, 웨딩 파티 용품, 커피 티 패드, 홈 데코, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','결혼 테이블 번호 거치대 스탠드, 이름 좌석 라벨, 플레이스 카드 클립, 그림 카드 디스플레이 스탠드, 기념일 파티, 10 개 ',1566,'결혼 테이블 번호 거치대 스탠드, 이름 좌석 라벨, 플레이스 카드 클립, 그림 카드 디스플레이 스탠드, 기념일 파티, 10 개 .jpg','결혼 테이블 번호 거치대 스탠드, 이름 좌석 라벨, 플레이스 카드 클립, 그림 카드 디스플레이 스탠드, 기념일 파티, 10 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','테이블 배수 패드 탁상 흡수성 배수 매트 식기 매트, 곰팡이 방지 플레이스 매트, 습기 방지, 테이블 장식용 플레이스 매트 ',3216,'테이블 배수 패드 탁상 흡수성 배수 매트 식기 매트, 곰팡이 방지 플레이스 매트, 습기 방지, 테이블 장식용 플레이스 매트 .jpg','테이블 배수 패드 탁상 흡수성 배수 매트 식기 매트, 곰팡이 방지 플레이스 매트, 습기 방지, 테이블 장식용 플레이스 매트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','토끼 계란 꽃 튤립 부활절 리넨 테이블 러너 드레서 스카프 테이블 장식, 세탁 가능 주방 다이닝 커피 테이블 러너 장식 ',6946,'토끼 계란 꽃 튤립 부활절 리넨 테이블 러너 드레서 스카프 테이블 장식, 세탁 가능 주방 다이닝 커피 테이블 러너 장식 .jpg','토끼 계란 꽃 튤립 부활절 리넨 테이블 러너 드레서 스카프 테이블 장식, 세탁 가능 주방 다이닝 커피 테이블 러너 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','레이스 자수 코스터 냅킨 주방 액세서리, 사진 소품 테이블 커버, 레트로 빈티지 파티 웨딩 홈 장식 ',2031,'레이스 자수 코스터 냅킨 주방 액세서리, 사진 소품 테이블 커버, 레트로 빈티지 파티 웨딩 홈 장식 .jpg','레이스 자수 코스터 냅킨 주방 액세서리, 사진 소품 테이블 커버, 레트로 빈티지 파티 웨딩 홈 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','축구 플레이스 매트 필드 오브 더 게임 전략 전술 엔드 존 터치다운 스포츠 대회 테마 린넨 플레이스 매트 식탁 ',2285,'축구 플레이스 매트 필드 오브 더 게임 전략 전술 엔드 존 터치다운 스포츠 대회 테마 린넨 플레이스 매트 식탁 .jpg','축구 플레이스 매트 필드 오브 더 게임 전략 전술 엔드 존 터치다운 스포츠 대회 테마 린넨 플레이스 매트 식탁 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','스노우 피크 천연 나무 컵 매트, 테이블 코스터, 차 커피 바 컵 매트 패드, 나무 음료 코스터, 플레이스매트 ',7519,'스노우 피크 천연 나무 컵 매트, 테이블 코스터, 차 커피 바 컵 매트 패드, 나무 음료 코스터, 플레이스매트 .jpg','스노우 피크 천연 나무 컵 매트, 테이블 코스터, 차 커피 바 컵 매트 패드, 나무 음료 코스터, 플레이스매트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','화이트 얇은 명주 그물 테이블 러너, 진주 얇은 명주 그물 식탁보, 웨딩 베일 직물, 웨딩 아치 디저트 테이블 장식 ',1397,'화이트 얇은 명주 그물 테이블 러너, 진주 얇은 명주 그물 식탁보, 웨딩 베일 직물, 웨딩 아치 디저트 테이블 장식 .jpg','화이트 얇은 명주 그물 테이블 러너, 진주 얇은 명주 그물 식탁보, 웨딩 베일 직물, 웨딩 아치 디저트 테이블 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','대형 탁상 천 책상 매트, 테이블 보호대 가죽 식탁보, 간편한 청소, 방수 미끄럼 방지 키보드 마우스 패드 ',8926,'대형 탁상 천 책상 매트, 테이블 보호대 가죽 식탁보, 간편한 청소, 방수 미끄럼 방지 키보드 마우스 패드 .jpg','대형 탁상 천 책상 매트, 테이블 보호대 가죽 식탁보, 간편한 청소, 방수 미끄럼 방지 키보드 마우스 패드 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','미끄럼 방지 PU 가죽 플레이스매트, 만화 곰 음식 테이블 매트, 방수 및 내유성, 절연 플레이스매트, 홈 데코 ',7392,'미끄럼 방지 PU 가죽 플레이스매트, 만화 곰 음식 테이블 매트, 방수 및 내유성, 절연 플레이스매트, 홈 데코 .jpg','미끄럼 방지 PU 가죽 플레이스매트, 만화 곰 음식 테이블 매트, 방수 및 내유성, 절연 플레이스매트, 홈 데코 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','재미있는 경량 테이블 장식 책상 사인, 알루미늄 합금 좌석 카드, 직장 동료 선물, 블랙 사무실 장식 사인 ',5911,'재미있는 경량 테이블 장식 책상 사인, 알루미늄 합금 좌석 카드, 직장 동료 선물, 블랙 사무실 장식 사인 .jpg','재미있는 경량 테이블 장식 책상 사인, 알루미늄 합금 좌석 카드, 직장 동료 선물, 블랙 사무실 장식 사인 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','프렌치 파티 직사각형 테이블 천, 호텔 기숙사 프릴 가장자리 테이블 천, 프린트 테이블 린넨 주방 장식 ',21739,'프렌치 파티 직사각형 테이블 천, 호텔 기숙사 프릴 가장자리 테이블 천, 프린트 테이블 린넨 주방 장식 .jpg','프렌치 파티 직사각형 테이블 천, 호텔 기숙사 프릴 가장자리 테이블 천, 프린트 테이블 린넨 주방 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','일회용 식탁보 플라스틱 필름 투명 피크닉 천 가정용 두꺼운 방수 상업용 원형 테이블 직사각형 식탁보 ',6856,'일회용 식탁보 플라스틱 필름 투명 피크닉 천 가정용 두꺼운 방수 상업용 원형 테이블 직사각형 식탁보 .jpg','일회용 식탁보 플라스틱 필름 투명 피크닉 천 가정용 두꺼운 방수 상업용 원형 테이블 직사각형 식탁보 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','금속 장소 카드 홀더, 라운드 하트 모양 사진 클립, 웨딩 테이블 장소 카드 스탠드, 생일 파티 장식 용품, 12 개, 1 개 ',2010,'금속 장소 카드 홀더, 라운드 하트 모양 사진 클립, 웨딩 테이블 장소 카드 스탠드, 생일 파티 장식 용품, 12 개, 1 개 .jpg','금속 장소 카드 홀더, 라운드 하트 모양 사진 클립, 웨딩 테이블 장소 카드 스탠드, 생일 파티 장식 용품, 12 개, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','대형 냅킨 코튼 거즈, 모슬린 티 타월, 저녁 식사 레트로 치즈 천, 웨딩 파티, 소박한 테이블 장식, 16 인치, 41cm ',1397,'대형 냅킨 코튼 거즈, 모슬린 티 타월, 저녁 식사 레트로 치즈 천, 웨딩 파티, 소박한 테이블 장식, 16 인치, 41cm .jpg','대형 냅킨 코튼 거즈, 모슬린 티 타월, 저녁 식사 레트로 치즈 천, 웨딩 파티, 소박한 테이블 장식, 16 인치, 41cm .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','주방용 작은 데이지 면 플로럴 식탁보, 티 테이블 장식, 직사각형 테이블 커버, 결혼식 식당용, 한국 스타일 ',3326,'주방용 작은 데이지 면 플로럴 식탁보, 티 테이블 장식, 직사각형 테이블 커버, 결혼식 식당용, 한국 스타일 .jpg','주방용 작은 데이지 면 플로럴 식탁보, 티 테이블 장식, 직사각형 테이블 커버, 결혼식 식당용, 한국 스타일 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','레트로 비닐 레코드 컵 코스터, 미끄럼 방지 커피 코스터, 내열성 음악 음료 머그잔 매트, 테이블 플레이스 매트 장식, 6 4 2 개, 신제품 ',1397,'레트로 비닐 레코드 컵 코스터, 미끄럼 방지 커피 코스터, 내열성 음악 음료 머그잔 매트, 테이블 플레이스 매트 장식, 6 4 2 개, 신제품 .jpg','레트로 비닐 레코드 컵 코스터, 미끄럼 방지 커피 코스터, 내열성 음악 음료 머그잔 매트, 테이블 플레이스 매트 장식, 6 4 2 개, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','과일 모양 코스터, 귀여운 일본 레몬 스타과일 수박 커피 컵 코스터, 단열 테이블 매트, 차 머그잔, 홈 데코 ',113,'과일 모양 코스터, 귀여운 일본 레몬 스타과일 수박 커피 컵 코스터, 단열 테이블 매트, 차 머그잔, 홈 데코 .jpg','과일 모양 코스터, 귀여운 일본 레몬 스타과일 수박 커피 컵 코스터, 단열 테이블 매트, 차 머그잔, 홈 데코 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','고품질 테이블 천 격자 시리즈 면 플레이스매트, 사진 소품, 사각형 커피 컵, 홈 데코 ',1397,'고품질 테이블 천 격자 시리즈 면 플레이스매트, 사진 소품, 사각형 커피 컵, 홈 데코 .jpg','고품질 테이블 천 격자 시리즈 면 플레이스매트, 사진 소품, 사각형 커피 컵, 홈 데코 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','미니 인공 알로에 식물 분재, 작은 모조 나무 화분 식물, 가짜 꽃, 사무실 테이블 화분 장식품, 가정 정원 장식 ',1355,'미니 인공 알로에 식물 분재, 작은 모조 나무 화분 식물, 가짜 꽃, 사무실 테이블 화분 장식품, 가정 정원 장식 .jpg','미니 인공 알로에 식물 분재, 작은 모조 나무 화분 식물, 가짜 꽃, 사무실 테이블 화분 장식품, 가정 정원 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','귀여운 만화 동물 부드러운 양모 펠트 코스터, 화상 방지 테이블 매트 장식, 단열 플레이스 매트, 주방 액세서리, 크리스마스 선물 ',4740,'귀여운 만화 동물 부드러운 양모 펠트 코스터, 화상 방지 테이블 매트 장식, 단열 플레이스 매트, 주방 액세서리, 크리스마스 선물 .jpg','귀여운 만화 동물 부드러운 양모 펠트 코스터, 화상 방지 테이블 매트 장식, 단열 플레이스 매트, 주방 액세서리, 크리스마스 선물 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','창의적인 귀여운 고양이 테이블 플레이스 매트, 방수 단열 미끄럼 방지 그릇 패드, 만화 우유 커피 코스터, 주방 식기 ',663,'창의적인 귀여운 고양이 테이블 플레이스 매트, 방수 단열 미끄럼 방지 그릇 패드, 만화 우유 커피 코스터, 주방 식기 .jpg','창의적인 귀여운 고양이 테이블 플레이스 매트, 방수 단열 미끄럼 방지 그릇 패드, 만화 우유 커피 코스터, 주방 식기 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','암소 플레이스매트 린넨 원단 테이블 매트, 가족 저녁 식사 식기, 주방 테이블 매트, 30x40cm ',2243,'암소 플레이스매트 린넨 원단 테이블 매트, 가족 저녁 식사 식기, 주방 테이블 매트, 30x40cm .jpg','암소 플레이스매트 린넨 원단 테이블 매트, 가족 저녁 식사 식기, 주방 테이블 매트, 30x40cm .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','맞춤형 추상 잉크 도금 식탁보, 식탁 가장자리 마감 테이블 커버, 방수 및 내유성 식탁보 ',15941,'맞춤형 추상 잉크 도금 식탁보, 식탁 가장자리 마감 테이블 커버, 방수 및 내유성 식탁보 .jpg','맞춤형 추상 잉크 도금 식탁보, 식탁 가장자리 마감 테이블 커버, 방수 및 내유성 식탁보 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','레트로 단색 스케치 새 꽃 테이블 러너, 블루 화이트 린넨 테이블 러너, 휴일 웨딩 파티 주방 식탁 장식 ',7359,'레트로 단색 스케치 새 꽃 테이블 러너, 블루 화이트 린넨 테이블 러너, 휴일 웨딩 파티 주방 식탁 장식 .jpg','레트로 단색 스케치 새 꽃 테이블 러너, 블루 화이트 린넨 테이블 러너, 휴일 웨딩 파티 주방 식탁 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','고급 아크릴 금박 컵 거치대, 주방 웨딩 테이블 장식, 테이블 매트, 골드 및 실버 호일 코스터 ',2483,'고급 아크릴 금박 컵 거치대, 주방 웨딩 테이블 장식, 테이블 매트, 골드 및 실버 호일 코스터 .jpg','고급 아크릴 금박 컵 거치대, 주방 웨딩 테이블 장식, 테이블 매트, 골드 및 실버 호일 코스터 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','나뭇잎 및 태양 프린트 식탁보, 간단한 모던 추상 홈 주방 테이블 러너 다이닝 룸 테이블 장식 액세서리 ',7421,'나뭇잎 및 태양 프린트 식탁보, 간단한 모던 추상 홈 주방 테이블 러너 다이닝 룸 테이블 장식 액세서리 .jpg','나뭇잎 및 태양 프린트 식탁보, 간단한 모던 추상 홈 주방 테이블 러너 다이닝 룸 테이블 장식 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','절묘한 골드 냅킨 반지, 금속 냅킨 반지, 결혼식 파티 저녁 식사 호텔 테이블 장식 냅킨 거치대 ',1397,'절묘한 골드 냅킨 반지, 금속 냅킨 반지, 결혼식 파티 저녁 식사 호텔 테이블 장식 냅킨 거치대 .jpg','절묘한 골드 냅킨 반지, 금속 냅킨 반지, 결혼식 파티 저녁 식사 호텔 테이블 장식 냅킨 거치대 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'1','하누카 데코레이션 데이비드 유월절 테이블 러너, 계절 유태인 메노라 하누카 데코레이션, 빈티지 파티 디너 테이블 러너 ',7195,'하누카 데코레이션 데이비드 유월절 테이블 러너, 계절 유태인 메노라 하누카 데코레이션, 빈티지 파티 디너 테이블 러너 .jpg','하누카 데코레이션 데이비드 유월절 테이블 러너, 계절 유태인 메노라 하누카 데코레이션, 빈티지 파티 디너 테이블 러너 .jpg'); 


-- 욕실
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','Porte Salle de bain et 화장실 벽 스티커, 프랑스 욕실 화장실 문 벽지 벽화 데칼 비닐 벽 스티커, 홈 데코',3738,'Porte Salle de bain et 화장실 벽 스티커, 프랑스 욕실 화장실 문 벽지 벽화 데칼 비닐 벽 스티커, 홈 데코.jpg','Porte Salle de bain et 화장실 벽 스티커, 프랑스 욕실 화장실 문 벽지 벽화 데칼 비닐 벽 스티커, 홈 데코.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','창의적인 재미있는 변기 벽 및 문짝 스티커, 욕실 장식, 방수 데칼, 비닐 벽지 포스터, 홈 장식, 벽 O E0O8',1462,'창의적인 재미있는 변기 벽 및 문짝 스티커, 욕실 장식, 방수 데칼, 비닐 벽지 포스터, 홈 장식, 벽 O E0O8.jpg','창의적인 재미있는 변기 벽 및 문짝 스티커, 욕실 장식, 방수 데칼, 비닐 벽지 포스터, 홈 장식, 벽 O E0O8.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','녹색 식물 잎 꽃 벽 스티커, 욕실 변기 장식, 거실 캐비닛 홈 장식 데칼, 아름다운 자체 접착 M',2281,'녹색 식물 잎 꽃 벽 스티커, 욕실 변기 장식, 거실 캐비닛 홈 장식 데칼, 아름다운 자체 접착 M.jpg','녹색 식물 잎 꽃 벽 스티커, 욕실 변기 장식, 거실 캐비닛 홈 장식 데칼, 아름다운 자체 접착 M.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','모자이크 타일 스티커 탈착식 셀프 스티커, 주방 욕실 장식, 방수 벽지, 집 벽 데칼, 10 개',0,'모자이크 타일 스티커 탈착식 셀프 스티커, 주방 욕실 장식, 방수 벽지, 집 벽 데칼, 10 개.jpg','모자이크 타일 스티커 탈착식 셀프 스티커, 주방 욕실 장식, 방수 벽지, 집 벽 데칼, 10 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','재미있는 변기 벽/문짝 스티커, 욕실 장식, 홈 방수 포스터 벽지 장식, 벽 데칼, Viny X8d7',1984,'재미있는 변기 벽/문짝 스티커, 욕실 장식, 홈 방수 포스터 벽지 장식, 벽 데칼, Viny X8d7.jpg','재미있는 변기 벽/문짝 스티커, 욕실 장식, 홈 방수 포스터 벽지 장식, 벽 데칼, Viny X8d7.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','3D 고양이 변기 벽 스티커, 구멍 보기, 욕실, 거실, 홈 데코, 포스터 배경, 방수 동물 벽화',0,'3D 고양이 변기 벽 스티커, 구멍 보기, 욕실, 거실, 홈 데코, 포스터 배경, 방수 동물 벽화.jpg','3D 고양이 변기 벽 스티커, 구멍 보기, 욕실, 거실, 홈 데코, 포스터 배경, 방수 동물 벽화.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','PVC 손쉬운 설치, 사랑스러운 팬더 및 해바라기 욕실 벽 데칼, 손쉬운 필링 및 스틱, 탈착식 PVC 스티커, 변기 장식',0,'PVC 손쉬운 설치, 사랑스러운 팬더 및 해바라기 욕실 벽 데칼, 손쉬운 필링 및 스틱, 탈착식 PVC 스티커, 변기 장식.jpg','PVC 손쉬운 설치, 사랑스러운 팬더 및 해바라기 욕실 벽 데칼, 손쉬운 필링 및 스틱, 탈착식 PVC 스티커, 변기 장식.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','해바라기 벽 스티커, 욕실 변기 변기 뚜껑, WC 문짝 스티커 장식, 거실 캐비닛 냉장고, 가정용 데칼, M229',2705,'해바라기 벽 스티커, 욕실 변기 변기 뚜껑, WC 문짝 스티커 장식, 거실 캐비닛 냉장고, 가정용 데칼, M229.jpg','해바라기 벽 스티커, 욕실 변기 변기 뚜껑, WC 문짝 스티커 장식, 거실 캐비닛 냉장고, 가정용 데칼, M229.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','평평한 대리석 모자이크 엠보싱 타일 스티커, 주방 욕실 벽 데칼, 필 앤 스틱, 방수 타일 아트 월페이퍼, 10 개',0,'평평한 대리석 모자이크 엠보싱 타일 스티커, 주방 욕실 벽 데칼, 필 앤 스틱, 방수 타일 아트 월페이퍼, 10 개.jpg','평평한 대리석 모자이크 엠보싱 타일 스티커, 주방 욕실 벽 데칼, 필 앤 스틱, 방수 타일 아트 월페이퍼, 10 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','3D 벽 스티커 자체 접착 벽지 패널 홈 장식, 거실 침실 장식, 욕실 주방 홈 스티커 벽지',0,'3D 벽 스티커 자체 접착 벽지 패널 홈 장식, 거실 침실 장식, 욕실 주방 홈 스티커 벽지.jpg','3D 벽 스티커 자체 접착 벽지 패널 홈 장식, 거실 침실 장식, 욕실 주방 홈 스티커 벽지.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','방 천장 스티커 아트 타일 PVC 깊이 및 질감, 흰색 특징 패키지, 내용 제품 이름, 방 욕실 천장 ',0,'방 천장 스티커 아트 타일 PVC 깊이 및 질감, 흰색 특징 패키지, 내용 제품 이름, 방 욕실 천장 .jpg','방 천장 스티커 아트 타일 PVC 깊이 및 질감, 흰색 특징 패키지, 내용 제품 이름, 방 욕실 천장 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','변기 스티커 크리스마스 산타 클로스 눈사람 녹색 식물 패턴, 자체 접착 데칼, 어린이 욕실 축제 홈 데코, 신제품 ',2582,'변기 스티커 크리스마스 산타 클로스 눈사람 녹색 식물 패턴, 자체 접착 데칼, 어린이 욕실 축제 홈 데코, 신제품 .jpg','변기 스티커 크리스마스 산타 클로스 눈사람 녹색 식물 패턴, 자체 접착 데칼, 어린이 욕실 축제 홈 데코, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','녹색 식물 잎 욕실 변기 뚜껑 커버 데칼 스티커 PVC 스티커, 자체 접착 화장실 장식 화장실 뚜껑 스티커 아트 ',3607,'녹색 식물 잎 욕실 변기 뚜껑 커버 데칼 스티커 PVC 스티커, 자체 접착 화장실 장식 화장실 뚜껑 스티커 아트 .jpg','녹색 식물 잎 욕실 변기 뚜껑 커버 데칼 스티커 PVC 스티커, 자체 접착 화장실 장식 화장실 뚜껑 스티커 아트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','핑크 레오파드 벽 스티커, 욕실 변기 장식, 거실 캐비닛 홈 데칼, 접착식 벽화 장식 ',0,'핑크 레오파드 벽 스티커, 욕실 변기 장식, 거실 캐비닛 홈 데칼, 접착식 벽화 장식 .jpg','핑크 레오파드 벽 스티커, 욕실 변기 장식, 거실 캐비닛 홈 데칼, 접착식 벽화 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','녹색 식물 꽃 변기 스티커, 욕실 장식 ',1397,'녹색 식물 꽃 변기 스티커, 욕실 장식 .jpg','녹색 식물 꽃 변기 스티커, 욕실 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','거북이 변기 스티커 욕실 변기 커버, 벽 스티커, 동물 Wc 액세서리, 홈 욕실 장식, S138 ',0,'거북이 변기 스티커 욕실 변기 커버, 벽 스티커, 동물 Wc 액세서리, 홈 욕실 장식, S138 .jpg','거북이 변기 스티커 욕실 변기 커버, 벽 스티커, 동물 Wc 액세서리, 홈 욕실 장식, S138 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','침실 거울 스티커 사각 거울 실버 벽 스티커, 모자이크 욕실 접착 벽지 장식, 9 개, 16 개 ',0,'침실 거울 스티커 사각 거울 실버 벽 스티커, 모자이크 욕실 접착 벽지 장식, 9 개, 16 개 .jpg','침실 거울 스티커 사각 거울 실버 벽 스티커, 모자이크 욕실 접착 벽지 장식, 9 개, 16 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','만화 바다 거북이 해마 벽 스티커, 어린이 방 욕실 장식, 벽화 홈 장식, 자체 접착 해양 동물 벽지 ',1397,'만화 바다 거북이 해마 벽 스티커, 어린이 방 욕실 장식, 벽화 홈 장식, 자체 접착 해양 동물 벽지 .jpg','만화 바다 거북이 해마 벽 스티커, 어린이 방 욕실 장식, 벽화 홈 장식, 자체 접착 해양 동물 벽지 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','만화 인어 해초 욕실 변기 뚜껑 데칼, 방수 WC 문짝 스티커, 탈착식 장식, 가정용 스티커 S390 ',0,'만화 인어 해초 욕실 변기 뚜껑 데칼, 방수 WC 문짝 스티커, 탈착식 장식, 가정용 스티커 S390 .jpg','만화 인어 해초 욕실 변기 뚜껑 데칼, 방수 WC 문짝 스티커, 탈착식 장식, 가정용 스티커 S390 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','욕실 주방 벽 스티커, 어린이 방 바다 심해 바다 스티커, 거실 장식, 돌고래 물고기 장식, 방수 ',0,'욕실 주방 벽 스티커, 어린이 방 바다 심해 바다 스티커, 거실 장식, 돌고래 물고기 장식, 방수 .jpg','욕실 주방 벽 스티커, 어린이 방 바다 심해 바다 스티커, 거실 장식, 돌고래 물고기 장식, 방수 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','욕실 바닥 타일 스티커, 수영장 장식, 3D 벽지, 20 개 ',0,'욕실 바닥 타일 스티커, 수영장 장식, 3D 벽지, 20 개 .jpg','욕실 바닥 타일 스티커, 수영장 장식, 3D 벽지, 20 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','욕실 허리 라인 벽 스티커, 방수 필 스틱 아트 벽화 백스플래시, 주방 사무실 스커트 라인 장식 벽지 ',632,'욕실 허리 라인 벽 스티커, 방수 필 스틱 아트 벽화 백스플래시, 주방 사무실 스커트 라인 장식 벽지 .jpg','욕실 허리 라인 벽 스티커, 방수 필 스틱 아트 벽화 백스플래시, 주방 사무실 스커트 라인 장식 벽지 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','주방 욕실 벽 장식 타일 스티커, 세라믹 타일 스티커, DIY 벽 스티커, 10 개 ',2750,'주방 욕실 벽 장식 타일 스티커, 세라믹 타일 스티커, DIY 벽 스티커, 10 개 .jpg','주방 욕실 벽 장식 타일 스티커, 세라믹 타일 스티커, DIY 벽 스티커, 10 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','영어 변기 슬로건용 탈착식 자체 접착 PVC 벽 스티커, 욕실 화장실 장식 ',2208,'영어 변기 슬로건용 탈착식 자체 접착 PVC 벽 스티커, 욕실 화장실 장식 .jpg','영어 변기 슬로건용 탈착식 자체 접착 PVC 벽 스티커, 욕실 화장실 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','욕실 나비 꽃 변기 시트 스티커, DIY 자체 접착 변기 뚜껑 데칼, 수조 욕실 전원 스위치 장식 ',1989,'욕실 나비 꽃 변기 시트 스티커, DIY 자체 접착 변기 뚜껑 데칼, 수조 욕실 전원 스위치 장식 .jpg','욕실 나비 꽃 변기 시트 스티커, DIY 자체 접착 변기 뚜껑 데칼, 수조 욕실 전원 스위치 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','욕실용 방수 아크릴 벽 스티커, 넉넉한 거울 타일 은빛 벽 스티커, 홈 데코, 6 개 ',0,'욕실용 방수 아크릴 벽 스티커, 넉넉한 거울 타일 은빛 벽 스티커, 홈 데코, 6 개 .jpg','욕실용 방수 아크릴 벽 스티커, 넉넉한 거울 타일 은빛 벽 스티커, 홈 데코, 6 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','발코니 테라스용 모자이크 타일 스티커, 주방 욕실 배경, 홈 장식, 붙이기 벽지, 벽 스티커, 10x ',0,'발코니 테라스용 모자이크 타일 스티커, 주방 욕실 배경, 홈 장식, 붙이기 벽지, 벽 스티커, 10x .jpg','발코니 테라스용 모자이크 타일 스티커, 주방 욕실 배경, 홈 장식, 붙이기 벽지, 벽 스티커, 10x .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','습기 방지 모조 세라믹 타일 바닥 스티커, 3D 벽 스티커 벽지, 자체 접착 벽 장식, 욕실 벽 데칼 ',0,'습기 방지 모조 세라믹 타일 바닥 스티커, 3D 벽 스티커 벽지, 자체 접착 벽 장식, 욕실 벽 데칼 .jpg','습기 방지 모조 세라믹 타일 바닥 스티커, 3D 벽 스티커 벽지, 자체 접착 벽 장식, 욕실 벽 데칼 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','욕실 변기 스티커, 연꽃 잎, 자체 접착 데칼, 방수 벽 스티커, 침실 장식용 홈 데코, 여름 ',635,'욕실 변기 스티커, 연꽃 잎, 자체 접착 데칼, 방수 벽 스티커, 침실 장식용 홈 데코, 여름 .jpg','욕실 변기 스티커, 연꽃 잎, 자체 접착 데칼, 방수 벽 스티커, 침실 장식용 홈 데코, 여름 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','패션 3D 화장실 스티커 PVC 방수 고양이 생생한 벽 스티커 사랑스러운 동물 데 칼 욕실 화장실 Kicthen 장식 ',2582,'패션 3D 화장실 스티커 PVC 방수 고양이 생생한 벽 스티커 사랑스러운 동물 데 칼 욕실 화장실 Kicthen 장식 .jpg','패션 3D 화장실 스티커 PVC 방수 고양이 생생한 벽 스티커 사랑스러운 동물 데 칼 욕실 화장실 Kicthen 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','욕실 주방 집 벽 또는 바닥 자체 접착 벽 스티커, 흰색 타일 스티커, 집 장식 스티커 포스터, 10x ',3404,'욕실 주방 집 벽 또는 바닥 자체 접착 벽 스티커, 흰색 타일 스티커, 집 장식 스티커 포스터, 10x .jpg','욕실 주방 집 벽 또는 바닥 자체 접착 벽 스티커, 흰색 타일 스티커, 집 장식 스티커 포스터, 10x .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','유리 필름 단열 자외선 차단 햇빛가리개, 욕실 유리창 엿보기 방지 스티커, 홈 개선 하드웨어 액세서리 ',0,'유리 필름 단열 자외선 차단 햇빛가리개, 욕실 유리창 엿보기 방지 스티커, 홈 개선 하드웨어 액세서리 .jpg','유리 필름 단열 자외선 차단 햇빛가리개, 욕실 유리창 엿보기 방지 스티커, 홈 개선 하드웨어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','거품 원형 탈부착 벽지, 욕실 창문 벽 스티커, 가정용 DIY PVC 데칼 ',367,'거품 원형 탈부착 벽지, 욕실 창문 벽 스티커, 가정용 DIY PVC 데칼 .jpg','거품 원형 탈부착 벽지, 욕실 창문 벽 스티커, 가정용 DIY PVC 데칼 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','이미지 만화 브러시 로고 벽 스티커, 욕실 장식 데칼, 방수 PVC 자체 접착 스티커 ',0,'이미지 만화 브러시 로고 벽 스티커, 욕실 장식 데칼, 방수 PVC 자체 접착 스티커 .jpg','이미지 만화 브러시 로고 벽 스티커, 욕실 장식 데칼, 방수 PVC 자체 접착 스티커 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','3D 귀여운 고양이 변기 스티커, 욕실 변기 커버 스티커, 홈 욕실 장식용 동물 액세서리, 3 개, 1 개 ',2915,'3D 귀여운 고양이 변기 스티커, 욕실 변기 커버 스티커, 홈 욕실 장식용 동물 액세서리, 3 개, 1 개 .jpg','3D 귀여운 고양이 변기 스티커, 욕실 변기 커버 스티커, 홈 욕실 장식용 동물 액세서리, 3 개, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','만화 바다 동물 벽 스티커, 욕실 샤워 룸, 고래, 해초, 해파리, 버블, 귀여운 벽 데칼, 욕조 벽 장식 ',2581,'만화 바다 동물 벽 스티커, 욕실 샤워 룸, 고래, 해초, 해파리, 버블, 귀여운 벽 데칼, 욕조 벽 장식 .jpg','만화 바다 동물 벽 스티커, 욕실 샤워 룸, 고래, 해초, 해파리, 버블, 귀여운 벽 데칼, 욕조 벽 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','만화 크리스마스 난쟁이 운전 크리스마스 트리, 어린이 욕실 벽 스티커, 변기 장식 데칼, 크리스마스 홈 장식 ',2705,'만화 크리스마스 난쟁이 운전 크리스마스 트리, 어린이 욕실 벽 스티커, 변기 장식 데칼, 크리스마스 홈 장식 .jpg','만화 크리스마스 난쟁이 운전 크리스마스 트리, 어린이 욕실 벽 스티커, 변기 장식 데칼, 크리스마스 홈 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','변기 스티커, 화장실용 크리에이티브 변기 스티커, 크리에이티브 버크, 욕실 장식, PVC 자체 접착 스티커, 1 개 ',0,'변기 스티커, 화장실용 크리에이티브 변기 스티커, 크리에이티브 버크, 욕실 장식, PVC 자체 접착 스티커, 1 개 .jpg','변기 스티커, 화장실용 크리에이티브 변기 스티커, 크리에이티브 버크, 욕실 장식, PVC 자체 접착 스티커, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','모자이크 벽 바닥 타일 방수 스티커, 욕실 침실 타일, 가구 스티커, 6 개, 20cm ',0,'모자이크 벽 바닥 타일 방수 스티커, 욕실 침실 타일, 가구 스티커, 6 개, 20cm .jpg','모자이크 벽 바닥 타일 방수 스티커, 욕실 침실 타일, 가구 스티커, 6 개, 20cm .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','녹색 식물 잎 벽 스티커, 욕실 변기 스티커, WC 자체 접착 벽화, 꽃, 홈 욕실 장식 데칼 ',1961,'녹색 식물 잎 벽 스티커, 욕실 변기 스티커, WC 자체 접착 벽화, 꽃, 홈 욕실 장식 데칼 .jpg','녹색 식물 잎 벽 스티커, 욕실 변기 스티커, WC 자체 접착 벽화, 꽃, 홈 욕실 장식 데칼 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','변기 재미있는 고양이 개 여우 호랑이 동물 스티커, 욕실 변기 커버, 벽 스티커, WC 홈 욕실 장식, S353 ',2453,'변기 재미있는 고양이 개 여우 호랑이 동물 스티커, 욕실 변기 커버, 벽 스티커, WC 홈 욕실 장식, S353 .jpg','변기 재미있는 고양이 개 여우 호랑이 동물 스티커, 욕실 변기 커버, 벽 스티커, WC 홈 욕실 장식, S353 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','나비 식물 꽃 벽 스티커, 욕실 변기 장식 데칼, 거실 캐비닛 홈 장식, 접착식 벽화 ',2906,'나비 식물 꽃 벽 스티커, 욕실 변기 장식 데칼, 거실 캐비닛 홈 장식, 접착식 벽화 .jpg','나비 식물 꽃 벽 스티커, 욕실 변기 장식 데칼, 거실 캐비닛 홈 장식, 접착식 벽화 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','3D 인어 벽 스티커 패션 디자인, 아름다운 방수 데칼 유리 스티커, 욕실 변기 침실 장식, 홈 데코 ',0,'3D 인어 벽 스티커 패션 디자인, 아름다운 방수 데칼 유리 스티커, 욕실 변기 침실 장식, 홈 데코 .jpg','3D 인어 벽 스티커 패션 디자인, 아름다운 방수 데칼 유리 스티커, 욕실 변기 침실 장식, 홈 데코 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','변기 프레스 액세서리, 러브 변기 스티커, 단추 플러시 스위치, 욕실 용품 확장, 욕실 장식 액세서리 ',5479,'변기 프레스 액세서리, 러브 변기 스티커, 단추 플러시 스위치, 욕실 용품 확장, 욕실 장식 액세서리 .jpg','변기 프레스 액세서리, 러브 변기 스티커, 단추 플러시 스위치, 욕실 용품 확장, 욕실 장식 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','변기 스티커 제거 가능 자가 접착 방수 PVC 욕실 변기 뚜껑 장식, 가정 용품 데칼 ',579,'변기 스티커 제거 가능 자가 접착 방수 PVC 욕실 변기 뚜껑 장식, 가정 용품 데칼 .jpg','변기 스티커 제거 가능 자가 접착 방수 PVC 욕실 변기 뚜껑 장식, 가정 용품 데칼 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','주방 타일 스티커, 욕실 벽 스티커, 맞춤형 장식 스티커, 10 개 ',0,'주방 타일 스티커, 욕실 벽 스티커, 맞춤형 장식 스티커, 10 개 .jpg','주방 타일 스티커, 욕실 벽 스티커, 맞춤형 장식 스티커, 10 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','DIY 남녀공용 변기 문짝 사인, 욕실 화장실, WC 문짝 사인, 변기 문짝 사인, 벽 스티커 장식, 탈착식 로고, 1 쌍 ',0,'DIY 남녀공용 변기 문짝 사인, 욕실 화장실, WC 문짝 사인, 변기 문짝 사인, 벽 스티커 장식, 탈착식 로고, 1 쌍 .jpg','DIY 남녀공용 변기 문짝 사인, 욕실 화장실, WC 문짝 사인, 변기 문짝 사인, 벽 스티커 장식, 탈착식 로고, 1 쌍 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','녹색 식물 잎 꽃 변기 스티커, 자체 접착 변기 뚜껑 스티커, 욕실 벽 스티커, 변기 커버 장식 데칼 ',2412,'녹색 식물 잎 꽃 변기 스티커, 자체 접착 변기 뚜껑 스티커, 욕실 벽 스티커, 변기 커버 장식 데칼 .jpg','녹색 식물 잎 꽃 변기 스티커, 자체 접착 변기 뚜껑 스티커, 욕실 벽 스티커, 변기 커버 장식 데칼 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','변기 연꽃 변기 스티커, 탈착식 자체 접착 방수 PVC 데칼, 욕실 룸 변기 ',0,'변기 연꽃 변기 스티커, 탈착식 자체 접착 방수 PVC 데칼, 욕실 룸 변기 .jpg','변기 연꽃 변기 스티커, 탈착식 자체 접착 방수 PVC 데칼, 욕실 룸 변기 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','접착식 변기 스티커 꽃 그림, 벽 데칼, 욕실 장식, 탈착식 홈 DIY 스티커 ',0,'접착식 변기 스티커 꽃 그림, 벽 데칼, 욕실 장식, 탈착식 홈 DIY 스티커 .jpg','접착식 변기 스티커 꽃 그림, 벽 데칼, 욕실 장식, 탈착식 홈 DIY 스티커 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','PVC 만화 강아지 고양이 변기 스티커, 가정 장식, 화장실 목욕 스티커, 2024 1 개 ',0,'PVC 만화 강아지 고양이 변기 스티커, 가정 장식, 화장실 목욕 스티커, 2024 1 개 .jpg','PVC 만화 강아지 고양이 변기 스티커, 가정 장식, 화장실 목욕 스티커, 2024 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','25x29CM 화장실 영어 스티커 가정과 공공 장소 투명 이동식 장식 DIY 아트 홈 욕실 스티커 규칙 ',2472,'25x29CM 화장실 영어 스티커 가정과 공공 장소 투명 이동식 장식 DIY 아트 홈 욕실 스티커 규칙 .jpg','25x29CM 화장실 영어 스티커 가정과 공공 장소 투명 이동식 장식 DIY 아트 홈 욕실 스티커 규칙 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','재미있는 아기 변기 스티커, 욕실 벽 장식, 방수 PVC 홈 장식 아트, WC 뚜껑, DIY 데칼 ',3734,'재미있는 아기 변기 스티커, 욕실 벽 장식, 방수 PVC 홈 장식 아트, WC 뚜껑, DIY 데칼 .jpg','재미있는 아기 변기 스티커, 욕실 벽 장식, 방수 PVC 홈 장식 아트, WC 뚜껑, DIY 데칼 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','거품 원형 탈부착 벽지, 욕실 창문 벽 스티커, 가정용 DIY PVC 데칼 ',395,'거품 원형 탈부착 벽지, 욕실 창문 벽 스티커, 가정용 DIY PVC 데칼 .jpg','거품 원형 탈부착 벽지, 욕실 창문 벽 스티커, 가정용 DIY PVC 데칼 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','변기 욕실 문짝 WC 입구 사인 벽 스티커, 홈 장식, 크리에이티브 블랙 패턴, 벽 데칼 벽지, 하우스 사인, 신제품 ',0,'변기 욕실 문짝 WC 입구 사인 벽 스티커, 홈 장식, 크리에이티브 블랙 패턴, 벽 데칼 벽지, 하우스 사인, 신제품 .jpg','변기 욕실 문짝 WC 입구 사인 벽 스티커, 홈 장식, 크리에이티브 블랙 패턴, 벽 데칼 벽지, 하우스 사인, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','크리스탈 타일 스티커, 모자이크 타일 스티커 스틱, 욕실 주방 집 벽 또는 바닥, 자체 접착 PVC 스티커 장식, 10x ',0,'크리스탈 타일 스티커, 모자이크 타일 스티커 스틱, 욕실 주방 집 벽 또는 바닥, 자체 접착 PVC 스티커 장식, 10x .jpg','크리스탈 타일 스티커, 모자이크 타일 스티커 스틱, 욕실 주방 집 벽 또는 바닥, 자체 접착 PVC 스티커 장식, 10x .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','블랙 로즈 패턴 변기 뚜껑 데칼, 우아한 욕실 액세서리, 접착 홈 장식 스티커, 꽃 벽 아트 데칼, S377 ',2984,'블랙 로즈 패턴 변기 뚜껑 데칼, 우아한 욕실 액세서리, 접착 홈 장식 스티커, 꽃 벽 아트 데칼, S377 .jpg','블랙 로즈 패턴 변기 뚜껑 데칼, 우아한 욕실 액세서리, 접착 홈 장식 스티커, 꽃 벽 아트 데칼, S377 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','참신한 창의적인 재미있는 화장실 시트 데칼, 욕실 장식, 스페인어 화장실 시트 스티커, 벽 벽화 아트 장식 ',2836,'참신한 창의적인 재미있는 화장실 시트 데칼, 욕실 장식, 스페인어 화장실 시트 스티커, 벽 벽화 아트 장식 .jpg','참신한 창의적인 재미있는 화장실 시트 데칼, 욕실 장식, 스페인어 화장실 시트 스티커, 벽 벽화 아트 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','변기 스티커 크리스마스 꽃 DIY 자체 접착 변기 데칼, 욕실 화장실 전원 스위치 장식 ',1002,'변기 스티커 크리스마스 꽃 DIY 자체 접착 변기 데칼, 욕실 화장실 전원 스위치 장식 .jpg','변기 스티커 크리스마스 꽃 DIY 자체 접착 변기 데칼, 욕실 화장실 전원 스위치 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'2','만화 소녀 벽 스티커, 욕실 변기 문짝 홈 장식, 동물 녹색 식물, 재미있는 데칼, M108 ',2405,'만화 소녀 벽 스티커, 욕실 변기 문짝 홈 장식, 동물 녹색 식물, 재미있는 데칼, M108 .jpg','만화 소녀 벽 스티커, 욕실 변기 문짝 홈 장식, 동물 녹색 식물, 재미있는 데칼, M108 .jpg'); 

--거실
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','반짝이는 바다 태피스트리 풍경 벽걸이 천, 침실 벽 장식, 방 장식, 야외 피크닉 매트, 비치 시트',1397,'반짝이는 바다 태피스트리 풍경 벽걸이 천, 침실 벽 장식, 방 장식, 야외 피크닉 매트, 비치 시트.jpg','반짝이는 바다 태피스트리 풍경 벽걸이 천, 침실 벽 장식, 방 장식, 야외 피크닉 매트, 비치 시트.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','창문 풍경 태피스트리 벽걸이 빈티지 소녀 방 장식, 보호 예술 미학 침실 요가 매트리스 시트',8622,'창문 풍경 태피스트리 벽걸이 빈티지 소녀 방 장식, 보호 예술 미학 침실 요가 매트리스 시트.jpg','창문 풍경 태피스트리 벽걸이 빈티지 소녀 방 장식, 보호 예술 미학 침실 요가 매트리스 시트.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','강 태피스트리 벽걸이 장식, 해변 풍경 태피스트리 벽걸이, 거실 침실 장식, 사이키델릭',13867,'강 태피스트리 벽걸이 장식, 해변 풍경 태피스트리 벽걸이, 거실 침실 장식, 사이키델릭.jpg','강 태피스트리 벽걸이 장식, 해변 풍경 태피스트리 벽걸이, 거실 침실 장식, 사이키델릭.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','맞춤형 태피스트리 만다라 보호 히피 벽걸이 방 장식, 사진 인쇄, 맞춤형 홈 장식, 배경 천',1267,'맞춤형 태피스트리 만다라 보호 히피 벽걸이 방 장식, 사진 인쇄, 맞춤형 홈 장식, 배경 천.jpg','맞춤형 태피스트리 만다라 보호 히피 벽걸이 방 장식, 사진 인쇄, 맞춤형 홈 장식, 배경 천.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','소박한 꽃 태피스트리 여름 여행 프린트 지중해 미술 벽걸이 사진 포스터 그림, 홈 장식',6198,'소박한 꽃 태피스트리 여름 여행 프린트 지중해 미술 벽걸이 사진 포스터 그림, 홈 장식.jpg','소박한 꽃 태피스트리 여름 여행 프린트 지중해 미술 벽걸이 사진 포스터 그림, 홈 장식.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','맞춤형 태피스트리 보호 만다라 태피스트리, 요술 벽 태피스트리, 사진 프린트, 히피 벽걸이 담요 태피스트리',1397,'맞춤형 태피스트리 보호 만다라 태피스트리, 요술 벽 태피스트리, 사진 프린트, 히피 벽걸이 담요 태피스트리.jpg','맞춤형 태피스트리 보호 만다라 태피스트리, 요술 벽 태피스트리, 사진 프린트, 히피 벽걸이 담요 태피스트리.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','태피스트리 판타지 아트 벽걸이 천, 나비 홈 아트 장식, 보헤미안 기숙사 침실 벽 장식',1397,'태피스트리 판타지 아트 벽걸이 천, 나비 홈 아트 장식, 보헤미안 기숙사 침실 벽 장식.jpg','태피스트리 판타지 아트 벽걸이 천, 나비 홈 아트 장식, 보헤미안 기숙사 침실 벽 장식.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','고딕 태피스트리 미학 나방 태피스트리 곤충 장식 버그 아트, 어두운 벽 예술, 위칸 걸이식 벽 예술, 고스 벽 예술 요술',7498,'고딕 태피스트리 미학 나방 태피스트리 곤충 장식 버그 아트, 어두운 벽 예술, 위칸 걸이식 벽 예술, 고스 벽 예술 요술.jpg','고딕 태피스트리 미학 나방 태피스트리 곤충 장식 버그 아트, 어두운 벽 예술, 위칸 걸이식 벽 예술, 고스 벽 예술 요술.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','귀여운 애니메이션 태피스트리 럭키 스타 이즈미 코나타, 일본 가정 장식, 벽걸이 카펫, 침실 배경, 친구 선물',420,'귀여운 애니메이션 태피스트리 럭키 스타 이즈미 코나타, 일본 가정 장식, 벽걸이 카펫, 침실 배경, 친구 선물.jpg','귀여운 애니메이션 태피스트리 럭키 스타 이즈미 코나타, 일본 가정 장식, 벽걸이 카펫, 침실 배경, 친구 선물.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','핑크 커튼 창 외부 일몰 풍경 인쇄 창 풍경 벽걸이 장식 태피스트리 비치 타월 벽 천, 95x73cm',4881,'핑크 커튼 창 외부 일몰 풍경 인쇄 창 풍경 벽걸이 장식 태피스트리 비치 타월 벽 천, 95x73cm.jpg','핑크 커튼 창 외부 일몰 풍경 인쇄 창 풍경 벽걸이 장식 태피스트리 비치 타월 벽 천, 95x73cm.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','Radioheads 음악 예술 벽걸이 태피스트리 벽지, 태피스트리 헤드보드, 미적 방 장식 ',420,'Radioheads 음악 예술 벽걸이 태피스트리 벽지, 태피스트리 헤드보드, 미적 방 장식 .jpg','Radioheads 음악 예술 벽걸이 태피스트리 벽지, 태피스트리 헤드보드, 미적 방 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','안개 낀 숲 나무 자연 풍경 태피스트리, 미적 방 장식, 벽걸이 천, 빅 사이즈 북유럽 태피스트리, 홈 데코 ',1397,'안개 낀 숲 나무 자연 풍경 태피스트리, 미적 방 장식, 벽걸이 천, 빅 사이즈 북유럽 태피스트리, 홈 데코 .jpg','안개 낀 숲 나무 자연 풍경 태피스트리, 미적 방 장식, 벽걸이 천, 빅 사이즈 북유럽 태피스트리, 홈 데코 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','북유럽 자연 풍경 태양 숲 산 태피스트리 사이키델릭 꽃 식물, 미적 방 장식, 벽걸이 천 ',2863,'북유럽 자연 풍경 태양 숲 산 태피스트리 사이키델릭 꽃 식물, 미적 방 장식, 벽걸이 천 .jpg','북유럽 자연 풍경 태양 숲 산 태피스트리 사이키델릭 꽃 식물, 미적 방 장식, 벽걸이 천 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','귀여운 홈 장식 벽걸이 태피스트리, 애니메이션 일본 소녀 태피스트리, 침실 배경 장식, 패션 숙녀 태피스트리 ',4443,'귀여운 홈 장식 벽걸이 태피스트리, 애니메이션 일본 소녀 태피스트리, 침실 배경 장식, 패션 숙녀 태피스트리 .jpg','귀여운 홈 장식 벽걸이 태피스트리, 애니메이션 일본 소녀 태피스트리, 침실 배경 장식, 패션 숙녀 태피스트리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','타일러 미국 국기 태피스트리 래퍼, 가수 홈 장식, 벽걸이 거실 침실 기숙사 미적 장식 ',420,'타일러 미국 국기 태피스트리 래퍼, 가수 홈 장식, 벽걸이 거실 침실 기숙사 미적 장식 .jpg','타일러 미국 국기 태피스트리 래퍼, 가수 홈 장식, 벽걸이 거실 침실 기숙사 미적 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','헬로 키티 고양이 귀여운 태피스트리, 미적인 귀여운 방 애니메이션 태피스트리 생일 장식, 벽걸이 선물, 아이 소녀 침실 거실 ',9634,'헬로 키티 고양이 귀여운 태피스트리, 미적인 귀여운 방 애니메이션 태피스트리 생일 장식, 벽걸이 선물, 아이 소녀 침실 거실 .jpg','헬로 키티 고양이 귀여운 태피스트리, 미적인 귀여운 방 애니메이션 태피스트리 생일 장식, 벽걸이 선물, 아이 소녀 침실 거실 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','스미스 여왕 죽은 태피스트리 보헤미안 패브릭 벽걸이, 1980 년대 암벽 장식, 요가 매트, 레트로 벽 태피스트리 ',5604,'스미스 여왕 죽은 태피스트리 보헤미안 패브릭 벽걸이, 1980 년대 암벽 장식, 요가 매트, 레트로 벽 태피스트리 .jpg','스미스 여왕 죽은 태피스트리 보헤미안 패브릭 벽걸이, 1980 년대 암벽 장식, 요가 매트, 레트로 벽 태피스트리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','모네 유화 태피스트리 벽걸이 보헤미안 추상 미술, 히피 미니멀리스트 미학, 방 거실 홈 장식 ',1397,'모네 유화 태피스트리 벽걸이 보헤미안 추상 미술, 히피 미니멀리스트 미학, 방 거실 홈 장식 .jpg','모네 유화 태피스트리 벽걸이 보헤미안 추상 미술, 히피 미니멀리스트 미학, 방 거실 홈 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','작은 신선한 홈 태피스트리 만화 귀여운 토끼 머리맡 걸이식 천, 배경 천, 기숙사 침실 장식 천 ',3541,'작은 신선한 홈 태피스트리 만화 귀여운 토끼 머리맡 걸이식 천, 배경 천, 기숙사 침실 장식 천 .jpg','작은 신선한 홈 태피스트리 만화 귀여운 토끼 머리맡 걸이식 천, 배경 천, 기숙사 침실 장식 천 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','Asap Rockys Flags 래퍼 태피스트리 방 장식, 미적 음악 앨범 아트 포스터, 벽걸이 침실 콘서트 배경 팬 선물 ',420,'Asap Rockys Flags 래퍼 태피스트리 방 장식, 미적 음악 앨범 아트 포스터, 벽걸이 침실 콘서트 배경 팬 선물 .jpg','Asap Rockys Flags 래퍼 태피스트리 방 장식, 미적 음악 앨범 아트 포스터, 벽걸이 침실 콘서트 배경 팬 선물 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','블랙 메탈 필로소핌 태피스트리 버줌스 밴드, 록 음악 프린트, 벽걸이 침실 배경, 홈 장식, 콘서트 배너 ',1263,'블랙 메탈 필로소핌 태피스트리 버줌스 밴드, 록 음악 프린트, 벽걸이 침실 배경, 홈 장식, 콘서트 배너 .jpg','블랙 메탈 필로소핌 태피스트리 버줌스 밴드, 록 음악 프린트, 벽걸이 침실 배경, 홈 장식, 콘서트 배너 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','고블린 태피스트리 벽걸이, 침실 장식 담요, 히피 배경 일러스트 벽화, 카와이 장식 ',11893,'고블린 태피스트리 벽걸이, 침실 장식 담요, 히피 배경 일러스트 벽화, 카와이 장식 .jpg','고블린 태피스트리 벽걸이, 침실 장식 담요, 히피 배경 일러스트 벽화, 카와이 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','XxDeco 풍경 태피스트리 산 풍경 인쇄 벽걸이 카펫, 침실 또는 홈 장식, 기숙사 배경 소파 담요 ',4208,'XxDeco 풍경 태피스트리 산 풍경 인쇄 벽걸이 카펫, 침실 또는 홈 장식, 기숙사 배경 소파 담요 .jpg','XxDeco 풍경 태피스트리 산 풍경 인쇄 벽걸이 카펫, 침실 또는 홈 장식, 기숙사 배경 소파 담요 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','애니메이션 벽걸이 태피스트리, 일본 카와이, 새로운 K-ON! 방 장식 미적 만화 사진 배경 천 테이블 ',5559,'애니메이션 벽걸이 태피스트리, 일본 카와이, 새로운 K-ON! 방 장식 미적 만화 사진 배경 천 테이블 .jpg','애니메이션 벽걸이 태피스트리, 일본 카와이, 새로운 K-ON! 방 장식 미적 만화 사진 배경 천 테이블 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','거실 침실용 사이키델릭 강 태피스트리 벽걸이 장식, 해변 풍경, 보헤미안 INS 프린트 ',20187,'거실 침실용 사이키델릭 강 태피스트리 벽걸이 장식, 해변 풍경, 보헤미안 INS 프린트 .jpg','거실 침실용 사이키델릭 강 태피스트리 벽걸이 장식, 해변 풍경, 보헤미안 INS 프린트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','일본 귀여운 방 장식 태피스트리 벽걸이, 십대 인디 침실 벽 장식 포스터, 애니메이션 타로 태피스트리 마녀 장식 ',3541,'일본 귀여운 방 장식 태피스트리 벽걸이, 십대 인디 침실 벽 장식 포스터, 애니메이션 타로 태피스트리 마녀 장식 .jpg','일본 귀여운 방 장식 태피스트리 벽걸이, 십대 인디 침실 벽 장식 포스터, 애니메이션 타로 태피스트리 마녀 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','XXDeco 귀여운 애니메이션 태피스트리 네코파라 프린트, 귀여운 벽걸이 방 장식, 대형 패브릭, 기숙사 배경 천, 소파 담요 ',1263,'XXDeco 귀여운 애니메이션 태피스트리 네코파라 프린트, 귀여운 벽걸이 방 장식, 대형 패브릭, 기숙사 배경 천, 소파 담요 .jpg','XXDeco 귀여운 애니메이션 태피스트리 네코파라 프린트, 귀여운 벽걸이 방 장식, 대형 패브릭, 기숙사 배경 천, 소파 담요 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','Boothill 태피스트리 장식 담요, 아트 침실 룸 여행 거실 매트, 벽 컬러 요가 아름다운 인쇄 침대보 장식 ',3607,'Boothill 태피스트리 장식 담요, 아트 침실 룸 여행 거실 매트, 벽 컬러 요가 아름다운 인쇄 침대보 장식 .jpg','Boothill 태피스트리 장식 담요, 아트 침실 룸 여행 거실 매트, 벽 컬러 요가 아름다운 인쇄 침대보 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','카와이 산리오 헬로 키티 만화 태피스트리 벽걸이 히피 폴리에스터 태피스트리, 보헤미안 벽 담요, 벽 장식 요가 매트 ',4903,'카와이 산리오 헬로 키티 만화 태피스트리 벽걸이 히피 폴리에스터 태피스트리, 보헤미안 벽 담요, 벽 장식 요가 매트 .jpg','카와이 산리오 헬로 키티 만화 태피스트리 벽걸이 히피 폴리에스터 태피스트리, 보헤미안 벽 담요, 벽 장식 요가 매트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','나의 습지 탈출 태피스트리 슈렉 핑크 태피스트리, 재미있는 밈 태피스트리, 벽걸이 아트 포스터, 침실 거실 장식 ',9068,'나의 습지 탈출 태피스트리 슈렉 핑크 태피스트리, 재미있는 밈 태피스트리, 벽걸이 아트 포스터, 침실 거실 장식 .jpg','나의 습지 탈출 태피스트리 슈렉 핑크 태피스트리, 재미있는 밈 태피스트리, 벽걸이 아트 포스터, 침실 거실 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','빈티지 포스터 태피스트리 꽃무늬 및 동물 그림, 홈 데코레이션용 대형 패브릭, 벽걸이 배경 천 ',420,'빈티지 포스터 태피스트리 꽃무늬 및 동물 그림, 홈 데코레이션용 대형 패브릭, 벽걸이 배경 천 .jpg','빈티지 포스터 태피스트리 꽃무늬 및 동물 그림, 홈 데코레이션용 대형 패브릭, 벽걸이 배경 천 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','Mclovin-Id 플래그 인조 운전 면허증 플래그 태피스트리 벽걸이 침실 카펫 침대 시트, 재미있는 기숙사 방 벽 장식 태피스트리 ',2609,'Mclovin-Id 플래그 인조 운전 면허증 플래그 태피스트리 벽걸이 침실 카펫 침대 시트, 재미있는 기숙사 방 벽 장식 태피스트리 .jpg','Mclovin-Id 플래그 인조 운전 면허증 플래그 태피스트리 벽걸이 침실 카펫 침대 시트, 재미있는 기숙사 방 벽 장식 태피스트리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','3 D 디지털 프린트 가정용 태피스트리, 아름다운 풍경 디자인 ',5276,'3 D 디지털 프린트 가정용 태피스트리, 아름다운 풍경 디자인 .jpg','3 D 디지털 프린트 가정용 태피스트리, 아름다운 풍경 디자인 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','월터 화이트 브레이킹 배드 태피스트리 벽걸이, 히피 폴리에스터 태피스트리, INS 던지기 러그 담요, 기숙사 장식 Y, 90x150cm ',420,'월터 화이트 브레이킹 배드 태피스트리 벽걸이, 히피 폴리에스터 태피스트리, INS 던지기 러그 담요, 기숙사 장식 Y, 90x150cm .jpg','월터 화이트 브레이킹 배드 태피스트리 벽걸이, 히피 폴리에스터 태피스트리, INS 던지기 러그 담요, 기숙사 장식 Y, 90x150cm .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','Lil Peep 태피스트리 벽걸이 스카이 아트 태피스트리 담요, 블랙 히피 요술 태피스트리 미적 방 장식 ',1263,'Lil Peep 태피스트리 벽걸이 스카이 아트 태피스트리 담요, 블랙 히피 요술 태피스트리 미적 방 장식 .jpg','Lil Peep 태피스트리 벽걸이 스카이 아트 태피스트리 담요, 블랙 히피 요술 태피스트리 미적 방 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','바다 물결 빛 예술 태피스트리 방 장식 벽걸이 천, 사이키델릭 히피 기숙사 거실 벽 장식 태피스트리 ',1397,'바다 물결 빛 예술 태피스트리 방 장식 벽걸이 천, 사이키델릭 히피 기숙사 거실 벽 장식 태피스트리 .jpg','바다 물결 빛 예술 태피스트리 방 장식 벽걸이 천, 사이키델릭 히피 기숙사 거실 벽 장식 태피스트리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','소녀용 오버도즈 태피스트리 차트 태피스트리, 거실 홈 기숙사 장식, 예술 홈 장식 ',2497,'소녀용 오버도즈 태피스트리 차트 태피스트리, 거실 홈 기숙사 장식, 예술 홈 장식 .jpg','소녀용 오버도즈 태피스트리 차트 태피스트리, 거실 홈 기숙사 장식, 예술 홈 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','버팔로 66 영화 태피스트리 침실 장식, 미적인 집 장식 ',15593,'버팔로 66 영화 태피스트리 침실 장식, 미적인 집 장식 .jpg','버팔로 66 영화 태피스트리 침실 장식, 미적인 집 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','일본 작은 벽 태피스트리 장식 배경 천 태피스트리, 만화 곰 벽걸이 천, 침실 배경 장식 ',2370,'일본 작은 벽 태피스트리 장식 배경 천 태피스트리, 만화 곰 벽걸이 천, 침실 배경 장식 .jpg','일본 작은 벽 태피스트리 장식 배경 천 태피스트리, 만화 곰 벽걸이 천, 침실 배경 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','썬 문 고양이 태피스트리 벽걸이 타로, 레트로 블랙 화이트 고양이 사이키델릭 러브 스타, 거실 홈 기숙사 장식 천 선물 ',6390,'썬 문 고양이 태피스트리 벽걸이 타로, 레트로 블랙 화이트 고양이 사이키델릭 러브 스타, 거실 홈 기숙사 장식 천 선물 .jpg','썬 문 고양이 태피스트리 벽걸이 타로, 레트로 블랙 화이트 고양이 사이키델릭 러브 스타, 거실 홈 기숙사 장식 천 선물 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','산리오 카와이 헬로 키티 애니메이션 태피스트리, 히피 폴리에스터 벽걸이 방 장식, 비치 매트, 만달라 태피스트리 ',0,'산리오 카와이 헬로 키티 애니메이션 태피스트리, 히피 폴리에스터 벽걸이 방 장식, 비치 매트, 만달라 태피스트리 .jpg','산리오 카와이 헬로 키티 애니메이션 태피스트리, 히피 폴리에스터 벽걸이 방 장식, 비치 매트, 만달라 태피스트리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','마지막 만찬 태피스트리 그리스도 부활 예수 벽 방 장식 크리스마스 장식, 대형 원단 DA VINCI 마지막 만찬 ',7324,'마지막 만찬 태피스트리 그리스도 부활 예수 벽 방 장식 크리스마스 장식, 대형 원단 DA VINCI 마지막 만찬 .jpg','마지막 만찬 태피스트리 그리스도 부활 예수 벽 방 장식 크리스마스 장식, 대형 원단 DA VINCI 마지막 만찬 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','프랑스 모네 수련 유화 홈 아트 태피스트리, 사이키델릭 장면 보헤미안 장식 요가 매트 소파 담요 침대 시트 ',5219,'프랑스 모네 수련 유화 홈 아트 태피스트리, 사이키델릭 장면 보헤미안 장식 요가 매트 소파 담요 침대 시트 .jpg','프랑스 모네 수련 유화 홈 아트 태피스트리, 사이키델릭 장면 보헤미안 장식 요가 매트 소파 담요 침대 시트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','만화 헬로 키티 태피스트리 침실 배경 천 포스터 벽걸이 벽 러그, 기숙사 장식 담요, 소녀 선물 ',14236,'만화 헬로 키티 태피스트리 침실 배경 천 포스터 벽걸이 벽 러그, 기숙사 장식 담요, 소녀 선물 .jpg','만화 헬로 키티 태피스트리 침실 배경 천 포스터 벽걸이 벽 러그, 기숙사 장식 담요, 소녀 선물 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','귀여운 홈 데코 벽걸이 태피스트리, 애니메이션 핑크 소녀 태피스트리, 침실 배경 장식, 귀여운 패션 레이디 태피스트리 ',28045,'귀여운 홈 데코 벽걸이 태피스트리, 애니메이션 핑크 소녀 태피스트리, 침실 배경 장식, 귀여운 패션 레이디 태피스트리 .jpg','귀여운 홈 데코 벽걸이 태피스트리, 애니메이션 핑크 소녀 태피스트리, 침실 배경 장식, 귀여운 패션 레이디 태피스트리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','귀여운 애니메이션 소녀 태피스트리 벽걸이 핑크, 귀여운 만화 스타일, 사이키델릭 히피 배경, 집 장식 ',23277,'귀여운 애니메이션 소녀 태피스트리 벽걸이 핑크, 귀여운 만화 스타일, 사이키델릭 히피 배경, 집 장식 .jpg','귀여운 애니메이션 소녀 태피스트리 벽걸이 핑크, 귀여운 만화 스타일, 사이키델릭 히피 배경, 집 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','헬로 키티 태피스트리 만화 벽걸이, 침실 태피스트리 포스터 담요, 대학 기숙사, 여성용 집 장식 ',9634,'헬로 키티 태피스트리 만화 벽걸이, 침실 태피스트리 포스터 담요, 대학 기숙사, 여성용 집 장식 .jpg','헬로 키티 태피스트리 만화 벽걸이, 침실 태피스트리 포스터 담요, 대학 기숙사, 여성용 집 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','히피 만달라 태피스트리, 인도 보헤미안 사이키델릭 침구 장식, 미적 빈티지 벽 태피스트리 아트 태피스트리 ',9252,'히피 만달라 태피스트리, 인도 보헤미안 사이키델릭 침구 장식, 미적 빈티지 벽 태피스트리 아트 태피스트리 .jpg','히피 만달라 태피스트리, 인도 보헤미안 사이키델릭 침구 장식, 미적 빈티지 벽 태피스트리 아트 태피스트리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','히피 만다라 태양과 달 인공 포스터 태피스트리 벽걸이-인도 골드 버닝 태양 스타 사이키델릭 팝 신비한 해변 ',4288,'히피 만다라 태양과 달 인공 포스터 태피스트리 벽걸이-인도 골드 버닝 태양 스타 사이키델릭 팝 신비한 해변 .jpg','히피 만다라 태양과 달 인공 포스터 태피스트리 벽걸이-인도 골드 버닝 태양 스타 사이키델릭 팝 신비한 해변 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','Aertemisi Chappell Roan 중서부의 공주 태피스트리 벽걸이 예술, 침실 거실 장식, 대학 ',11850,'Aertemisi Chappell Roan 중서부의 공주 태피스트리 벽걸이 예술, 침실 거실 장식, 대학 .jpg','Aertemisi Chappell Roan 중서부의 공주 태피스트리 벽걸이 예술, 침실 거실 장식, 대학 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','재미있는 고양이 배경 장식 방 태피스트리, 벽 카펫, 사계절 장면, 90x150cm ',420,'재미있는 고양이 배경 장식 방 태피스트리, 벽 카펫, 사계절 장면, 90x150cm .jpg','재미있는 고양이 배경 장식 방 태피스트리, 벽 카펫, 사계절 장면, 90x150cm .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','아름다운 풍경과 달꿈 시리즈 벽걸이 벽화 포스터, 마크라메, 귀여운 방 장식 태피스트리, 십대 인디 침실 장식 ',9029,'아름다운 풍경과 달꿈 시리즈 벽걸이 벽화 포스터, 마크라메, 귀여운 방 장식 태피스트리, 십대 인디 침실 장식 .jpg','아름다운 풍경과 달꿈 시리즈 벽걸이 벽화 포스터, 마크라메, 귀여운 방 장식 태피스트리, 십대 인디 침실 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','Rilakkuma 태피스트리 차트 홈데코, 히피 보헤미안 장식, 점술 벽걸이 홈데코 ',2568,'Rilakkuma 태피스트리 차트 홈데코, 히피 보헤미안 장식, 점술 벽걸이 홈데코 .jpg','Rilakkuma 태피스트리 차트 홈데코, 히피 보헤미안 장식, 점술 벽걸이 홈데코 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','러닝 Deftones 금속 펑크 태피스트리, 히피 폴리에스터 벽걸이, 홈 데코, 비치 매트, 아트 태피스트리 ',5604,'러닝 Deftones 금속 펑크 태피스트리, 히피 폴리에스터 벽걸이, 홈 데코, 비치 매트, 아트 태피스트리 .jpg','러닝 Deftones 금속 펑크 태피스트리, 히피 폴리에스터 벽걸이, 홈 데코, 비치 매트, 아트 태피스트리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','애니메이션 오시 노 코 호시노 아이 태피스트리 차트 태피스트리, 거실 홈 기숙사 장식 아트 홈 데코 ',2497,'애니메이션 오시 노 코 호시노 아이 태피스트리 차트 태피스트리, 거실 홈 기숙사 장식 아트 홈 데코 .jpg','애니메이션 오시 노 코 호시노 아이 태피스트리 차트 태피스트리, 거실 홈 기숙사 장식 아트 홈 데코 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','일본 애니메이션 캐릭터 벽 태피스트리, 미적 방 장식, 히피 농구, 대형 패브릭, 침실, 가정 장식 ',5897,'일본 애니메이션 캐릭터 벽 태피스트리, 미적 방 장식, 히피 농구, 대형 패브릭, 침실, 가정 장식 .jpg','일본 애니메이션 캐릭터 벽 태피스트리, 미적 방 장식, 히피 농구, 대형 패브릭, 침실, 가정 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','보헤미안 히피 애니메이션 북유럽 태피스트리, 미적 비치 타올, 요가 매트, 추상 미니멀리스트 마티스 아트, 벽걸이 ',8677,'보헤미안 히피 애니메이션 북유럽 태피스트리, 미적 비치 타올, 요가 매트, 추상 미니멀리스트 마티스 아트, 벽걸이 .jpg','보헤미안 히피 애니메이션 북유럽 태피스트리, 미적 비치 타올, 요가 매트, 추상 미니멀리스트 마티스 아트, 벽걸이 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','맞춤형 태피스트리 자연 감압 트리트먼트 룸 장식 배너, 배경 깃발 야외 장식 ',1263,'맞춤형 태피스트리 자연 감압 트리트먼트 룸 장식 배너, 배경 깃발 야외 장식 .jpg','맞춤형 태피스트리 자연 감압 트리트먼트 룸 장식 배너, 배경 깃발 야외 장식 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','빈티지 태피스트리 꽃 그림 태피스트리 홈 미학 장식, 침실 거실 기숙사 벽걸이 ',3926,'빈티지 태피스트리 꽃 그림 태피스트리 홈 미학 장식, 침실 거실 기숙사 벽걸이 .jpg','빈티지 태피스트리 꽃 그림 태피스트리 홈 미학 장식, 침실 거실 기숙사 벽걸이 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'3','산리오 헬로 키티 태피스트리 귀여운 배경, 귀여운 애니메이션 태피스트리, 방 장식, 소녀 기숙사 벽걸이 태피스트리 ',14521,'산리오 헬로 키티 태피스트리 귀여운 배경, 귀여운 애니메이션 태피스트리, 방 장식, 소녀 기숙사 벽걸이 태피스트리 .jpg','산리오 헬로 키티 태피스트리 귀여운 배경, 귀여운 애니메이션 태피스트리, 방 장식, 소녀 기숙사 벽걸이 태피스트리 .jpg'); 

-- 아동잡화
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 인쇄 도트 보우 헤어 액세서리, 수제 보우 클립 헤어 핀, 귀여운 어린이 액세서리, 2 개',0,'여아용 귀여운 인쇄 도트 보우 헤어 액세서리, 수제 보우 클립 헤어 핀, 귀여운 어린이 액세서리, 2 개.jpg','여아용 귀여운 인쇄 도트 보우 헤어 액세서리, 수제 보우 클립 헤어 핀, 귀여운 어린이 액세서리, 2 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 머리 리본 아기 소녀 머리띠, 신생아 레이스 탄성 머리띠, 어린이 터번 아기 헤어 액세서리, 1 개',1623,'귀여운 머리 리본 아기 소녀 머리띠, 신생아 레이스 탄성 머리띠, 어린이 터번 아기 헤어 액세서리, 1 개.jpg','귀여운 머리 리본 아기 소녀 머리띠, 신생아 레이스 탄성 머리띠, 어린이 터번 아기 헤어 액세서리, 1 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','할로윈 아기 머리핀, 해골 유령 소녀 머리핀, 어린이 만화 바레트, 어린이 헤어 액세서리, 축제 선물',0,'할로윈 아기 머리핀, 해골 유령 소녀 머리핀, 어린이 만화 바레트, 어린이 헤어 액세서리, 축제 선물.jpg','할로윈 아기 머리핀, 해골 유령 소녀 머리핀, 어린이 만화 바레트, 어린이 헤어 액세서리, 축제 선물.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 더블 나비 헤어 클립, 나비 머리핀, DIY 헤드웨어 활 장식, 헤어 그립, 어린이 헤어 액세서리, 2 개',0,'여아용 귀여운 더블 나비 헤어 클립, 나비 머리핀, DIY 헤드웨어 활 장식, 헤어 그립, 어린이 헤어 액세서리, 2 개.jpg','여아용 귀여운 더블 나비 헤어 클립, 나비 머리핀, DIY 헤드웨어 활 장식, 헤어 그립, 어린이 헤어 액세서리, 2 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','활 클립 귀여운 리본 나비 매듭 머리핀, 어린이 머리 장식 원사 활, 귀여운 머리핀 바레트, 어린이 머리 장식 액세서리',0,'활 클립 귀여운 리본 나비 매듭 머리핀, 어린이 머리 장식 원사 활, 귀여운 머리핀 바레트, 어린이 머리 장식 액세서리.jpg','활 클립 귀여운 리본 나비 매듭 머리핀, 어린이 머리 장식 원사 활, 귀여운 머리핀 바레트, 어린이 머리 장식 액세서리.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아기 소녀 헤어 밴드 꽃 활 토끼 곰 아이 헤어 액세서리, 용수철 어린이 탄성 헤어 밴드, 귀여운 공주 헤어 타이, 10 개',3273,'아기 소녀 헤어 밴드 꽃 활 토끼 곰 아이 헤어 액세서리, 용수철 어린이 탄성 헤어 밴드, 귀여운 공주 헤어 타이, 10 개.jpg','아기 소녀 헤어 밴드 꽃 활 토끼 곰 아이 헤어 액세서리, 용수철 어린이 탄성 헤어 밴드, 귀여운 공주 헤어 타이, 10 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 헤어 클립, 양모 뜨게 모자, 수제 크로셰, 작은 퍼프 꽃, 안전한 어린이 머리핀, 어린이 액세서리, 세트당 2 개',1481,'여아용 헤어 클립, 양모 뜨게 모자, 수제 크로셰, 작은 퍼프 꽃, 안전한 어린이 머리핀, 어린이 액세서리, 세트당 2 개.jpg','여아용 헤어 클립, 양모 뜨게 모자, 수제 크로셰, 작은 퍼프 꽃, 안전한 어린이 머리핀, 어린이 액세서리, 세트당 2 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 리본 리본 머리핀, 귀여운 단색 디자인 머리핀, 컬러 블록, 섬세한 헤어그립 바레트, 귀여운 어린이 액세서리, 4 개',0,'여아용 리본 리본 머리핀, 귀여운 단색 디자인 머리핀, 컬러 블록, 섬세한 헤어그립 바레트, 귀여운 어린이 액세서리, 4 개.jpg','여아용 리본 리본 머리핀, 귀여운 단색 디자인 머리핀, 컬러 블록, 섬세한 헤어그립 바레트, 귀여운 어린이 액세서리, 4 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 꽃 헤어 클립, 꽃 소녀 머리핀, 어린이 머리핀, 바레트 패션 머리핀, 아기 헤어 액세서리',1651,'여아용 귀여운 꽃 헤어 클립, 꽃 소녀 머리핀, 어린이 머리핀, 바레트 패션 머리핀, 아기 헤어 액세서리.jpg','여아용 귀여운 꽃 헤어 클립, 꽃 소녀 머리핀, 어린이 머리핀, 바레트 패션 머리핀, 아기 헤어 액세서리.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 귀여운 꽃 니트 봉제 어린이 바레트 모자, 헤어 액세서리, 하리 클립, 미적, 2 개, 3 개',0,'귀여운 귀여운 꽃 니트 봉제 어린이 바레트 모자, 헤어 액세서리, 하리 클립, 미적, 2 개, 3 개.jpg','귀여운 귀여운 꽃 니트 봉제 어린이 바레트 모자, 헤어 액세서리, 하리 클립, 미적, 2 개, 3 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 핑크 클립 컬렉션, 소녀 모양 머리핀, 패션 헤어 액세서리 선물 ',0,'귀여운 핑크 클립 컬렉션, 소녀 모양 머리핀, 패션 헤어 액세서리 선물 .jpg','귀여운 핑크 클립 컬렉션, 소녀 모양 머리핀, 패션 헤어 액세서리 선물 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아기 핑크 앞머리 헤어클립, 어린이 헤어 액세서리, 만화 달콤한 사탕 머리핀, 소녀 헤어그립, 어린이 모자 선물, 세트당 20 개 ',6190,'아기 핑크 앞머리 헤어클립, 어린이 헤어 액세서리, 만화 달콤한 사탕 머리핀, 소녀 헤어그립, 어린이 모자 선물, 세트당 20 개 .jpg','아기 핑크 앞머리 헤어클립, 어린이 헤어 액세서리, 만화 달콤한 사탕 머리핀, 소녀 헤어그립, 어린이 모자 선물, 세트당 20 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 신축성 헤어 밴드, 귀여운 아기 머리띠, 신생아 DIY 쥬얼리, 어린이 헤어 액세서리, 신제품 ',3245,'여아용 신축성 헤어 밴드, 귀여운 아기 머리띠, 신생아 DIY 쥬얼리, 어린이 헤어 액세서리, 신제품 .jpg','여아용 신축성 헤어 밴드, 귀여운 아기 머리띠, 신생아 DIY 쥬얼리, 어린이 헤어 액세서리, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아기 머리띠, 한국 신생아 머리띠, 여아 헤어 액세서리, 헤어 리본, 어린이 사진 촬영 액세서리 ',0,'아기 머리띠, 한국 신생아 머리띠, 여아 헤어 액세서리, 헤어 리본, 어린이 사진 촬영 액세서리 .jpg','아기 머리띠, 한국 신생아 머리띠, 여아 헤어 액세서리, 헤어 리본, 어린이 사진 촬영 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 나일론 활 머리띠, 귀여운 탄성 머리띠, 자수 꽃, 유아 헤어 액세서리 ',1496,'여아용 나일론 활 머리띠, 귀여운 탄성 머리띠, 자수 꽃, 유아 헤어 액세서리 .jpg','여아용 나일론 활 머리띠, 귀여운 탄성 머리띠, 자수 꽃, 유아 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 곰 어린이 헤어 클립, 2024 한국 스타일, 아기 소녀 헤어 클립, 유아 활 머리띠, 아이 헤어 액세서리, 새로운 패션, 2 개 ',931,'귀여운 곰 어린이 헤어 클립, 2024 한국 스타일, 아기 소녀 헤어 클립, 유아 활 머리띠, 아이 헤어 액세서리, 새로운 패션, 2 개 .jpg','귀여운 곰 어린이 헤어 클립, 2024 한국 스타일, 아기 소녀 헤어 클립, 유아 활 머리띠, 아이 헤어 액세서리, 새로운 패션, 2 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 사랑스러운 반짝이 머리띠, 리본 헤어후프, 정교한 모조 진주, 활 머리 장식, 어린이 헤어 액세서리, 도매 ',0,'여아용 사랑스러운 반짝이 머리띠, 리본 헤어후프, 정교한 모조 진주, 활 머리 장식, 어린이 헤어 액세서리, 도매 .jpg','여아용 사랑스러운 반짝이 머리띠, 리본 헤어후프, 정교한 모조 진주, 활 머리 장식, 어린이 헤어 액세서리, 도매 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','솔리드 컬러 어린이 모자 소녀 소년 가을 겨울 아기 비니 키즈 모자, 탄성 따뜻한 니트 어린이 모자 액세서리 1-10 세 ',3992,'솔리드 컬러 어린이 모자 소녀 소년 가을 겨울 아기 비니 키즈 모자, 탄성 따뜻한 니트 어린이 모자 액세서리 1-10 세 .jpg','솔리드 컬러 어린이 모자 소녀 소년 가을 겨울 아기 비니 키즈 모자, 탄성 따뜻한 니트 어린이 모자 액세서리 1-10 세 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 소녀용 귀여운 거즈 꽃 나비 매듭 헤어 클립, 수제 머리핀, 부티크 바레트, 어린이 모자, 어린이 헤어 액세서리 ',0,'귀여운 소녀용 귀여운 거즈 꽃 나비 매듭 헤어 클립, 수제 머리핀, 부티크 바레트, 어린이 모자, 어린이 헤어 액세서리 .jpg','귀여운 소녀용 귀여운 거즈 꽃 나비 매듭 헤어 클립, 수제 머리핀, 부티크 바레트, 어린이 모자, 어린이 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','10개/set 귀여운 컬러풀 스타 물방울 모양의 여자 아이용 헤어 클립 사랑스러운 머리 장식 아이들 머리 장신구 ',0,'10개/set 귀여운 컬러풀 스타 물방울 모양의 여자 아이용 헤어 클립 사랑스러운 머리 장식 아이들 머리 장신구 .jpg','10개/set 귀여운 컬러풀 스타 물방울 모양의 여자 아이용 헤어 클립 사랑스러운 머리 장식 아이들 머리 장신구 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','신생아용 꽃무늬 머리띠, 부드러운 신축성 헤어밴드, 어린이 꽃무늬 아기 헤어 액세서리 ',0,'신생아용 꽃무늬 머리띠, 부드러운 신축성 헤어밴드, 어린이 꽃무늬 아기 헤어 액세서리 .jpg','신생아용 꽃무늬 머리띠, 부드러운 신축성 헤어밴드, 어린이 꽃무늬 아기 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','유아용 신축성 부드러운 나일론 머리띠, 터번 동물 머리띠, 신생아 헤어 액세서리, 신제품 ',2327,'유아용 신축성 부드러운 나일론 머리띠, 터번 동물 머리띠, 신생아 헤어 액세서리, 신제품 .jpg','유아용 신축성 부드러운 나일론 머리띠, 터번 동물 머리띠, 신생아 헤어 액세서리, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','어린이용 헤어 밴드 액세서리, 아기 머리띠, 레이스 리본, 소녀 헤어 액세서리, 트렌디한 어린이 액세서리 ',0,'어린이용 헤어 밴드 액세서리, 아기 머리띠, 레이스 리본, 소녀 헤어 액세서리, 트렌디한 어린이 액세서리 .jpg','어린이용 헤어 밴드 액세서리, 아기 머리띠, 레이스 리본, 소녀 헤어 액세서리, 트렌디한 어린이 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 활 머리띠, 공주 머리띠, 컬러풀한 가발, 헤어 클립, 머리띠, 브레이드 백 투 스쿨 액세서리 ',0,'여아용 활 머리띠, 공주 머리띠, 컬러풀한 가발, 헤어 클립, 머리띠, 브레이드 백 투 스쿨 액세서리 .jpg','여아용 활 머리띠, 공주 머리띠, 컬러풀한 가발, 헤어 클립, 머리띠, 브레이드 백 투 스쿨 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 다채로운 일회용 고무 밴드, 탄성 헤어 밴드, 포니테일 거치대 밴드, 어린이 액세서리, 500 개 ',1250,'여아용 다채로운 일회용 고무 밴드, 탄성 헤어 밴드, 포니테일 거치대 밴드, 어린이 액세서리, 500 개 .jpg','여아용 다채로운 일회용 고무 밴드, 탄성 헤어 밴드, 포니테일 거치대 밴드, 어린이 액세서리, 500 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','어린이 머리핀 스냅 클립 머리핀 다섯개 별/하트 머리핀 소녀를위한 패션 헤어 액세서리 사이드 클립 ',0,'어린이 머리핀 스냅 클립 머리핀 다섯개 별/하트 머리핀 소녀를위한 패션 헤어 액세서리 사이드 클립 .jpg','어린이 머리핀 스냅 클립 머리핀 다섯개 별/하트 머리핀 소녀를위한 패션 헤어 액세서리 사이드 클립 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여성용 매트 투명 나비 헤어 클로 클립, 귀엽고 시크한 우아한 소녀 헤어 클로 클립, 어린이 머리 장식 헤어 액세서리 ',0,'여성용 매트 투명 나비 헤어 클로 클립, 귀엽고 시크한 우아한 소녀 헤어 클로 클립, 어린이 머리 장식 헤어 액세서리 .jpg','여성용 매트 투명 나비 헤어 클로 클립, 귀엽고 시크한 우아한 소녀 헤어 클로 클립, 어린이 머리 장식 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 레오파드 머리띠, 넓은 터번, 신축성 헤어밴드, 신생아 헤어 액세서리, 신제품 ',2920,'여아용 레오파드 머리띠, 넓은 터번, 신축성 헤어밴드, 신생아 헤어 액세서리, 신제품 .jpg','여아용 레오파드 머리띠, 넓은 터번, 신축성 헤어밴드, 신생아 헤어 액세서리, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','어린이용 신축성 프린트 머리띠, 히잡 꽃 아기 반다나, 모자, 신생아, 머리 스카프 액세서리, 성인 어머니 ',0,'어린이용 신축성 프린트 머리띠, 히잡 꽃 아기 반다나, 모자, 신생아, 머리 스카프 액세서리, 성인 어머니 .jpg','어린이용 신축성 프린트 머리띠, 히잡 꽃 아기 반다나, 모자, 신생아, 머리 스카프 액세서리, 성인 어머니 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여름 레이스 아기 머리띠, 꽃무늬 소녀 헤어 액세서리, 어린이 나일론 머리띠, 공주 터번, 신축성 있는 신생아 모자 ',4035,'여름 레이스 아기 머리띠, 꽃무늬 소녀 헤어 액세서리, 어린이 나일론 머리띠, 공주 터번, 신축성 있는 신생아 모자 .jpg','여름 레이스 아기 머리띠, 꽃무늬 소녀 헤어 액세서리, 어린이 나일론 머리띠, 공주 터번, 신축성 있는 신생아 모자 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 공주 헤어 클립, 만화 인어 반짝이 스팽글 헤어 핀, 활 모자, 어린이 헤어 액세서리, 1 개 ',0,'여아용 귀여운 공주 헤어 클립, 만화 인어 반짝이 스팽글 헤어 핀, 활 모자, 어린이 헤어 액세서리, 1 개 .jpg','여아용 귀여운 공주 헤어 클립, 만화 인어 반짝이 스팽글 헤어 핀, 활 모자, 어린이 헤어 액세서리, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','웃는 얼굴로 부드러운 니트 비니 모자, 어린이 머리 액세서리, 0-36 개월 어린이 모자, 가을 및 겨울 ',0,'웃는 얼굴로 부드러운 니트 비니 모자, 어린이 머리 액세서리, 0-36 개월 어린이 모자, 가을 및 겨울 .jpg','웃는 얼굴로 부드러운 니트 비니 모자, 어린이 머리 액세서리, 0-36 개월 어린이 모자, 가을 및 겨울 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 신생아 머리띠, 신축성 있는 니트 터번, 부드러운 나일론 리본, 어린이용 머리 장식, 아기 양말 포함, 헤어 액세서리 ',2493,'여아용 신생아 머리띠, 신축성 있는 니트 터번, 부드러운 나일론 리본, 어린이용 머리 장식, 아기 양말 포함, 헤어 액세서리 .jpg','여아용 신생아 머리띠, 신축성 있는 니트 터번, 부드러운 나일론 리본, 어린이용 머리 장식, 아기 양말 포함, 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','한국 패션 야외 태양 보호 모자, 여름 메쉬 얇은 바이저, 어린이 야구 모자, 소년 소녀 버킷, 어린이 액세서리 ',0,'한국 패션 야외 태양 보호 모자, 여름 메쉬 얇은 바이저, 어린이 야구 모자, 소년 소녀 버킷, 어린이 액세서리 .jpg','한국 패션 야외 태양 보호 모자, 여름 메쉬 얇은 바이저, 어린이 야구 모자, 소년 소녀 버킷, 어린이 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','영화 데드풀 3 성인 애니메이션 니트 모자, 어린이 만화 귀여운 니트 모자, 겨울 캐주얼 따뜻한 액세서리, 소년 소녀 생일 선물 ',0,'영화 데드풀 3 성인 애니메이션 니트 모자, 어린이 만화 귀여운 니트 모자, 겨울 캐주얼 따뜻한 액세서리, 소년 소녀 생일 선물 .jpg','영화 데드풀 3 성인 애니메이션 니트 모자, 어린이 만화 귀여운 니트 모자, 겨울 캐주얼 따뜻한 액세서리, 소년 소녀 생일 선물 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','어린이용 헤어 밴드, 여아용 만화 묶음, 작은 머리 머리띠, 탄성 아기 머리띠, 귀여운 동물 헤어 액세서리, 40 개, 60 개/몫 ',0,'어린이용 헤어 밴드, 여아용 만화 묶음, 작은 머리 머리띠, 탄성 아기 머리띠, 귀여운 동물 헤어 액세서리, 40 개, 60 개/몫 .jpg','어린이용 헤어 밴드, 여아용 만화 묶음, 작은 머리 머리띠, 탄성 아기 머리띠, 귀여운 동물 헤어 액세서리, 40 개, 60 개/몫 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 만화 작은 물고기 머리핀 어린이 한국 스타일, 달콤한 Y2k 소녀 다채로운 미니 헤어 클립, 헤어 액세서리, 3 개, 신제품 ',2453,'귀여운 만화 작은 물고기 머리핀 어린이 한국 스타일, 달콤한 Y2k 소녀 다채로운 미니 헤어 클립, 헤어 액세서리, 3 개, 신제품 .jpg','귀여운 만화 작은 물고기 머리핀 어린이 한국 스타일, 달콤한 Y2k 소녀 다채로운 미니 헤어 클립, 헤어 액세서리, 3 개, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 어린이 레이스 유아 진주 탄성 머리띠 머리띠, 헤어 액세서리 머리띠 ',0,'귀여운 어린이 레이스 유아 진주 탄성 머리띠 머리띠, 헤어 액세서리 머리띠 .jpg','귀여운 어린이 레이스 유아 진주 탄성 머리띠 머리띠, 헤어 액세서리 머리띠 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 헤어 클립, 귀여운 만화 머리핀, 머리 장식, 어린이 헤어웨어, 유아 생일 선물, 헤어 액세서리, 2 개 ',2440,'여아용 헤어 클립, 귀여운 만화 머리핀, 머리 장식, 어린이 헤어웨어, 유아 생일 선물, 헤어 액세서리, 2 개 .jpg','여아용 헤어 클립, 귀여운 만화 머리핀, 머리 장식, 어린이 헤어웨어, 유아 생일 선물, 헤어 액세서리, 2 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','신생아 여아 남아 공주 봉제 양동이 모자 활 양털 드로스트링 프릴 따뜻한 소프트 캡, 0-6m 겨울 유아 액세서리 ',10293,'신생아 여아 남아 공주 봉제 양동이 모자 활 양털 드로스트링 프릴 따뜻한 소프트 캡, 0-6m 겨울 유아 액세서리 .jpg','신생아 여아 남아 공주 봉제 양동이 모자 활 양털 드로스트링 프릴 따뜻한 소프트 캡, 0-6m 겨울 유아 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','어린이 모자 메쉬 어부 모자, 노란색 모자, 어린이 햇빛가리개, 아기 태양 모자, 신생아 사진 소품, 아기 액세서리 ',4153,'어린이 모자 메쉬 어부 모자, 노란색 모자, 어린이 햇빛가리개, 아기 태양 모자, 신생아 사진 소품, 아기 액세서리 .jpg','어린이 모자 메쉬 어부 모자, 노란색 모자, 어린이 햇빛가리개, 아기 태양 모자, 신생아 사진 소품, 아기 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','신생아용 부드러운 나일론 머리띠, 신축성 있는 꽃 단색 머리띠, 여아 헤어 액세서리 ',0,'신생아용 부드러운 나일론 머리띠, 신축성 있는 꽃 단색 머리띠, 여아 헤어 액세서리 .jpg','신생아용 부드러운 나일론 머리띠, 신축성 있는 꽃 단색 머리띠, 여아 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','한국어 버전 어린이 해바라기 머리핀, 여아 수제 꽃 헤어 클립, 귀여운 천 아트 앞머리 헤어 액세서리 ',0,'한국어 버전 어린이 해바라기 머리핀, 여아 수제 꽃 헤어 클립, 귀여운 천 아트 앞머리 헤어 액세서리 .jpg','한국어 버전 어린이 해바라기 머리핀, 여아 수제 꽃 헤어 클립, 귀여운 천 아트 앞머리 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아동용 PU 가죽 나비 헤어클립, 귀여운 소녀 헤어핀 헤어그립, 귀여운 헤어 액세서리, 도매 ',0,'아동용 PU 가죽 나비 헤어클립, 귀여운 소녀 헤어핀 헤어그립, 귀여운 헤어 액세서리, 도매 .jpg','아동용 PU 가죽 나비 헤어클립, 귀여운 소녀 헤어핀 헤어그립, 귀여운 헤어 액세서리, 도매 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아기 모자 귀 보호 모자, 3-6 개월 아기 따뜻한 모자, 여아 아기 모자, 신생아 액세서리 ',0,'아기 모자 귀 보호 모자, 3-6 개월 아기 따뜻한 모자, 여아 아기 모자, 신생아 액세서리 .jpg','아기 모자 귀 보호 모자, 3-6 개월 아기 따뜻한 모자, 여아 아기 모자, 신생아 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아기 소녀 공주 레이스 리본 활, 어린이 로리타 모자, 상단 클립 머리핀, 머리 원피스 파티, 결혼식 생일, 아기 액세서리 ',14924,'아기 소녀 공주 레이스 리본 활, 어린이 로리타 모자, 상단 클립 머리핀, 머리 원피스 파티, 결혼식 생일, 아기 액세서리 .jpg','아기 소녀 공주 레이스 리본 활, 어린이 로리타 모자, 상단 클립 머리핀, 머리 원피스 파티, 결혼식 생일, 아기 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','헤어 붕대 밴드, 나비 터번, 어린이 신생아, 어린이 모자, 아기 소녀 액세서리, 꽃 꽃, 부드러운 고체 탄성 ',4218,'헤어 붕대 밴드, 나비 터번, 어린이 신생아, 어린이 모자, 아기 소녀 액세서리, 꽃 꽃, 부드러운 고체 탄성 .jpg','헤어 붕대 밴드, 나비 터번, 어린이 신생아, 어린이 모자, 아기 소녀 액세서리, 꽃 꽃, 부드러운 고체 탄성 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','할로윈 호박 유령 캔디 헤어 활 클립, 할로윈 헤어 액세서리, 소녀 머리핀, 어린이 모자, 3.14 인치 ',0,'할로윈 호박 유령 캔디 헤어 활 클립, 할로윈 헤어 액세서리, 소녀 머리핀, 어린이 모자, 3.14 인치 .jpg','할로윈 호박 유령 캔디 헤어 활 클립, 할로윈 헤어 액세서리, 소녀 머리핀, 어린이 모자, 3.14 인치 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','부드러운 헤어 밴드 활 터번 머리띠 신생아용, 아기 소녀 액세서리, 꽃 단색, 귀여운 선물, 1 개 ',917,'부드러운 헤어 밴드 활 터번 머리띠 신생아용, 아기 소녀 액세서리, 꽃 단색, 귀여운 선물, 1 개 .jpg','부드러운 헤어 밴드 활 터번 머리띠 신생아용, 아기 소녀 액세서리, 꽃 단색, 귀여운 선물, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 활 헤드기어 귀여운 소녀 헤어 액세서리, 여름 소녀 그물 레드 클립, 아기 머리핀, 어린이 헤어 클립 선물, 신제품 ',0,'귀여운 활 헤드기어 귀여운 소녀 헤어 액세서리, 여름 소녀 그물 레드 클립, 아기 머리핀, 어린이 헤어 클립 선물, 신제품 .jpg','귀여운 활 헤드기어 귀여운 소녀 헤어 액세서리, 여름 소녀 그물 레드 클립, 아기 머리핀, 어린이 헤어 클립 선물, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 스팽글 머리 장식, 인어 꼬리 머리띠, 공주 머리 클립, 어린이 머리 장식, 어린이 파티 머리핀 액세서리 ',2196,'여아용 스팽글 머리 장식, 인어 꼬리 머리띠, 공주 머리 클립, 어린이 머리 장식, 어린이 파티 머리핀 액세서리 .jpg','여아용 스팽글 머리 장식, 인어 꼬리 머리띠, 공주 머리 클립, 어린이 머리 장식, 어린이 파티 머리핀 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 수박 프린트 나비 매듭 헤어 클립, 사랑스러운 다채로운 머리핀, 머리 장식, 어린이 아기 헤어 액세서리, 3 개/세트 ',2243,'여아용 귀여운 수박 프린트 나비 매듭 헤어 클립, 사랑스러운 다채로운 머리핀, 머리 장식, 어린이 아기 헤어 액세서리, 3 개/세트 .jpg','여아용 귀여운 수박 프린트 나비 매듭 헤어 클립, 사랑스러운 다채로운 머리핀, 머리 장식, 어린이 아기 헤어 액세서리, 3 개/세트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','Xgnvpy 아기 모자, 귀 비니 모자, 신생아, 여아, 겨울 액세서리, 유아 모자 ',0,'Xgnvpy 아기 모자, 귀 비니 모자, 신생아, 여아, 겨울 액세서리, 유아 모자 .jpg','Xgnvpy 아기 모자, 귀 비니 모자, 신생아, 여아, 겨울 액세서리, 유아 모자 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 머리띠, 어린이 머리띠, 어린이 머리띠, 헤어 액세서리, 헤어 스크런치, 소녀 헤어 클립, 선물 ',973,'여아용 머리띠, 어린이 머리띠, 어린이 머리띠, 헤어 액세서리, 헤어 스크런치, 소녀 헤어 클립, 선물 .jpg','여아용 머리띠, 어린이 머리띠, 어린이 머리띠, 헤어 액세서리, 헤어 스크런치, 소녀 헤어 클립, 선물 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 체크 무늬 머리핀, 활 스타일 헤어 클립, 한국 스타일, 어린이 모자, 헤어 액세서리, 세트당 2 개 ',1723,'여아용 체크 무늬 머리핀, 활 스타일 헤어 클립, 한국 스타일, 어린이 모자, 헤어 액세서리, 세트당 2 개 .jpg','여아용 체크 무늬 머리핀, 활 스타일 헤어 클립, 한국 스타일, 어린이 모자, 헤어 액세서리, 세트당 2 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','한국 여아용 수제 코튼 리본 헤어 클립, 레이스 자카드, 꽃무늬 흰색, 귀여운 어린이 헤어 액세서리, 4 개 ',0,'한국 여아용 수제 코튼 리본 헤어 클립, 레이스 자카드, 꽃무늬 흰색, 귀여운 어린이 헤어 액세서리, 4 개 .jpg','한국 여아용 수제 코튼 리본 헤어 클립, 레이스 자카드, 꽃무늬 흰색, 귀여운 어린이 헤어 액세서리, 4 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 단색 헤어 클립, 벨벳 헤어 보우, 어린이 헤어 액세서리, 신생아 아기 소녀 머리핀 헤드웨어, 25 색 ',3005,'여아용 단색 헤어 클립, 벨벳 헤어 보우, 어린이 헤어 액세서리, 신생아 아기 소녀 머리핀 헤드웨어, 25 색 .jpg','여아용 단색 헤어 클립, 벨벳 헤어 보우, 어린이 헤어 액세서리, 신생아 아기 소녀 머리핀 헤드웨어, 25 색 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 탄성 헤어 밴드, 헤어 액세서리, 어린이 헤어 타이, 헤어 링, 헤드 로프, 어린이 만화 고무 밴드, 세트당 10 개 ',0,'여아용 탄성 헤어 밴드, 헤어 액세서리, 어린이 헤어 타이, 헤어 링, 헤드 로프, 어린이 만화 고무 밴드, 세트당 10 개 .jpg','여아용 탄성 헤어 밴드, 헤어 액세서리, 어린이 헤어 타이, 헤어 링, 헤드 로프, 어린이 만화 고무 밴드, 세트당 10 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 핑크 컬러 헤어 클립, 스위트 단색 격자 무늬 스타일, 어린이 헤어 핀, 여성용 헤드웨어, 헤어 액세서리, 세트당 2 개 ',2577,'여아용 핑크 컬러 헤어 클립, 스위트 단색 격자 무늬 스타일, 어린이 헤어 핀, 여성용 헤드웨어, 헤어 액세서리, 세트당 2 개 .jpg','여아용 핑크 컬러 헤어 클립, 스위트 단색 격자 무늬 스타일, 어린이 헤어 핀, 여성용 헤드웨어, 헤어 액세서리, 세트당 2 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 만화 헤어 밴드, 신축성 있는 아기 헤어 로프, 어린이 포니테일 거치대 밴드, 어린이 헤어 액세서리 ',2525,'여아용 귀여운 만화 헤어 밴드, 신축성 있는 아기 헤어 로프, 어린이 포니테일 거치대 밴드, 어린이 헤어 액세서리 .jpg','여아용 귀여운 만화 헤어 밴드, 신축성 있는 아기 헤어 로프, 어린이 포니테일 거치대 밴드, 어린이 헤어 액세서리 .jpg'); 

INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 인쇄 도트 보우 헤어 액세서리, 수제 보우 클립 헤어 핀, 귀여운 어린이 액세서리, 2 개',0,'여아용 귀여운 인쇄 도트 보우 헤어 액세서리, 수제 보우 클립 헤어 핀, 귀여운 어린이 액세서리, 2 개.jpg','여아용 귀여운 인쇄 도트 보우 헤어 액세서리, 수제 보우 클립 헤어 핀, 귀여운 어린이 액세서리, 2 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 머리 리본 아기 소녀 머리띠, 신생아 레이스 탄성 머리띠, 어린이 터번 아기 헤어 액세서리, 1 개',1623,'귀여운 머리 리본 아기 소녀 머리띠, 신생아 레이스 탄성 머리띠, 어린이 터번 아기 헤어 액세서리, 1 개.jpg','귀여운 머리 리본 아기 소녀 머리띠, 신생아 레이스 탄성 머리띠, 어린이 터번 아기 헤어 액세서리, 1 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','할로윈 아기 머리핀, 해골 유령 소녀 머리핀, 어린이 만화 바레트, 어린이 헤어 액세서리, 축제 선물',0,'할로윈 아기 머리핀, 해골 유령 소녀 머리핀, 어린이 만화 바레트, 어린이 헤어 액세서리, 축제 선물.jpg','할로윈 아기 머리핀, 해골 유령 소녀 머리핀, 어린이 만화 바레트, 어린이 헤어 액세서리, 축제 선물.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 더블 나비 헤어 클립, 나비 머리핀, DIY 헤드웨어 활 장식, 헤어 그립, 어린이 헤어 액세서리, 2 개',0,'여아용 귀여운 더블 나비 헤어 클립, 나비 머리핀, DIY 헤드웨어 활 장식, 헤어 그립, 어린이 헤어 액세서리, 2 개.jpg','여아용 귀여운 더블 나비 헤어 클립, 나비 머리핀, DIY 헤드웨어 활 장식, 헤어 그립, 어린이 헤어 액세서리, 2 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','활 클립 귀여운 리본 나비 매듭 머리핀, 어린이 머리 장식 원사 활, 귀여운 머리핀 바레트, 어린이 머리 장식 액세서리',0,'활 클립 귀여운 리본 나비 매듭 머리핀, 어린이 머리 장식 원사 활, 귀여운 머리핀 바레트, 어린이 머리 장식 액세서리.jpg','활 클립 귀여운 리본 나비 매듭 머리핀, 어린이 머리 장식 원사 활, 귀여운 머리핀 바레트, 어린이 머리 장식 액세서리.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아기 소녀 헤어 밴드 꽃 활 토끼 곰 아이 헤어 액세서리, 용수철 어린이 탄성 헤어 밴드, 귀여운 공주 헤어 타이, 10 개',3273,'아기 소녀 헤어 밴드 꽃 활 토끼 곰 아이 헤어 액세서리, 용수철 어린이 탄성 헤어 밴드, 귀여운 공주 헤어 타이, 10 개.jpg','아기 소녀 헤어 밴드 꽃 활 토끼 곰 아이 헤어 액세서리, 용수철 어린이 탄성 헤어 밴드, 귀여운 공주 헤어 타이, 10 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 헤어 클립, 양모 뜨게 모자, 수제 크로셰, 작은 퍼프 꽃, 안전한 어린이 머리핀, 어린이 액세서리, 세트당 2 개',1481,'여아용 헤어 클립, 양모 뜨게 모자, 수제 크로셰, 작은 퍼프 꽃, 안전한 어린이 머리핀, 어린이 액세서리, 세트당 2 개.jpg','여아용 헤어 클립, 양모 뜨게 모자, 수제 크로셰, 작은 퍼프 꽃, 안전한 어린이 머리핀, 어린이 액세서리, 세트당 2 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 리본 리본 머리핀, 귀여운 단색 디자인 머리핀, 컬러 블록, 섬세한 헤어그립 바레트, 귀여운 어린이 액세서리, 4 개',0,'여아용 리본 리본 머리핀, 귀여운 단색 디자인 머리핀, 컬러 블록, 섬세한 헤어그립 바레트, 귀여운 어린이 액세서리, 4 개.jpg','여아용 리본 리본 머리핀, 귀여운 단색 디자인 머리핀, 컬러 블록, 섬세한 헤어그립 바레트, 귀여운 어린이 액세서리, 4 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 꽃 헤어 클립, 꽃 소녀 머리핀, 어린이 머리핀, 바레트 패션 머리핀, 아기 헤어 액세서리',1651,'여아용 귀여운 꽃 헤어 클립, 꽃 소녀 머리핀, 어린이 머리핀, 바레트 패션 머리핀, 아기 헤어 액세서리.jpg','여아용 귀여운 꽃 헤어 클립, 꽃 소녀 머리핀, 어린이 머리핀, 바레트 패션 머리핀, 아기 헤어 액세서리.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 귀여운 꽃 니트 봉제 어린이 바레트 모자, 헤어 액세서리, 하리 클립, 미적, 2 개, 3 개',0,'귀여운 귀여운 꽃 니트 봉제 어린이 바레트 모자, 헤어 액세서리, 하리 클립, 미적, 2 개, 3 개.jpg','귀여운 귀여운 꽃 니트 봉제 어린이 바레트 모자, 헤어 액세서리, 하리 클립, 미적, 2 개, 3 개.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 핑크 클립 컬렉션, 소녀 모양 머리핀, 패션 헤어 액세서리 선물 ',0,'귀여운 핑크 클립 컬렉션, 소녀 모양 머리핀, 패션 헤어 액세서리 선물 .jpg','귀여운 핑크 클립 컬렉션, 소녀 모양 머리핀, 패션 헤어 액세서리 선물 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아기 핑크 앞머리 헤어클립, 어린이 헤어 액세서리, 만화 달콤한 사탕 머리핀, 소녀 헤어그립, 어린이 모자 선물, 세트당 20 개 ',6190,'아기 핑크 앞머리 헤어클립, 어린이 헤어 액세서리, 만화 달콤한 사탕 머리핀, 소녀 헤어그립, 어린이 모자 선물, 세트당 20 개 .jpg','아기 핑크 앞머리 헤어클립, 어린이 헤어 액세서리, 만화 달콤한 사탕 머리핀, 소녀 헤어그립, 어린이 모자 선물, 세트당 20 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 신축성 헤어 밴드, 귀여운 아기 머리띠, 신생아 DIY 쥬얼리, 어린이 헤어 액세서리, 신제품 ',3245,'여아용 신축성 헤어 밴드, 귀여운 아기 머리띠, 신생아 DIY 쥬얼리, 어린이 헤어 액세서리, 신제품 .jpg','여아용 신축성 헤어 밴드, 귀여운 아기 머리띠, 신생아 DIY 쥬얼리, 어린이 헤어 액세서리, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아기 머리띠, 한국 신생아 머리띠, 여아 헤어 액세서리, 헤어 리본, 어린이 사진 촬영 액세서리 ',0,'아기 머리띠, 한국 신생아 머리띠, 여아 헤어 액세서리, 헤어 리본, 어린이 사진 촬영 액세서리 .jpg','아기 머리띠, 한국 신생아 머리띠, 여아 헤어 액세서리, 헤어 리본, 어린이 사진 촬영 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 나일론 활 머리띠, 귀여운 탄성 머리띠, 자수 꽃, 유아 헤어 액세서리 ',1496,'여아용 나일론 활 머리띠, 귀여운 탄성 머리띠, 자수 꽃, 유아 헤어 액세서리 .jpg','여아용 나일론 활 머리띠, 귀여운 탄성 머리띠, 자수 꽃, 유아 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 곰 어린이 헤어 클립, 2024 한국 스타일, 아기 소녀 헤어 클립, 유아 활 머리띠, 아이 헤어 액세서리, 새로운 패션, 2 개 ',931,'귀여운 곰 어린이 헤어 클립, 2024 한국 스타일, 아기 소녀 헤어 클립, 유아 활 머리띠, 아이 헤어 액세서리, 새로운 패션, 2 개 .jpg','귀여운 곰 어린이 헤어 클립, 2024 한국 스타일, 아기 소녀 헤어 클립, 유아 활 머리띠, 아이 헤어 액세서리, 새로운 패션, 2 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 사랑스러운 반짝이 머리띠, 리본 헤어후프, 정교한 모조 진주, 활 머리 장식, 어린이 헤어 액세서리, 도매 ',0,'여아용 사랑스러운 반짝이 머리띠, 리본 헤어후프, 정교한 모조 진주, 활 머리 장식, 어린이 헤어 액세서리, 도매 .jpg','여아용 사랑스러운 반짝이 머리띠, 리본 헤어후프, 정교한 모조 진주, 활 머리 장식, 어린이 헤어 액세서리, 도매 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','솔리드 컬러 어린이 모자 소녀 소년 가을 겨울 아기 비니 키즈 모자, 탄성 따뜻한 니트 어린이 모자 액세서리 1-10 세 ',3992,'솔리드 컬러 어린이 모자 소녀 소년 가을 겨울 아기 비니 키즈 모자, 탄성 따뜻한 니트 어린이 모자 액세서리 1-10 세 .jpg','솔리드 컬러 어린이 모자 소녀 소년 가을 겨울 아기 비니 키즈 모자, 탄성 따뜻한 니트 어린이 모자 액세서리 1-10 세 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 소녀용 귀여운 거즈 꽃 나비 매듭 헤어 클립, 수제 머리핀, 부티크 바레트, 어린이 모자, 어린이 헤어 액세서리 ',0,'귀여운 소녀용 귀여운 거즈 꽃 나비 매듭 헤어 클립, 수제 머리핀, 부티크 바레트, 어린이 모자, 어린이 헤어 액세서리 .jpg','귀여운 소녀용 귀여운 거즈 꽃 나비 매듭 헤어 클립, 수제 머리핀, 부티크 바레트, 어린이 모자, 어린이 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','10개/set 귀여운 컬러풀 스타 물방울 모양의 여자 아이용 헤어 클립 사랑스러운 머리 장식 아이들 머리 장신구 ',0,'10개/set 귀여운 컬러풀 스타 물방울 모양의 여자 아이용 헤어 클립 사랑스러운 머리 장식 아이들 머리 장신구 .jpg','10개/set 귀여운 컬러풀 스타 물방울 모양의 여자 아이용 헤어 클립 사랑스러운 머리 장식 아이들 머리 장신구 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','신생아용 꽃무늬 머리띠, 부드러운 신축성 헤어밴드, 어린이 꽃무늬 아기 헤어 액세서리 ',0,'신생아용 꽃무늬 머리띠, 부드러운 신축성 헤어밴드, 어린이 꽃무늬 아기 헤어 액세서리 .jpg','신생아용 꽃무늬 머리띠, 부드러운 신축성 헤어밴드, 어린이 꽃무늬 아기 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','유아용 신축성 부드러운 나일론 머리띠, 터번 동물 머리띠, 신생아 헤어 액세서리, 신제품 ',2327,'유아용 신축성 부드러운 나일론 머리띠, 터번 동물 머리띠, 신생아 헤어 액세서리, 신제품 .jpg','유아용 신축성 부드러운 나일론 머리띠, 터번 동물 머리띠, 신생아 헤어 액세서리, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','어린이용 헤어 밴드 액세서리, 아기 머리띠, 레이스 리본, 소녀 헤어 액세서리, 트렌디한 어린이 액세서리 ',0,'어린이용 헤어 밴드 액세서리, 아기 머리띠, 레이스 리본, 소녀 헤어 액세서리, 트렌디한 어린이 액세서리 .jpg','어린이용 헤어 밴드 액세서리, 아기 머리띠, 레이스 리본, 소녀 헤어 액세서리, 트렌디한 어린이 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 활 머리띠, 공주 머리띠, 컬러풀한 가발, 헤어 클립, 머리띠, 브레이드 백 투 스쿨 액세서리 ',0,'여아용 활 머리띠, 공주 머리띠, 컬러풀한 가발, 헤어 클립, 머리띠, 브레이드 백 투 스쿨 액세서리 .jpg','여아용 활 머리띠, 공주 머리띠, 컬러풀한 가발, 헤어 클립, 머리띠, 브레이드 백 투 스쿨 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 다채로운 일회용 고무 밴드, 탄성 헤어 밴드, 포니테일 거치대 밴드, 어린이 액세서리, 500 개 ',1250,'여아용 다채로운 일회용 고무 밴드, 탄성 헤어 밴드, 포니테일 거치대 밴드, 어린이 액세서리, 500 개 .jpg','여아용 다채로운 일회용 고무 밴드, 탄성 헤어 밴드, 포니테일 거치대 밴드, 어린이 액세서리, 500 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','어린이 머리핀 스냅 클립 머리핀 다섯개 별/하트 머리핀 소녀를위한 패션 헤어 액세서리 사이드 클립 ',0,'어린이 머리핀 스냅 클립 머리핀 다섯개 별/하트 머리핀 소녀를위한 패션 헤어 액세서리 사이드 클립 .jpg','어린이 머리핀 스냅 클립 머리핀 다섯개 별/하트 머리핀 소녀를위한 패션 헤어 액세서리 사이드 클립 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여성용 매트 투명 나비 헤어 클로 클립, 귀엽고 시크한 우아한 소녀 헤어 클로 클립, 어린이 머리 장식 헤어 액세서리 ',0,'여성용 매트 투명 나비 헤어 클로 클립, 귀엽고 시크한 우아한 소녀 헤어 클로 클립, 어린이 머리 장식 헤어 액세서리 .jpg','여성용 매트 투명 나비 헤어 클로 클립, 귀엽고 시크한 우아한 소녀 헤어 클로 클립, 어린이 머리 장식 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 레오파드 머리띠, 넓은 터번, 신축성 헤어밴드, 신생아 헤어 액세서리, 신제품 ',2920,'여아용 레오파드 머리띠, 넓은 터번, 신축성 헤어밴드, 신생아 헤어 액세서리, 신제품 .jpg','여아용 레오파드 머리띠, 넓은 터번, 신축성 헤어밴드, 신생아 헤어 액세서리, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','어린이용 신축성 프린트 머리띠, 히잡 꽃 아기 반다나, 모자, 신생아, 머리 스카프 액세서리, 성인 어머니 ',0,'어린이용 신축성 프린트 머리띠, 히잡 꽃 아기 반다나, 모자, 신생아, 머리 스카프 액세서리, 성인 어머니 .jpg','어린이용 신축성 프린트 머리띠, 히잡 꽃 아기 반다나, 모자, 신생아, 머리 스카프 액세서리, 성인 어머니 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여름 레이스 아기 머리띠, 꽃무늬 소녀 헤어 액세서리, 어린이 나일론 머리띠, 공주 터번, 신축성 있는 신생아 모자 ',4035,'여름 레이스 아기 머리띠, 꽃무늬 소녀 헤어 액세서리, 어린이 나일론 머리띠, 공주 터번, 신축성 있는 신생아 모자 .jpg','여름 레이스 아기 머리띠, 꽃무늬 소녀 헤어 액세서리, 어린이 나일론 머리띠, 공주 터번, 신축성 있는 신생아 모자 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 공주 헤어 클립, 만화 인어 반짝이 스팽글 헤어 핀, 활 모자, 어린이 헤어 액세서리, 1 개 ',0,'여아용 귀여운 공주 헤어 클립, 만화 인어 반짝이 스팽글 헤어 핀, 활 모자, 어린이 헤어 액세서리, 1 개 .jpg','여아용 귀여운 공주 헤어 클립, 만화 인어 반짝이 스팽글 헤어 핀, 활 모자, 어린이 헤어 액세서리, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','웃는 얼굴로 부드러운 니트 비니 모자, 어린이 머리 액세서리, 0-36 개월 어린이 모자, 가을 및 겨울 ',0,'웃는 얼굴로 부드러운 니트 비니 모자, 어린이 머리 액세서리, 0-36 개월 어린이 모자, 가을 및 겨울 .jpg','웃는 얼굴로 부드러운 니트 비니 모자, 어린이 머리 액세서리, 0-36 개월 어린이 모자, 가을 및 겨울 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 신생아 머리띠, 신축성 있는 니트 터번, 부드러운 나일론 리본, 어린이용 머리 장식, 아기 양말 포함, 헤어 액세서리 ',2493,'여아용 신생아 머리띠, 신축성 있는 니트 터번, 부드러운 나일론 리본, 어린이용 머리 장식, 아기 양말 포함, 헤어 액세서리 .jpg','여아용 신생아 머리띠, 신축성 있는 니트 터번, 부드러운 나일론 리본, 어린이용 머리 장식, 아기 양말 포함, 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','한국 패션 야외 태양 보호 모자, 여름 메쉬 얇은 바이저, 어린이 야구 모자, 소년 소녀 버킷, 어린이 액세서리 ',0,'한국 패션 야외 태양 보호 모자, 여름 메쉬 얇은 바이저, 어린이 야구 모자, 소년 소녀 버킷, 어린이 액세서리 .jpg','한국 패션 야외 태양 보호 모자, 여름 메쉬 얇은 바이저, 어린이 야구 모자, 소년 소녀 버킷, 어린이 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','영화 데드풀 3 성인 애니메이션 니트 모자, 어린이 만화 귀여운 니트 모자, 겨울 캐주얼 따뜻한 액세서리, 소년 소녀 생일 선물 ',0,'영화 데드풀 3 성인 애니메이션 니트 모자, 어린이 만화 귀여운 니트 모자, 겨울 캐주얼 따뜻한 액세서리, 소년 소녀 생일 선물 .jpg','영화 데드풀 3 성인 애니메이션 니트 모자, 어린이 만화 귀여운 니트 모자, 겨울 캐주얼 따뜻한 액세서리, 소년 소녀 생일 선물 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','어린이용 헤어 밴드, 여아용 만화 묶음, 작은 머리 머리띠, 탄성 아기 머리띠, 귀여운 동물 헤어 액세서리, 40 개, 60 개/몫 ',0,'어린이용 헤어 밴드, 여아용 만화 묶음, 작은 머리 머리띠, 탄성 아기 머리띠, 귀여운 동물 헤어 액세서리, 40 개, 60 개/몫 .jpg','어린이용 헤어 밴드, 여아용 만화 묶음, 작은 머리 머리띠, 탄성 아기 머리띠, 귀여운 동물 헤어 액세서리, 40 개, 60 개/몫 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 만화 작은 물고기 머리핀 어린이 한국 스타일, 달콤한 Y2k 소녀 다채로운 미니 헤어 클립, 헤어 액세서리, 3 개, 신제품 ',2453,'귀여운 만화 작은 물고기 머리핀 어린이 한국 스타일, 달콤한 Y2k 소녀 다채로운 미니 헤어 클립, 헤어 액세서리, 3 개, 신제품 .jpg','귀여운 만화 작은 물고기 머리핀 어린이 한국 스타일, 달콤한 Y2k 소녀 다채로운 미니 헤어 클립, 헤어 액세서리, 3 개, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 어린이 레이스 유아 진주 탄성 머리띠 머리띠, 헤어 액세서리 머리띠 ',0,'귀여운 어린이 레이스 유아 진주 탄성 머리띠 머리띠, 헤어 액세서리 머리띠 .jpg','귀여운 어린이 레이스 유아 진주 탄성 머리띠 머리띠, 헤어 액세서리 머리띠 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 헤어 클립, 귀여운 만화 머리핀, 머리 장식, 어린이 헤어웨어, 유아 생일 선물, 헤어 액세서리, 2 개 ',2440,'여아용 헤어 클립, 귀여운 만화 머리핀, 머리 장식, 어린이 헤어웨어, 유아 생일 선물, 헤어 액세서리, 2 개 .jpg','여아용 헤어 클립, 귀여운 만화 머리핀, 머리 장식, 어린이 헤어웨어, 유아 생일 선물, 헤어 액세서리, 2 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','신생아 여아 남아 공주 봉제 양동이 모자 활 양털 드로스트링 프릴 따뜻한 소프트 캡, 0-6m 겨울 유아 액세서리 ',10293,'신생아 여아 남아 공주 봉제 양동이 모자 활 양털 드로스트링 프릴 따뜻한 소프트 캡, 0-6m 겨울 유아 액세서리 .jpg','신생아 여아 남아 공주 봉제 양동이 모자 활 양털 드로스트링 프릴 따뜻한 소프트 캡, 0-6m 겨울 유아 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','어린이 모자 메쉬 어부 모자, 노란색 모자, 어린이 햇빛가리개, 아기 태양 모자, 신생아 사진 소품, 아기 액세서리 ',4153,'어린이 모자 메쉬 어부 모자, 노란색 모자, 어린이 햇빛가리개, 아기 태양 모자, 신생아 사진 소품, 아기 액세서리 .jpg','어린이 모자 메쉬 어부 모자, 노란색 모자, 어린이 햇빛가리개, 아기 태양 모자, 신생아 사진 소품, 아기 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','신생아용 부드러운 나일론 머리띠, 신축성 있는 꽃 단색 머리띠, 여아 헤어 액세서리 ',0,'신생아용 부드러운 나일론 머리띠, 신축성 있는 꽃 단색 머리띠, 여아 헤어 액세서리 .jpg','신생아용 부드러운 나일론 머리띠, 신축성 있는 꽃 단색 머리띠, 여아 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','한국어 버전 어린이 해바라기 머리핀, 여아 수제 꽃 헤어 클립, 귀여운 천 아트 앞머리 헤어 액세서리 ',0,'한국어 버전 어린이 해바라기 머리핀, 여아 수제 꽃 헤어 클립, 귀여운 천 아트 앞머리 헤어 액세서리 .jpg','한국어 버전 어린이 해바라기 머리핀, 여아 수제 꽃 헤어 클립, 귀여운 천 아트 앞머리 헤어 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아동용 PU 가죽 나비 헤어클립, 귀여운 소녀 헤어핀 헤어그립, 귀여운 헤어 액세서리, 도매 ',0,'아동용 PU 가죽 나비 헤어클립, 귀여운 소녀 헤어핀 헤어그립, 귀여운 헤어 액세서리, 도매 .jpg','아동용 PU 가죽 나비 헤어클립, 귀여운 소녀 헤어핀 헤어그립, 귀여운 헤어 액세서리, 도매 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아기 모자 귀 보호 모자, 3-6 개월 아기 따뜻한 모자, 여아 아기 모자, 신생아 액세서리 ',0,'아기 모자 귀 보호 모자, 3-6 개월 아기 따뜻한 모자, 여아 아기 모자, 신생아 액세서리 .jpg','아기 모자 귀 보호 모자, 3-6 개월 아기 따뜻한 모자, 여아 아기 모자, 신생아 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','아기 소녀 공주 레이스 리본 활, 어린이 로리타 모자, 상단 클립 머리핀, 머리 원피스 파티, 결혼식 생일, 아기 액세서리 ',14924,'아기 소녀 공주 레이스 리본 활, 어린이 로리타 모자, 상단 클립 머리핀, 머리 원피스 파티, 결혼식 생일, 아기 액세서리 .jpg','아기 소녀 공주 레이스 리본 활, 어린이 로리타 모자, 상단 클립 머리핀, 머리 원피스 파티, 결혼식 생일, 아기 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','헤어 붕대 밴드, 나비 터번, 어린이 신생아, 어린이 모자, 아기 소녀 액세서리, 꽃 꽃, 부드러운 고체 탄성 ',4218,'헤어 붕대 밴드, 나비 터번, 어린이 신생아, 어린이 모자, 아기 소녀 액세서리, 꽃 꽃, 부드러운 고체 탄성 .jpg','헤어 붕대 밴드, 나비 터번, 어린이 신생아, 어린이 모자, 아기 소녀 액세서리, 꽃 꽃, 부드러운 고체 탄성 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','할로윈 호박 유령 캔디 헤어 활 클립, 할로윈 헤어 액세서리, 소녀 머리핀, 어린이 모자, 3.14 인치 ',0,'할로윈 호박 유령 캔디 헤어 활 클립, 할로윈 헤어 액세서리, 소녀 머리핀, 어린이 모자, 3.14 인치 .jpg','할로윈 호박 유령 캔디 헤어 활 클립, 할로윈 헤어 액세서리, 소녀 머리핀, 어린이 모자, 3.14 인치 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','부드러운 헤어 밴드 활 터번 머리띠 신생아용, 아기 소녀 액세서리, 꽃 단색, 귀여운 선물, 1 개 ',917,'부드러운 헤어 밴드 활 터번 머리띠 신생아용, 아기 소녀 액세서리, 꽃 단색, 귀여운 선물, 1 개 .jpg','부드러운 헤어 밴드 활 터번 머리띠 신생아용, 아기 소녀 액세서리, 꽃 단색, 귀여운 선물, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','귀여운 활 헤드기어 귀여운 소녀 헤어 액세서리, 여름 소녀 그물 레드 클립, 아기 머리핀, 어린이 헤어 클립 선물, 신제품 ',0,'귀여운 활 헤드기어 귀여운 소녀 헤어 액세서리, 여름 소녀 그물 레드 클립, 아기 머리핀, 어린이 헤어 클립 선물, 신제품 .jpg','귀여운 활 헤드기어 귀여운 소녀 헤어 액세서리, 여름 소녀 그물 레드 클립, 아기 머리핀, 어린이 헤어 클립 선물, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 스팽글 머리 장식, 인어 꼬리 머리띠, 공주 머리 클립, 어린이 머리 장식, 어린이 파티 머리핀 액세서리 ',2196,'여아용 스팽글 머리 장식, 인어 꼬리 머리띠, 공주 머리 클립, 어린이 머리 장식, 어린이 파티 머리핀 액세서리 .jpg','여아용 스팽글 머리 장식, 인어 꼬리 머리띠, 공주 머리 클립, 어린이 머리 장식, 어린이 파티 머리핀 액세서리 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 수박 프린트 나비 매듭 헤어 클립, 사랑스러운 다채로운 머리핀, 머리 장식, 어린이 아기 헤어 액세서리, 3 개/세트 ',2243,'여아용 귀여운 수박 프린트 나비 매듭 헤어 클립, 사랑스러운 다채로운 머리핀, 머리 장식, 어린이 아기 헤어 액세서리, 3 개/세트 .jpg','여아용 귀여운 수박 프린트 나비 매듭 헤어 클립, 사랑스러운 다채로운 머리핀, 머리 장식, 어린이 아기 헤어 액세서리, 3 개/세트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','Xgnvpy 아기 모자, 귀 비니 모자, 신생아, 여아, 겨울 액세서리, 유아 모자 ',0,'Xgnvpy 아기 모자, 귀 비니 모자, 신생아, 여아, 겨울 액세서리, 유아 모자 .jpg','Xgnvpy 아기 모자, 귀 비니 모자, 신생아, 여아, 겨울 액세서리, 유아 모자 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 머리띠, 어린이 머리띠, 어린이 머리띠, 헤어 액세서리, 헤어 스크런치, 소녀 헤어 클립, 선물 ',973,'여아용 머리띠, 어린이 머리띠, 어린이 머리띠, 헤어 액세서리, 헤어 스크런치, 소녀 헤어 클립, 선물 .jpg','여아용 머리띠, 어린이 머리띠, 어린이 머리띠, 헤어 액세서리, 헤어 스크런치, 소녀 헤어 클립, 선물 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 체크 무늬 머리핀, 활 스타일 헤어 클립, 한국 스타일, 어린이 모자, 헤어 액세서리, 세트당 2 개 ',1723,'여아용 체크 무늬 머리핀, 활 스타일 헤어 클립, 한국 스타일, 어린이 모자, 헤어 액세서리, 세트당 2 개 .jpg','여아용 체크 무늬 머리핀, 활 스타일 헤어 클립, 한국 스타일, 어린이 모자, 헤어 액세서리, 세트당 2 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','한국 여아용 수제 코튼 리본 헤어 클립, 레이스 자카드, 꽃무늬 흰색, 귀여운 어린이 헤어 액세서리, 4 개 ',0,'한국 여아용 수제 코튼 리본 헤어 클립, 레이스 자카드, 꽃무늬 흰색, 귀여운 어린이 헤어 액세서리, 4 개 .jpg','한국 여아용 수제 코튼 리본 헤어 클립, 레이스 자카드, 꽃무늬 흰색, 귀여운 어린이 헤어 액세서리, 4 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 단색 헤어 클립, 벨벳 헤어 보우, 어린이 헤어 액세서리, 신생아 아기 소녀 머리핀 헤드웨어, 25 색 ',3005,'여아용 단색 헤어 클립, 벨벳 헤어 보우, 어린이 헤어 액세서리, 신생아 아기 소녀 머리핀 헤드웨어, 25 색 .jpg','여아용 단색 헤어 클립, 벨벳 헤어 보우, 어린이 헤어 액세서리, 신생아 아기 소녀 머리핀 헤드웨어, 25 색 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 탄성 헤어 밴드, 헤어 액세서리, 어린이 헤어 타이, 헤어 링, 헤드 로프, 어린이 만화 고무 밴드, 세트당 10 개 ',0,'여아용 탄성 헤어 밴드, 헤어 액세서리, 어린이 헤어 타이, 헤어 링, 헤드 로프, 어린이 만화 고무 밴드, 세트당 10 개 .jpg','여아용 탄성 헤어 밴드, 헤어 액세서리, 어린이 헤어 타이, 헤어 링, 헤드 로프, 어린이 만화 고무 밴드, 세트당 10 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 핑크 컬러 헤어 클립, 스위트 단색 격자 무늬 스타일, 어린이 헤어 핀, 여성용 헤드웨어, 헤어 액세서리, 세트당 2 개 ',2577,'여아용 핑크 컬러 헤어 클립, 스위트 단색 격자 무늬 스타일, 어린이 헤어 핀, 여성용 헤드웨어, 헤어 액세서리, 세트당 2 개 .jpg','여아용 핑크 컬러 헤어 클립, 스위트 단색 격자 무늬 스타일, 어린이 헤어 핀, 여성용 헤드웨어, 헤어 액세서리, 세트당 2 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'4','여아용 귀여운 만화 헤어 밴드, 신축성 있는 아기 헤어 로프, 어린이 포니테일 거치대 밴드, 어린이 헤어 액세서리 ',2525,'여아용 귀여운 만화 헤어 밴드, 신축성 있는 아기 헤어 로프, 어린이 포니테일 거치대 밴드, 어린이 헤어 액세서리 .jpg','여아용 귀여운 만화 헤어 밴드, 신축성 있는 아기 헤어 로프, 어린이 포니테일 거치대 밴드, 어린이 헤어 액세서리 .jpg'); 

--아동잡화
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','부모-자녀 매칭 티셔츠, 온 가족 룩, 2023 여름 아빠와 아들 매칭 옷, 엄마와 딸 같은 탑 티',0,'부모-자녀 매칭 티셔츠, 온 가족 룩, 2023 여름 아빠와 아들 매칭 옷, 엄마와 딸 같은 탑 티.jpg','부모-자녀 매칭 티셔츠, 온 가족 룩, 2023 여름 아빠와 아들 매칭 옷, 엄마와 딸 같은 탑 티.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','반팔 가족 매칭 의상, 엄마 딸 드레스, 아버지 아들 티셔츠, 아빠 엄마 나 옷, 여름 2024',18692,'반팔 가족 매칭 의상, 엄마 딸 드레스, 아버지 아들 티셔츠, 아빠 엄마 나 옷, 여름 2024.jpg','반팔 가족 매칭 의상, 엄마 딸 드레스, 아버지 아들 티셔츠, 아빠 엄마 나 옷, 여름 2024.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','엄마 딸 아들 티셔츠 점프수트, 아빠 아이 티셔츠, 반바지, 부모 자식 옷, 한국 스타일 패밀리 룩 세트',0,'엄마 딸 아들 티셔츠 점프수트, 아빠 아이 티셔츠, 반바지, 부모 자식 옷, 한국 스타일 패밀리 룩 세트.jpg','엄마 딸 아들 티셔츠 점프수트, 아빠 아이 티셔츠, 반바지, 부모 자식 옷, 한국 스타일 패밀리 룩 세트.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','홀리데이 패밀리 매칭 비치 의류, 커플 휴가 룩, 엄마와 딸 작업복, 녹색 원피스, 휴양지 아빠와 아들 프린트 셔츠',11004,'홀리데이 패밀리 매칭 비치 의류, 커플 휴가 룩, 엄마와 딸 작업복, 녹색 원피스, 휴양지 아빠와 아들 프린트 셔츠.jpg','홀리데이 패밀리 매칭 비치 의류, 커플 휴가 룩, 엄마와 딸 작업복, 녹색 원피스, 휴양지 아빠와 아들 프린트 셔츠.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 어울리는 옷, 2023 어머니 딸 드레스, 가족 룩, 아버지 아들 엄마 키즈 폴로 티셔츠, 엄마와 나 옷, 여름',0,'가족 어울리는 옷, 2023 어머니 딸 드레스, 가족 룩, 아버지 아들 엄마 키즈 폴로 티셔츠, 엄마와 나 옷, 여름.jpg','가족 어울리는 옷, 2023 어머니 딸 드레스, 가족 룩, 아버지 아들 엄마 키즈 폴로 티셔츠, 엄마와 나 옷, 여름.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','재밌는 아빠 엄마와 아들 가족 매칭 옷, 패밀리룩 티셔츠, 파파 마마, 리틀 보이, 키즈 셔츠, 베이비 바디수트 상의, 여름',9366,'재밌는 아빠 엄마와 아들 가족 매칭 옷, 패밀리룩 티셔츠, 파파 마마, 리틀 보이, 키즈 셔츠, 베이비 바디수트 상의, 여름.jpg','재밌는 아빠 엄마와 아들 가족 매칭 옷, 패밀리룩 티셔츠, 파파 마마, 리틀 보이, 키즈 셔츠, 베이비 바디수트 상의, 여름.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 패션 비치 패션, 엄마, 아빠, 소녀, 소년, 파란색 옷, 휴가 룩, 엄마 딸 휴가 원피스, 한국 아빠 아들 티셔츠',22388,'가족 패션 비치 패션, 엄마, 아빠, 소녀, 소년, 파란색 옷, 휴가 룩, 엄마 딸 휴가 원피스, 한국 아빠 아들 티셔츠.jpg','가족 패션 비치 패션, 엄마, 아빠, 소녀, 소년, 파란색 옷, 휴가 룩, 엄마 딸 휴가 원피스, 한국 아빠 아들 티셔츠.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','2024 해변 가족 매칭 옷, 휴양지 룩, 아빠와 아들 셔츠, 엄마와 소녀 꽃, 엄마 딸 휴가 원피스, 새로운 복장',25209,'2024 해변 가족 매칭 옷, 휴양지 룩, 아빠와 아들 셔츠, 엄마와 소녀 꽃, 엄마 딸 휴가 원피스, 새로운 복장.jpg','2024 해변 가족 매칭 옷, 휴양지 룩, 아빠와 아들 셔츠, 엄마와 소녀 꽃, 엄마 딸 휴가 원피스, 새로운 복장.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','엄마와 딸 같은 원피스 아빠 반팔 티셔츠, 엄마와 아들 아이 의류, 어린이 투피스 복장',0,'엄마와 딸 같은 원피스 아빠 반팔 티셔츠, 엄마와 아들 아이 의류, 어린이 투피스 복장.jpg','엄마와 딸 같은 원피스 아빠 반팔 티셔츠, 엄마와 아들 아이 의류, 어린이 투피스 복장.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','부모-자녀 티셔츠 캐주얼 아동복, 가족 매칭 의상, 레저 반팔 탑 룩 아동복, 2-12 세 여름',12583,'부모-자녀 티셔츠 캐주얼 아동복, 가족 매칭 의상, 레저 반팔 탑 룩 아동복, 2-12 세 여름.jpg','부모-자녀 티셔츠 캐주얼 아동복, 가족 매칭 의상, 레저 반팔 탑 룩 아동복, 2-12 세 여름.jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','남아 의류 세트 여아 원피스 한국 스타일 대비 스트라이프 반바지 세트, 민소매 스커트, 가족 매칭 의상, 형제 자매 룩, 여름 ',10326,'남아 의류 세트 여아 원피스 한국 스타일 대비 스트라이프 반바지 세트, 민소매 스커트, 가족 매칭 의상, 형제 자매 룩, 여름 .jpg','남아 의류 세트 여아 원피스 한국 스타일 대비 스트라이프 반바지 세트, 민소매 스커트, 가족 매칭 의상, 형제 자매 룩, 여름 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','여름 부모 자식 사랑 옷, 온 가족 룩 의류, 아빠 아들 매칭 같은 티셔츠, 아기 롬퍼 엄마 딸 드레스 ',18489,'여름 부모 자식 사랑 옷, 온 가족 룩 의류, 아빠 아들 매칭 같은 티셔츠, 아기 롬퍼 엄마 딸 드레스 .jpg','여름 부모 자식 사랑 옷, 온 가족 룩 의류, 아빠 아들 매칭 같은 티셔츠, 아기 롬퍼 엄마 딸 드레스 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','여아용 귀여운 인형 칼라 패밀리 드레스, 엄마 딸 가족 매칭 드레스, 엄마와 나 미니 드레스, 패밀리 룩, 여름 ',19947,'여아용 귀여운 인형 칼라 패밀리 드레스, 엄마 딸 가족 매칭 드레스, 엄마와 나 미니 드레스, 패밀리 룩, 여름 .jpg','여아용 귀여운 인형 칼라 패밀리 드레스, 엄마 딸 가족 매칭 드레스, 엄마와 나 미니 드레스, 패밀리 룩, 여름 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 여름 커플 룩 비치 의류, 엄마와 딸 원피스 휴가, 아버지 아들 콤비네이션 셔츠, 반바지 의상 ',27085,'가족 여름 커플 룩 비치 의류, 엄마와 딸 원피스 휴가, 아버지 아들 콤비네이션 셔츠, 반바지 의상 .jpg','가족 여름 커플 룩 비치 의류, 엄마와 딸 원피스 휴가, 아버지 아들 콤비네이션 셔츠, 반바지 의상 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','엄마 딸 원피스 여성 드레스, 부모 자식 매칭, 한국 의류, 가족 형제 자매 복장, 아빠 아들 티셔츠, 커플 룩 ',20285,'엄마 딸 원피스 여성 드레스, 부모 자식 매칭, 한국 의류, 가족 형제 자매 복장, 아빠 아들 티셔츠, 커플 룩 .jpg','엄마 딸 원피스 여성 드레스, 부모 자식 매칭, 한국 의류, 가족 형제 자매 복장, 아빠 아들 티셔츠, 커플 룩 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','패밀리 룩 반팔 엄마 딸 매칭 드레스, 아빠 엄마와 나 코튼 의류, 아버지 아들 티셔츠, 여름 2024 ',0,'패밀리 룩 반팔 엄마 딸 매칭 드레스, 아빠 엄마와 나 코튼 의류, 아버지 아들 티셔츠, 여름 2024 .jpg','패밀리 룩 반팔 엄마 딸 매칭 드레스, 아빠 엄마와 나 코튼 의류, 아버지 아들 티셔츠, 여름 2024 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','PatPat 패밀리 룩 하운드투스 그리드 베어 프린트, 긴팔 상의 및 드레스 세트 ',0,'PatPat 패밀리 룩 하운드투스 그리드 베어 프린트, 긴팔 상의 및 드레스 세트 .jpg','PatPat 패밀리 룩 하운드투스 그리드 베어 프린트, 긴팔 상의 및 드레스 세트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','어머니 딸 드레스, 여름 가족 의류, 꽃 엄마, 아이, 가족 룩, 여자 아기 드레스, 엄마와 나 옷 ',32195,'어머니 딸 드레스, 여름 가족 의류, 꽃 엄마, 아이, 가족 룩, 여자 아기 드레스, 엄마와 나 옷 .jpg','어머니 딸 드레스, 여름 가족 의류, 꽃 엄마, 아이, 가족 룩, 여자 아기 드레스, 엄마와 나 옷 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 휴가 2024 어울리는 옷, 성인 및 어린이 티셔츠, 아기 티셔츠, 여행 가족 룩 복장, 여름 반팔 셔츠 ',0,'가족 휴가 2024 어울리는 옷, 성인 및 어린이 티셔츠, 아기 티셔츠, 여행 가족 룩 복장, 여름 반팔 셔츠 .jpg','가족 휴가 2024 어울리는 옷, 성인 및 어린이 티셔츠, 아기 티셔츠, 여행 가족 룩 복장, 여름 반팔 셔츠 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 어울리는 옷, 엄마 딸 의상, 소녀 반팔 코튼 원피스, 아기 소녀 롬퍼 자매 룩, 여름 ',19242,'가족 어울리는 옷, 엄마 딸 의상, 소녀 반팔 코튼 원피스, 아기 소녀 롬퍼 자매 룩, 여름 .jpg','가족 어울리는 옷, 엄마 딸 의상, 소녀 반팔 코튼 원피스, 아기 소녀 롬퍼 자매 룩, 여름 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','MILANCEL-패밀리 매칭 의상 귀여운 배 프린트 유아용 롬퍼 패밀리 룩, 패밀리 룩 ',8916,'MILANCEL-패밀리 매칭 의상 귀여운 배 프린트 유아용 롬퍼 패밀리 룩, 패밀리 룩 .jpg','MILANCEL-패밀리 매칭 의상 귀여운 배 프린트 유아용 롬퍼 패밀리 룩, 패밀리 룩 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','코튼 가족 코스튬, 카니발 어머니, 어린이, 소년, 소녀, 아기 의류, 잠옷 세트, 휴가 형제 자매 룩, 가족 매칭 의상 ',10806,'코튼 가족 코스튬, 카니발 어머니, 어린이, 소년, 소녀, 아기 의류, 잠옷 세트, 휴가 형제 자매 룩, 가족 매칭 의상 .jpg','코튼 가족 코스튬, 카니발 어머니, 어린이, 소년, 소녀, 아기 의류, 잠옷 세트, 휴가 형제 자매 룩, 가족 매칭 의상 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','엄마와 나 맞춤 반팔 셔츠, 엄마 딸 프린트 매칭 셔츠, 여성 커플 옷, 패밀리 룩, 신제품 ',0,'엄마와 나 맞춤 반팔 셔츠, 엄마 딸 프린트 매칭 셔츠, 여성 커플 옷, 패밀리 룩, 신제품 .jpg','엄마와 나 맞춤 반팔 셔츠, 엄마 딸 프린트 매칭 셔츠, 여성 커플 옷, 패밀리 룩, 신제품 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','재미있는 헬로 2025 가족 매칭 의상, 코튼 엄마 아빠 딸 아들 키즈 티셔츠, 아기 롬퍼 룩, 새해 옷 ',0,'재미있는 헬로 2025 가족 매칭 의상, 코튼 엄마 아빠 딸 아들 키즈 티셔츠, 아기 롬퍼 룩, 새해 옷 .jpg','재미있는 헬로 2025 가족 매칭 의상, 코튼 엄마 아빠 딸 아들 키즈 티셔츠, 아기 롬퍼 룩, 새해 옷 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','엄마와 딸 패션 스커트 패밀리룩 의류, 한국 스타일, 아버지 아들 같은 반바지, 부모 자녀 복장, 여름 2024 신상 ',10708,'엄마와 딸 패션 스커트 패밀리룩 의류, 한국 스타일, 아버지 아들 같은 반바지, 부모 자녀 복장, 여름 2024 신상 .jpg','엄마와 딸 패션 스커트 패밀리룩 의류, 한국 스타일, 아버지 아들 같은 반바지, 부모 자녀 복장, 여름 2024 신상 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 룩 휴가 비치 의류, 엄마 딸 민소매 드레스, 아빠 아들 매칭 꽃 셔츠 세트, 부모 자녀 휴가 의류 ',16641,'가족 룩 휴가 비치 의류, 엄마 딸 민소매 드레스, 아빠 아들 매칭 꽃 셔츠 세트, 부모 자녀 휴가 의류 .jpg','가족 룩 휴가 비치 의류, 엄마 딸 민소매 드레스, 아빠 아들 매칭 꽃 셔츠 세트, 부모 자녀 휴가 의류 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','아빠 딸 매칭 가족 아들과 엄마 옷, 부모 자식 복장, 2024 새로운 휴양지 룩, 엄마와 아기 블루 파티 원피스 ',21067,'아빠 딸 매칭 가족 아들과 엄마 옷, 부모 자식 복장, 2024 새로운 휴양지 룩, 엄마와 아기 블루 파티 원피스 .jpg','아빠 딸 매칭 가족 아들과 엄마 옷, 부모 자식 복장, 2024 새로운 휴양지 룩, 엄마와 아기 블루 파티 원피스 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','PatPat 패밀리 매칭 의상, 올오버 플로럴 프린트, 반팔 벨트 드레스, 컬러블록 티셔츠, 패밀리 룩 세트 ',13416,'PatPat 패밀리 매칭 의상, 올오버 플로럴 프린트, 반팔 벨트 드레스, 컬러블록 티셔츠, 패밀리 룩 세트 .jpg','PatPat 패밀리 매칭 의상, 올오버 플로럴 프린트, 반팔 벨트 드레스, 컬러블록 티셔츠, 패밀리 룩 세트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','I Love My Big Sister/Little Sister 가족 매칭 셔츠, 여아용 티셔츠, 아기 롬퍼 바디 수트, 러브 프린트, 형제 자매 룩 복장 ',0,'I Love My Big Sister/Little Sister 가족 매칭 셔츠, 여아용 티셔츠, 아기 롬퍼 바디 수트, 러브 프린트, 형제 자매 룩 복장 .jpg','I Love My Big Sister/Little Sister 가족 매칭 셔츠, 여아용 티셔츠, 아기 롬퍼 바디 수트, 러브 프린트, 형제 자매 룩 복장 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','휴가 룩 가족 의류 엄마와 딸, 휴양지 원피스 아빠와 나 아버지 아들 매칭 셔츠, 커플 룩 비치 ',20782,'휴가 룩 가족 의류 엄마와 딸, 휴양지 원피스 아빠와 나 아버지 아들 매칭 셔츠, 커플 룩 비치 .jpg','휴가 룩 가족 의류 엄마와 딸, 휴양지 원피스 아빠와 나 아버지 아들 매칭 셔츠, 커플 룩 비치 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','PatPat 패밀리 매칭 의상, 파란색 모자 소매 벨트 미디 드레스 및 반팔 스트라이프 접합 티셔츠, 패밀리 룩 세트 ',9664,'PatPat 패밀리 매칭 의상, 파란색 모자 소매 벨트 미디 드레스 및 반팔 스트라이프 접합 티셔츠, 패밀리 룩 세트 .jpg','PatPat 패밀리 매칭 의상, 파란색 모자 소매 벨트 미디 드레스 및 반팔 스트라이프 접합 티셔츠, 패밀리 룩 세트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','PatPat 패밀리 매칭 의상, 벨트 단색 브이넥 드레스, 긴팔 컬러 블록 상의, 패밀리 룩 세트 ',0,'PatPat 패밀리 매칭 의상, 벨트 단색 브이넥 드레스, 긴팔 컬러 블록 상의, 패밀리 룩 세트 .jpg','PatPat 패밀리 매칭 의상, 벨트 단색 브이넥 드레스, 긴팔 컬러 블록 상의, 패밀리 룩 세트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 형제 자매 매칭 의상, 엄마 딸 셔츠, 휴가 커플 룩 옷, 아빠 아들 티셔츠 세트, 투피스 세트 ',8732,'가족 형제 자매 매칭 의상, 엄마 딸 셔츠, 휴가 커플 룩 옷, 아빠 아들 티셔츠 세트, 투피스 세트 .jpg','가족 형제 자매 매칭 의상, 엄마 딸 셔츠, 휴가 커플 룩 옷, 아빠 아들 티셔츠 세트, 투피스 세트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','크리스마스 가족 매칭 의상, 엄마 아빠 아이 잠옷 세트, 2 피스 잠옷, 아기 롬퍼, 캐주얼 루즈 잠옷, 크리스마스 가족 룩 잠옷 ',5482,'크리스마스 가족 매칭 의상, 엄마 아빠 아이 잠옷 세트, 2 피스 잠옷, 아기 롬퍼, 캐주얼 루즈 잠옷, 크리스마스 가족 룩 잠옷 .jpg','크리스마스 가족 매칭 의상, 엄마 아빠 아이 잠옷 세트, 2 피스 잠옷, 아기 롬퍼, 캐주얼 루즈 잠옷, 크리스마스 가족 룩 잠옷 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 셔츠용 비치 웨어 의류 세트, 긴 휴가 엄마와 딸, 바다 휴양지용 블루 원피스, 아버지 아들 복장 ',0,'가족 셔츠용 비치 웨어 의류 세트, 긴 휴가 엄마와 딸, 바다 휴양지용 블루 원피스, 아버지 아들 복장 .jpg','가족 셔츠용 비치 웨어 의류 세트, 긴 휴가 엄마와 딸, 바다 휴양지용 블루 원피스, 아버지 아들 복장 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','엄마 딸 가족 세트, 엄마 아빠 아들 가족 룩 매칭 옷, 스트랩 드레스 세트, 코튼 셔츠, 여름 티 ',23686,'엄마 딸 가족 세트, 엄마 아빠 아들 가족 룩 매칭 옷, 스트랩 드레스 세트, 코튼 셔츠, 여름 티 .jpg','엄마 딸 가족 세트, 엄마 아빠 아들 가족 룩 매칭 옷, 스트랩 드레스 세트, 코튼 셔츠, 여름 티 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 매칭 옷, 한국 어머니 딸 드레스, 격자 무늬 코튼 패밀리 룩, 엄마와 나, 여성 소녀 원피스, 여름 2024 ',16971,'가족 매칭 옷, 한국 어머니 딸 드레스, 격자 무늬 코튼 패밀리 룩, 엄마와 나, 여성 소녀 원피스, 여름 2024 .jpg','가족 매칭 옷, 한국 어머니 딸 드레스, 격자 무늬 코튼 패밀리 룩, 엄마와 나, 여성 소녀 원피스, 여름 2024 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','2023 새해 옷 크리스마스 가족 매칭 의상, 엄마 아빠 키즈 잠옷 세트, DIY 블랭크 2 피스 의류 세트, 크리스마스 룩 PJS ',18808,'2023 새해 옷 크리스마스 가족 매칭 의상, 엄마 아빠 키즈 잠옷 세트, DIY 블랭크 2 피스 의류 세트, 크리스마스 룩 PJS .jpg','2023 새해 옷 크리스마스 가족 매칭 의상, 엄마 아빠 키즈 잠옷 세트, DIY 블랭크 2 피스 의류 세트, 크리스마스 룩 PJS .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','해변 가족 매칭 의상, 휴가 2024, 엄마와 딸, 여름 원피스, 휴양지 커플 룩, 아빠와 아들 바다 휴가 의류 세트 ',0,'해변 가족 매칭 의상, 휴가 2024, 엄마와 딸, 여름 원피스, 휴양지 커플 룩, 아빠와 아들 바다 휴가 의류 세트 .jpg','해변 가족 매칭 의상, 휴가 2024, 엄마와 딸, 여름 원피스, 휴양지 커플 룩, 아빠와 아들 바다 휴가 의류 세트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','여름 패밀리룩 코튼 반팔 티셔츠, 아이 아빠 월 아동복, 부모 자녀 착용, 유니섹스 아기 옷 ',0,'여름 패밀리룩 코튼 반팔 티셔츠, 아이 아빠 월 아동복, 부모 자녀 착용, 유니섹스 아기 옷 .jpg','여름 패밀리룩 코튼 반팔 티셔츠, 아이 아빠 월 아동복, 부모 자녀 착용, 유니섹스 아기 옷 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','엄마와 딸 드레스, 민소매 술 엄마와 나 드레스, 가족 어울리는 옷, 엄마와 딸 드레스, 여름 ',17676,'엄마와 딸 드레스, 민소매 술 엄마와 나 드레스, 가족 어울리는 옷, 엄마와 딸 드레스, 여름 .jpg','엄마와 딸 드레스, 민소매 술 엄마와 나 드레스, 가족 어울리는 옷, 엄마와 딸 드레스, 여름 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','휴가 룩 가족 매칭 의류 세트, 엄마와 딸 티 바지, 아버지와 아들 티셔츠 반바지, 2 피스 의상 ',0,'휴가 룩 가족 매칭 의류 세트, 엄마와 딸 티 바지, 아버지와 아들 티셔츠 반바지, 2 피스 의상 .jpg','휴가 룩 가족 매칭 의류 세트, 엄마와 딸 티 바지, 아버지와 아들 티셔츠 반바지, 2 피스 의상 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','엄마와 아들 딸 가족 매칭 옷, 여름 코튼 티셔츠, 파파 마마 키즈, 소년 소녀 반팔 상의, 귀여운 패밀리 룩 ',2413,'엄마와 아들 딸 가족 매칭 옷, 여름 코튼 티셔츠, 파파 마마 키즈, 소년 소녀 반팔 상의, 귀여운 패밀리 룩 .jpg','엄마와 아들 딸 가족 매칭 옷, 여름 코튼 티셔츠, 파파 마마 키즈, 소년 소녀 반팔 상의, 귀여운 패밀리 룩 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','2021 글자 스포츠 가족 맞춤 긴 소매 티셔츠 4 종 가족용, 스웨트 셔츠 세트 ',0,'2021 글자 스포츠 가족 맞춤 긴 소매 티셔츠 4 종 가족용, 스웨트 셔츠 세트 .jpg','2021 글자 스포츠 가족 맞춤 긴 소매 티셔츠 4 종 가족용, 스웨트 셔츠 세트 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','보트넥 어머니 딸 매칭 드레스, 가족 룩, 프릴 엄마와 나 옷, 여성 소녀 코튼 원피스, 여름 2024 ',23263,'보트넥 어머니 딸 매칭 드레스, 가족 룩, 프릴 엄마와 나 옷, 여성 소녀 코튼 원피스, 여름 2024 .jpg','보트넥 어머니 딸 매칭 드레스, 가족 룩, 프릴 엄마와 나 옷, 여성 소녀 코튼 원피스, 여름 2024 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','아빠와 엄마로서 첫 크리스마스 티셔츠, 아기 첫 크리스마스 롬퍼, 가족 룩 유아 옷, 크리스마스 새해 축제 탑 ',0,'아빠와 엄마로서 첫 크리스마스 티셔츠, 아기 첫 크리스마스 롬퍼, 가족 룩 유아 옷, 크리스마스 새해 축제 탑 .jpg','아빠와 엄마로서 첫 크리스마스 티셔츠, 아기 첫 크리스마스 롬퍼, 가족 룩 유아 옷, 크리스마스 새해 축제 탑 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 일치하는 옷 플레이어 1 플레이어 2 재미 있은 아버지 아들 모양 Tshirt 여름 반팔 티셔츠 아빠 아기 바디 슈트, 1 개 ',8788,'가족 일치하는 옷 플레이어 1 플레이어 2 재미 있은 아버지 아들 모양 Tshirt 여름 반팔 티셔츠 아빠 아기 바디 슈트, 1 개 .jpg','가족 일치하는 옷 플레이어 1 플레이어 2 재미 있은 아버지 아들 모양 Tshirt 여름 반팔 티셔츠 아빠 아기 바디 슈트, 1 개 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 매칭 의상, 홀치기 염색 반팔 티셔츠, 남아/여아용 어머니 키즈 셔츠, 패밀리 룩 매칭 의상 ',8369,'가족 매칭 의상, 홀치기 염색 반팔 티셔츠, 남아/여아용 어머니 키즈 셔츠, 패밀리 룩 매칭 의상 .jpg','가족 매칭 의상, 홀치기 염색 반팔 티셔츠, 남아/여아용 어머니 키즈 셔츠, 패밀리 룩 매칭 의상 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 매칭 수영복, 큰 꽃 수영복, 비키니 패밀리 룩, 엄마 소녀, 여자 수영복 세트, 새로운 패션, 여름 ',26338,'가족 매칭 수영복, 큰 꽃 수영복, 비키니 패밀리 룩, 엄마 소녀, 여자 수영복 세트, 새로운 패션, 여름 .jpg','가족 매칭 수영복, 큰 꽃 수영복, 비키니 패밀리 룩, 엄마 소녀, 여자 수영복 세트, 새로운 패션, 여름 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','프린세스 퀸 킹 프린트 패밀리 룩 티셔츠, 아빠, 아이, 소년, 엄마, 딸 매칭 의상 ',13346,'프린세스 퀸 킹 프린트 패밀리 룩 티셔츠, 아빠, 아이, 소년, 엄마, 딸 매칭 의상 .jpg','프린세스 퀸 킹 프린트 패밀리 룩 티셔츠, 아빠, 아이, 소년, 엄마, 딸 매칭 의상 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','나뭇잎 수영복, 가족 매칭 의상, 엄마 딸 수영복, 엄마 나 옷, 아버지 아들 수영 반바지, 원피스 룩 ',0,'나뭇잎 수영복, 가족 매칭 의상, 엄마 딸 수영복, 엄마 나 옷, 아버지 아들 수영 반바지, 원피스 룩 .jpg','나뭇잎 수영복, 가족 매칭 의상, 엄마 딸 수영복, 엄마 나 옷, 아버지 아들 수영 반바지, 원피스 룩 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','헬로 2025 가족 매칭 의상, 코튼 엄마 아빠 딸 아들 티셔츠, 아기 롬퍼 룩, 새해 옷 ',0,'헬로 2025 가족 매칭 의상, 코튼 엄마 아빠 딸 아들 티셔츠, 아기 롬퍼 룩, 새해 옷 .jpg','헬로 2025 가족 매칭 의상, 코튼 엄마 아빠 딸 아들 티셔츠, 아기 롬퍼 룩, 새해 옷 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','2023 엄마와 딸 꽃무늬 긴 소매 원피스 옷, 가족 룩 매칭 의상, 웨딩 파티 엄마와 나 긴 드레스, 5-12 ',26060,'2023 엄마와 딸 꽃무늬 긴 소매 원피스 옷, 가족 룩 매칭 의상, 웨딩 파티 엄마와 나 긴 드레스, 5-12 .jpg','2023 엄마와 딸 꽃무늬 긴 소매 원피스 옷, 가족 룩 매칭 의상, 웨딩 파티 엄마와 나 긴 드레스, 5-12 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','크리스마스 잠옷, 가족, 어머니, 아이, 아이, 아이, 가족 룩 매칭 의상, 정장, 아버지, 아들, 아기, 신생아 의류 세트, 상의 + 바지 ',14150,'크리스마스 잠옷, 가족, 어머니, 아이, 아이, 아이, 가족 룩 매칭 의상, 정장, 아버지, 아들, 아기, 신생아 의류 세트, 상의 + 바지 .jpg','크리스마스 잠옷, 가족, 어머니, 아이, 아이, 아이, 가족 룩 매칭 의상, 정장, 아버지, 아들, 아기, 신생아 의류 세트, 상의 + 바지 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','메리 크리스마스 세트 가족 잠옷 매칭 의상, 성인 어린이 아기 새해 옷, 만화 인쇄 잠옷, 크리스마스 홈 룩 ',0,'메리 크리스마스 세트 가족 잠옷 매칭 의상, 성인 어린이 아기 새해 옷, 만화 인쇄 잠옷, 크리스마스 홈 룩 .jpg','메리 크리스마스 세트 가족 잠옷 매칭 의상, 성인 어린이 아기 새해 옷, 만화 인쇄 잠옷, 크리스마스 홈 룩 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','서스펜더 백리스 원피스 패밀리 매칭 의상, 여성 소녀, 어머니 딸 해변, 우아한 파티 베스티도, 패밀리 룩, 2024 신상 ',16745,'서스펜더 백리스 원피스 패밀리 매칭 의상, 여성 소녀, 어머니 딸 해변, 우아한 파티 베스티도, 패밀리 룩, 2024 신상 .jpg','서스펜더 백리스 원피스 패밀리 매칭 의상, 여성 소녀, 어머니 딸 해변, 우아한 파티 베스티도, 패밀리 룩, 2024 신상 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 크리스마스 잠옷, 귀여운 공룡 패턴 2 종 세트, 크리스마스 코스튬 잠옷, 멋진 새해 가족 룩, 어머니, 어린이 ',17817,'가족 크리스마스 잠옷, 귀여운 공룡 패턴 2 종 세트, 크리스마스 코스튬 잠옷, 멋진 새해 가족 룩, 어머니, 어린이 .jpg','가족 크리스마스 잠옷, 귀여운 공룡 패턴 2 종 세트, 크리스마스 코스튬 잠옷, 멋진 새해 가족 룩, 어머니, 어린이 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','아빠 엄마와 나 가족 매칭 옷, 간단한 가족 룩 티셔츠, 아빠 엄마와 나 티셔츠, 아버지 아들 어머니 딸 의상 ',1397,'아빠 엄마와 나 가족 매칭 옷, 간단한 가족 룩 티셔츠, 아빠 엄마와 나 티셔츠, 아버지 아들 어머니 딸 의상 .jpg','아빠 엄마와 나 가족 매칭 옷, 간단한 가족 룩 티셔츠, 아빠 엄마와 나 티셔츠, 아버지 아들 어머니 딸 의상 .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 크리스마스 잠옷 2024 엘크 프린트 매칭 의상, 어머니 딸 룩 잠옷, 어린이 잠옷 세트, 겨울 라운지웨어 PJS ',13895,'가족 크리스마스 잠옷 2024 엘크 프린트 매칭 의상, 어머니 딸 룩 잠옷, 어린이 잠옷 세트, 겨울 라운지웨어 PJS .jpg','가족 크리스마스 잠옷 2024 엘크 프린트 매칭 의상, 어머니 딸 룩 잠옷, 어린이 잠옷 세트, 겨울 라운지웨어 PJS .jpg'); 
INSERT INTO tbl_product (product_no, category_no, product_name, product_price, product_img, product_thumbnail_img)VALUES(product_seq.NEXTVAL,'5','가족 어울리는 옷 의상, 아버지 어머니 딸, 아들 왕 여왕 왕관 티셔츠, 아빠 엄마와 나 아기 드레스 ',7181,'가족 어울리는 옷 의상, 아버지 어머니 딸, 아들 왕 여왕 왕관 티셔츠, 아빠 엄마와 나 아기 드레스 .jpg','가족 어울리는 옷 의상, 아버지 어머니 딸, 아들 왕 여왕 왕관 티셔츠, 아빠 엄마와 나 아기 드레스 .jpg'); 

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
VALUES(inquiry_seq.NEXTVAL, 1, '일반문의 제목입니다1', '일반문의 내용입니다1일반문의 내용입니다1일반문의 내용입니다1일반문의 내용입니다1일반문의 내용입니다1일반문의 내용입니다1일반문의 내용입니다1일반문의 내용입니다1일반문의 내용입니다1일반문의 내용입니다1일반문의 내용입니다1', 'user01');
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer)
VALUES(inquiry_seq.NEXTVAL, 1, '일반문의 제목입니다2', '일반문의 내용입니다2', 'user01');
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer)
VALUES(inquiry_seq.NEXTVAL, 2, '상품문의 제목입니다1', '상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1', 'user01');
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer)
VALUES(inquiry_seq.NEXTVAL, 2, '상품문의 제목입니다2', '상품문의 내용입니다2', 'user01');
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer)
VALUES(inquiry_seq.NEXTVAL, 2, '상품문의 제목입니다3', '상품문의 내용입니다3', 'user01');
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer)
VALUES(inquiry_seq.NEXTVAL, 3, '주문문의 제목입니다1', '상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1상품문의 내용입니다1', 'user01');
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer)
VALUES(inquiry_seq.NEXTVAL, 3, '주문문의 제목입니다2', '주문문의 내용입니다2', 'user01');
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer)
VALUES(inquiry_seq.NEXTVAL, 3, '주문문의 제목입니다3', '주문문의 내용입니다3', 'user01');
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer, ref_no)
VALUES(inquiry_seq.NEXTVAL, 2, '상품문의 제목입니다', '상품문의 내용입니다', 'user02', 1);
INSERT INTO tbl_inquiry(inquiry_no, inquiry_type, inquiry_title, inquiry_content, inquiry_inquirer, ref_no)
VALUES(inquiry_seq.NEXTVAL, 3, '주문문의 제목입니다', '주문문의 내용입니다', 'user03', 1);

SELECT *
FROM tbl_inquiry;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_order)
INSERT INTO tbl_order(order_no, order_price, address_no, member_id)
VALUES(order_seq.NEXTVAL, 20000, 1, 'user01');
INSERT INTO tbl_order(order_no, order_price, address_no, member_id)
VALUES(order_seq.NEXTVAL, 41000, 1, 'user01');
INSERT INTO tbl_order(order_no, order_price, address_no, member_id)
VALUES(order_seq.NEXTVAL, 110000, 1, 'user01');

INSERT INTO tbl_order(order_no, order_price, address_no, member_id)
VALUES(order_seq.NEXTVAL, 10100000, 3, 'user02');
INSERT INTO tbl_order(order_no, order_price, address_no, member_id)
VALUES(order_seq.NEXTVAL, 30000, 5, 'user03');

SELECT *
FROM tbl_order;

COMMIT;

------------------------------ 샘플데이터 넣기(tbl_order_detail)
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 1, 3, 10000, 1);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 1, 1, 10000, 1);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 2, 4, 1000, 1);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 2, 5, 10000, 4);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 3, 1, 10000, 11);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 4, 4, 10000000, 1);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 4, 5, 10000, 10);
INSERT INTO tbl_order_detail(od_no, order_no, product_no, od_price, od_cnt)
VALUES(od_seq.NEXTVAL, 5, 1, 10000, 3);


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

------------------------------ 샘플데이터 넣기(tbl_review)
INSERT INTO tbl_review ( review_no, product_no, member_id, review_content, review_point)
VALUES( review_seq.NEXTVAL, 1, 'user01', '국자가 깨끗하고 단단해요!', 5 );
INSERT INTO tbl_review ( review_no, product_no, member_id, review_content, review_point)
VALUES( review_seq.NEXTVAL, 1, 'user02', '국자가 깨끗하기만해요', 3 );
INSERT INTO tbl_review ( review_no, product_no, member_id, review_content, review_point)
VALUES( review_seq.NEXTVAL, 1, 'user03', '내가 뭘 받은거지?', 1 );

SELECT * 
FROM tbl_review;

COMMIT;