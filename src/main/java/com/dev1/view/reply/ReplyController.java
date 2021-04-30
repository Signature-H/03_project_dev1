package com.dev1.view.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dev1.springproject.article.ArticleVO;
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
	public String replyLike(HttpServletRequest request) {
		System.out.println("Call replyLike() method");
		//Map<String, Object> reply_likeMap = request.getParameter("replyInfo");
		
		 System.out.println(request.getParameter("reply_no"));
		 System.out.println(request.getParameter("article_no"));
		 System.out.println(request.getParameter("id"));
		 System.out.println(request.getParameter("reply_like"));
		 
		Reply_likeVO rvo = new Reply_likeVO();
		rvo.setReply_no(Integer.parseInt(request.getParameter("reply_no")));
		rvo.setArticle_no(Integer.parseInt(request.getParameter("article_no")));
		rvo.setId(request.getParameter("article_no"));
		rvo.setReply_like(request.getParameter("reply_like"));
		

		System.out.println("rov.getReply_no : " + rvo.getReply_no());
		System.out.println("rov.getArticle_no : " + rvo.getArticle_no());
		System.out.println("rov.getId : " + rvo.getId());
		System.out.println("rov.getReply_like : " + rvo.getReply_like());
		
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
			break;
		default:
			System.out.println("case Default");
			replyService.replyLike(rvo);
			break;
		}
		
		Map<String, Object> result_map = new HashMap<String, Object>();
		result_map.put("result_like", result_like);
		
		//ArticleVO avo = (ArticleVO) session.getAttribute("article");
		return JSONObject.toJSONString(result_map);
	}

	@RequestMapping("/replyHate.do")
	public String replyHate(Map<String, Object> data, HttpSession session) {
		String reply_like = (String)data.get("reply_like");
		/*
		 * switch(reply_like) { case "T": replyService.replyLikeCancle(data);
		 * replyService.replyHate(data); break; case "F":
		 * replyService.replyHateCancle(data); break; default:
		 * replyService.replyHate(data); break; }
		 */
		
		
		ArticleVO avo = (ArticleVO) session.getAttribute("article");
		return "readArticle.do?article_no=" + avo.getArticle_no();
	}

}
