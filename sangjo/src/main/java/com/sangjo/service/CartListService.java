package com.sangjo.service;

import java.util.List;

import com.sangjo.vo.CartListVO;

public interface CartListService {
	List<CartListVO> getCartList(String memberId);

	void removeCartLIst(String cartNo); 
}