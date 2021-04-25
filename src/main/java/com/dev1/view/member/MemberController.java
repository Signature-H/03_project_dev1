package com.dev1.view.member;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	// joinMember
	@RequestMapping(value = "/joinMember.do", method = RequestMethod.GET)
	public String joinView(MemberVO vo) {
		System.out.println("==> Call joinview() Get method");
		return "login.jsp";
	}

	@RequestMapping(value = "/joinMember.do", method = RequestMethod.POST)
	public String join(MemberVO vo) {
		long timeInMilliSeconds = new java.util.Date().getTime();
		Date now = new Date(timeInMilliSeconds);
		vo.setRegDate(now);
		memberservice.insert(vo);
		return "list.do";
	}

	// login
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginView(MemberVO vo) {
		System.out.println("==> Call loginView() Get method");
		return "login.jsp";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		MemberVO mvo = memberservice.select(vo);
		session.setAttribute("member", mvo);
		if (mvo != null)
			return "list.do";
		else
			return "login.jsp";
	}

	// logout
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "list.do";
	}

	// MyInfo
	@RequestMapping("/MyInfo.do")
	public String MyInfo(@ModelAttribute("member") MemberVO vo) {
		return "MyInfo.jsp";
	}

	// changeMyInfo
	@RequestMapping(value = "/changeMyInfo.do", method = RequestMethod.GET)
	public String changeMyInfoView(MemberVO vo) {
		System.out.println("==> Call changeMyInfoView Get Method");
		return "changeMyInfo.jsp";
	}

	@RequestMapping(value = "/changeMyInfo.do", method = RequestMethod.POST)
	public String changeMyInfo(@ModelAttribute("member") MemberVO vo) {
		
		if(vo.getPassword() == null || vo.getPassword().isEmpty())
		{
			return "changeMyInfo.jsp";
		}
		
		memberservice.changeMyInfo(vo);
		return "myPage.jsp";
	}

}
