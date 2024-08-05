package com.sangjo.mapper;

import java.util.List;

import com.sangjo.vo.CartListVO;

public interface CartListMapper {

    List<CartListVO> selectCartList(String memberId);
}