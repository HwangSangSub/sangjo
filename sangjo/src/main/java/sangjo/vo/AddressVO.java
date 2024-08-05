package sangjo.vo;

import lombok.Data;

@Data
public class AddressVO {
	int addressNo;
	String memberId;
	int addressCode;
	String addressMain;
	String addressDetail;
	int idDefault;// 1이면 매인 주소 0이면 서브 주소이다.
}
