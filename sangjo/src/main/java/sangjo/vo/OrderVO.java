package sangjo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	//오더
private int OrderNo;
private int OrderPrice;
private int DeliveryPrice;
private String OrderStatus;
private int AddressNo;
private String MemberId;
private Date OrderDate;
private Date DeliveryDate;
private Date CancleDate;
 // 오더디테일
private int OdNo;
private int ProductNo;
private int OdPrice;
private int OdCnt;

}
