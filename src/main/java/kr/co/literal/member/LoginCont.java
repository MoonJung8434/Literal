/*
 * package kr.co.literal.member;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.security.core.annotation.AuthenticationPrincipal; import
 * org.springframework.security.oauth2.core.user.OAuth2User; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping;
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * @Controller public class LoginCont {
 * 
 * @Autowired private MemberService memberService;
 * 
 * @GetMapping("/login") public String loginPage() { return "member/loginForm";
 * }
 * 
 * @GetMapping("/loginSuccess") public String
 * loginSuccess(@AuthenticationPrincipal OAuth2User oAuth2User, Model model,
 * HttpSession session) { String name = oAuth2User.getAttribute("name"); String
 * email = oAuth2User.getAttribute("email");
 * 
 * MemberDTO member = memberService.getMemberByEmail(email); if (member != null)
 * { session.setAttribute("member", member); model.addAttribute("member",
 * member); return "member/welcome"; } else { session.setAttribute("tempEmail",
 * email); session.setAttribute("tempName", name); return
 * "redirect:/member/checkSignUp"; } }
 * 
 * @GetMapping("/loginFailure") public String loginFailure() { return
 * "member/loginFailure"; } }
 * 
 * }//class end
 */