package com.dev1.view.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dev1.springproject.auth.AuthMemberVO;
import com.dev1.springproject.reply.ReplyService;
import com.dev1.springproject.reply.ReplyVO;
import com.dev1.springproject.reply.Reply_likeVO;

@Controller
@SessionAttributes("reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	@RequestMapping("/writeReply.do")
	public String writeReply(ReplyVO vo) {
		replyService.writeReply(vo);
		return "readArticle.do";
	}

	@RequestMapping("/replyList.do")
	public String replyList(ReplyVO vo, Reply_likeVO lvo, Model model, HttpSession session) {
		System.out.println("Call replyList() method");
		
		try {
			AuthMemberVO mvo = (AuthMemberVO) session.getAttribute("auth");
			lvo.setId(mvo.getId());
		} catch (NullPointerException e) {
			lvo.setId("");
		}
		
		List<ReplyVO> replyList =replyService.replyList(vo); 
		for (ReplyVO rvo : replyList) {
			for (Reply_likeVO rlvo : replyService.reply_likeList(lvo)) {
				if (rvo.getReply_no() == rlvo.getReply_no()) {
					rvo.setReply_like(rlvo.getReply_like());
					System.out.println(rlvo.getReply_like());
				}
			}
		}

		model.addAttribute("replyList", replyList);
		return "readArticleForm.jsp";
	}

	@RequestMapping("/replyLike.do")
	@ResponseBody
	public String replyLike(HttpServletRequest request) throws Exception {
		System.out.println("Call replyLike() method");
		
		AuthMemberVO amvo = (AuthMemberVO)request.getSession().getAttribute("auth");
		if(amvo == null)
		{
			return "N";
		}
		
		
		Reply_likeVO rvo = new Reply_likeVO();
		rvo.setReply_no(Integer.parseInt(request.getParameter("reply_no")));
		rvo.setArticle_no(Integer.parseInt(request.getParameter("article_no")));
		rvo.setId(request.getParameter("id"));
		rvo.setReply_like(request.getParameter("reply_like"));
		
		String result_like = "";
		switch(rvo.getReply_like()) {
		case "T":
			System.out.println("case T");
			replyService.replyLikeCancle(rvo);
			break;
		case "F":
			System.out.println("case F");
			replyService.replyHateCancle(rvo);
			replyService.replyLike(rvo);
			result_like = "T";
			break;
		default:
			System.out.println("case Default");
			replyService.replyLike(rvo);
			result_like = "T";
			break;
		}
		
		return result_like;
	}

	@RequestMapping("/replyHate.do")
	@ResponseBody
	public String replyHate(HttpServletRequest request) {
		System.out.println("Call replyHate() method");
		
		AuthMemberVO amvo = (AuthMemberVO)request.getSession().getAttribute("auth");
		if(amvo == null)
		{
			return "N";
		}
		
		Reply_likeVO rvo = new Reply_likeVO();
		rvo.setReply_no(Integer.parseInt(request.getParameter("reply_no")));
		rvo.setArticle_no(Integer.parseInt(request.getParameter("article_no")));
		rvo.setId(request.getParameter("id"));
		rvo.setReply_like(request.getParameter("reply_like"));
		
		String result_like = "";
		switch(rvo.getReply_like()) {
		case "T": 
			replyService.replyLikeCancle(rvo);
			replyService.replyHate(rvo);
			result_like = "F";
			break;
		case "F": 
			replyService.replyHateCancle(rvo);
			break;
		default : 
			replyService.replyHate(rvo);
			result_like = "F";
			break; 
		}
		
		
		
		return result_like;
	}

}
