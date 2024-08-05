package sangjo.service;

import org.apache.ibatis.session.SqlSession;

import sangjo.common.DataSource;
import sangjo.mapper.AddressMapper;
import sangjo.vo.AddressVO;

public class AddressServiceImpl implements AddressService{

	SqlSession sqlSession = 
			DataSource.getInstance().openSession(true);
	AddressMapper mapper 
		= sqlSession.getMapper(AddressMapper.class);
	@Override
	public boolean addAddress(AddressVO addressVO) {
		return mapper.insertAddress(addressVO) == 1;
	}

}
