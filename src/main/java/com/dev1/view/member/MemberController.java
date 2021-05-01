package com.dev1.view.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

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
		if (mvo != null) {
			AuthMemberVO amvo = new AuthMemberVO();
			amvo.setId(mvo.getId());
			amvo.setName(mvo.getName());
			amvo.setManager(mvo.getManager());
			session.setAttribute("auth", amvo);
			return "list.do";
		} else
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
		if (amvo != null) {
			vo.setId(amvo.getId());
			session.setAttribute("member", memberservice.myInfo(vo));
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
	public String changeMyInfo(@ModelAttribute("member") MemberVO vo) throws IOException {

		if (vo.getPassword() == null || vo.getPassword().isEmpty()) {
			return "changeMyInfoForm.jsp";
		}else {
			if(vo.getPath() != null) {
				File file = new File(vo.getPath());
				file.delete();
			}
			MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String origFileName = uploadFile.getOriginalFilename();
			String path = "C:/images/" + vo.getId() + "." + origFileName.substring(origFileName.lastIndexOf(".") + 1);
//			String path= getClass().getResource("/file/"+fileName).getPath();
			vo.setPath(path);
			uploadFile.transferTo(new File(path));
		} else {
			vo.setPath("C:/images/default.jpeg");
		}
		memberservice.changeMyInfo(vo);
		return "myInfoForm.jsp";}
	}
	// joinMember
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinForm(MemberVO vo) {
		return "joinForm.jsp";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(MemberVO vo) throws IOException {

		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {
			String origFileName = uploadFile.getOriginalFilename();
			String path = "C:/images/" + vo.getId() + "." + origFileName.substring(origFileName.lastIndexOf(".") + 1);
//			String path= getClass().getResource("/file/"+fileName).getPath();
			vo.setPath(path);
			uploadFile.transferTo(new File(path));
		} else {
			vo.setPath("C:/images/default.jpeg");
		}
		memberservice.join(vo);
		return "list.do";
	}

	// joinManager
	@RequestMapping(value = "/joinManager.do", method = RequestMethod.GET)
	public String joinManagerForm(MemberVO vo) {
		return "joinManagerForm.jsp";
	}

	@RequestMapping(value = "/joinManager.do", method = RequestMethod.POST)
	public String joinManager(MemberVO vo) throws IOException {

		MultipartFile uploadFile = vo.getUploadFile();
		if (vo.getManagerCode().equals("1234")) {
			if (!uploadFile.isEmpty()) {
				String origFileName = uploadFile.getOriginalFilename();
				String path = "C:/images/" + vo.getId() + "."
						+ origFileName.substring(origFileName.lastIndexOf(".") + 1);
//				String path= getClass().getResource("/file/"+fileName).getPath();
				vo.setPath(path);
				uploadFile.transferTo(new File(path));
			} else {
				vo.setPath("C:/images/default.jpeg");
			}

			memberservice.joinManager(vo);
			return "list.do";
		} else {
			return "joinManager.do";
		}
	}

	// quitMember
	@RequestMapping(value = "/quit.do", method = RequestMethod.GET)
	public String quitForm(MemberVO vo) {
		return "quitForm.jsp";
	}

	@RequestMapping(value = "/quit.do", method = RequestMethod.POST)
	public String quit(MemberVO vo, HttpSession session) {
		MemberVO mvo = memberservice.login(vo);
		if (mvo != null) {
			logout(session);
			memberservice.quit(mvo);
			// ������ �����Ѵٸ� ����
			if(vo.getPath() != null) {
				File file = new File(vo.getPath());
				file.delete();
			}
			return "list.do";
		} else {
			return "quitForm.jsp";
		}
	}

	// findId
	@RequestMapping(value = "/findId.do", method = RequestMethod.GET)
	public String findIdForm(MemberVO vo) {
		return "findId_PwPopup.jsp";
	}

	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public String findId(MemberVO vo, HttpSession session) {
		MemberVO mvo = memberservice.findId(vo);
		String id = "";

		if (mvo != null) {
			id = mvo.getId();
		}
		session.setAttribute("ID", id);
		return "findIdSuccess.jsp";
	}

	// findPassword
	@RequestMapping(value = "/findPassword.do", method = RequestMethod.GET)
	public String findPasswordForm(MemberVO vo) {
		return "findId_PwPopup.jsp";
	}

	@RequestMapping(value = "/findPassword.do", method = RequestMethod.POST)
	public String findPassword(MemberVO vo, HttpSession session) {
		MemberVO mvo = memberservice.findPassword(vo);
		String password = "";

		if (mvo != null) {
			password = mvo.getPassword();
		}

		session.setAttribute("PASSWORD", password);
		return "findPasswordSuccess.jsp";
	}
}
