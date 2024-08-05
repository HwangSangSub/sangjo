package sangjo.service;

import java.util.List;

import sangjo.vo.CartListVO;


public interface CartListService {

    List<CartListVO> getCartList(String memberId);
}