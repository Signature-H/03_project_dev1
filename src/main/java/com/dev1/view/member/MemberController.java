package com.dev1.view.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dev1.springproject.member.MemberService;
import com.dev1.springproject.member.MemberVO;

@Controller
@SessionAttributes("member")
public class MemberController {
	@Autowired
	private MemberService memberservice;

	// login
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm(MemberVO vo) {
		return "loginForm.jsp";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		MemberVO mvo = memberservice.login(vo);
		session.setAttribute("member", mvo);
		if (mvo != null)
			return "list.do";
		else
			return "loginForm.jsp";
	}

	// logout
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "list.do";
	}

	// MyInfo
	@RequestMapping("/myInfo.do")
	public String myInfo(@ModelAttribute("member") MemberVO vo) {
		return "myInfoForm.jsp";
	}

	// changeMyInfo
	@RequestMapping(value = "/changeMyInfo.do", method = RequestMethod.GET)
	public String changeMyInfoForm(MemberVO vo) {
		return "changeMyInfoForm.jsp";
	}

	@RequestMapping(value = "/changeMyInfo.do", method = RequestMethod.POST)
	public String changeMyInfo(@ModelAttribute("member") MemberVO vo) {

		if (vo.getPassword() == null || vo.getPassword().isEmpty()) {
			return "changeMyInfoForm.jsp";
		}

		memberservice.changeMyInfo(vo);
		return "myInfoForm.jsp";
	}

	// joinMember
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinForm(MemberVO vo) {
		return "joinForm.jsp";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(MemberVO vo) {
		memberservice.join(vo);
		return "list.do";
	}
}
