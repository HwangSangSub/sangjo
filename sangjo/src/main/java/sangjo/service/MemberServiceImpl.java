package sangjo.service;

import org.apache.ibatis.session.SqlSession;

import sangjo.common.DataSource;
import sangjo.mapper.MemberMapper;
import sangjo.vo.MemberVO;

public class MemberServiceImpl implements MemberService{

	SqlSession sqlSession = 
			DataSource.getInstance().openSession(true);
	MemberMapper mapper 
		= sqlSession.getMapper(MemberMapper.class);
	
	@Override
	public MemberVO getMemberById(String memberId) {
		return mapper.selectMemberById(memberId);
	}

	@Override
	public MemberVO getMemberByLogin(String memberId, String memberPw) {
		return mapper.selectMemberByIdPw(memberId,memberPw);
	}

	@Override
	public boolean join(MemberVO memberVO) {
		return mapper.insertMember(memberVO) == 1;
	}
	
}
