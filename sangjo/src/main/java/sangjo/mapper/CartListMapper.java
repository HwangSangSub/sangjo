package sangjo.mapper;

import java.util.List;

import sangjo.vo.CartListVO;

public interface CartListMapper {

    List<CartListVO> selectCartList(String memberId);
}