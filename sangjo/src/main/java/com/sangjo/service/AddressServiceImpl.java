package com.sangjo.service;

import org.apache.ibatis.session.SqlSession;

import com.sangjo.common.DataSource;
import com.sangjo.mapper.AddressMapper;
import com.sangjo.vo.AddressVO;

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
