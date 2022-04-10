package com.fwm.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fwm.app.service.UserMemberServ;
import com.fwm.app.vo.HandleItem;
import com.fwm.app.vo.Member;

@Controller
public class UserMemberCtrl {

	private UserMemberServ userMemberserv;

	public UserMemberCtrl(UserMemberServ userMemberserv) {
		this.userMemberserv = userMemberserv;
	}

	// 로그인창
	@RequestMapping("/user/member/showLogin")
	public String showLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("loginId") != null) {
			return "/user/common/alert";
		}
		
		if (session.getAttribute("loginId") != null) {
			return """
					<script>
					alert("이미 로그인 되어있음");
					location.replace('/user/item/main');
					</script>
					""";
		}

		return "/user/member/showLogin";
	} 

	// 로그인 실현
	@RequestMapping("/user/member/sessionLogin")
	@ResponseBody
	public String showLogin(HttpServletRequest req, String loginId, String loginPw) {
		HttpSession session = req.getSession();

		boolean loginState = false;


		if (session.getAttribute("loginId") != null) {
			return """
					<script>
					alert("이미 로그인 되어있음");
					location.replace('/user/item/main');
					</script>
					""";
		}

		Member member = userMemberserv.servSelectCheckLoginMember(loginId);

		if (member == null) {
			return """
					<script>
					alert("그런 아이디는 없습니다.");
					location.replace('/user/member/showLogin');
					</script>

					""";
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			return """
					<script>
					alert("비밀번호에 문제가 있습니다.");
					location.replace('/user/member/showLogin');
					</script>

					""";
		}
		
		loginState = true;
		session.setAttribute("loginId", member.getLoginId());

	
		return """
				<script>
				alert("로그인완료.");
				location.replace('/user/item/main');
				</script>
				""";
	}
	
	//로그아웃
	@RequestMapping("/user/member/sessionLogout")
	@ResponseBody
	public String sessionLogout(HttpServletRequest req){
		HttpSession session = req.getSession();

		
		session.removeAttribute("loginId");

		
		return """
				<script>
				alert("로그아웃");
				location.replace('/user/member/showLogin');
				</script>
				""";
		
	}

	// 회원가입창
	@RequestMapping("/user/member/showJoin")
	public String showJoin() {
		return "/user/member/showJoin";
	}

	// 회원가입 실제 진행
	@RequestMapping("/user/member/insertMember")
	@ResponseBody
	public String insertMember(String loginId, String regDate, String loginPw, String name, String nickname,
			String email) {

		String result = userMemberserv.servInsertMember(loginId, regDate, loginPw, name, nickname, email);

		if (result == "중복") {

			return """
					<script>
					alert("중복으로 인해 가입할 수 없습니다");
					location.replace('/user/member/showLogin');
					</script>
					""";
		}

		else {
			return """
					<script>
					alert("가입완료.");
					location.replace('/user/member/showLogin');
					</script>
					""";

		}

	}

}