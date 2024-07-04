package kr.co.literal.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.qos.logback.core.model.Model;

@Controller
@RequestMapping("/cart")
public class CartCont {
	
	public CartCont() {
		System.out.println("-----CartCont() 객체생성");
	}
	
    @GetMapping("/list")
    public String list(Model model) {
        // 실제 장바구니 목록을 가져오는 코드를 여기에 작성하세요.
        // 예시: model.addAttribute("list", cartService.getCartList());
        return "cart/list"; // JSP 파일의 경로
    }
 
	 
	
	
}
