package sangjo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	String memberId;
	String memberPw;
	String memberName;
	String memberPhone;
	String memberEmail;
	String memberRank;
	Date regDate;
	Date loginDate;
	Date modDate;
}
