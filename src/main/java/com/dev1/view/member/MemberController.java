package com.dev1.view.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dev1.springproject.auth.AuthMemberVO;
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
		if (mvo != null)
		{
			AuthMemberVO amvo = new AuthMemberVO();
			amvo.setId(mvo.getId());
			amvo.setName(mvo.getName());
			session.setAttribute("auth", amvo);
			return "list.do";
		}
		else
			return "loginForm.jsp";
	}

	// logout
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:list.do";
	}

	// MyInfo
	@RequestMapping("/myInfo.do")
	public String myInfo(MemberVO vo, HttpSession session) {
		AuthMemberVO amvo = (AuthMemberVO) session.getAttribute("auth");
		if(amvo != null)
		{
			session.setAttribute("member", memberservice.myInfo(amvo));
			return "myInfoForm.jsp";
		}
		return "list.do";
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

	// quitMember
	@RequestMapping(value = "/quit.do", method = RequestMethod.GET)
	public String quitForm(MemberVO vo) {
		return "quitForm.jsp";
	}

	@RequestMapping(value = "/quit.do", method = RequestMethod.POST)
	public String quit(@ModelAttribute("member") MemberVO vo, HttpSession session) {
		MemberVO mvo = memberservice.login(vo);
		if (mvo != null) {
			logout(session);
			memberservice.quit(mvo);
			return "list.do";
		} else {
			return "quitForm.jsp";
		}
	}

	// findId
	@RequestMapping(value = "/findId.do", method = RequestMethod.GET)
	public String findIdForm(MemberVO vo) {
		return "findIdForm.jsp";
	}

	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public String findId(MemberVO vo) {
		memberservice.findId(vo);
		return "findIdSuccess.jsp";
	}

	// findPassword
	@RequestMapping(value = "/findPassword.do", method = RequestMethod.GET)
	public String findPasswordForm(MemberVO vo) {
		return "findPasswordForm.jsp";
	}

	@RequestMapping(value = "/findPassword.do", method = RequestMethod.POST)
	public String findPassword(MemberVO vo) {
		memberservice.findPassword(vo);
		return "findPasswordSuccess.jsp";
	}
}
