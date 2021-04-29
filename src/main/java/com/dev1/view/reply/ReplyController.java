package com.dev1.view.reply;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		model.addAttribute("replyList", replyService.replyList(vo));
		model.addAttribute("reply_likeList", replyService.reply_likeList(lvo));
		return "readArticleForm.jsp";
	}

	@RequestMapping("/replyLike.do")
	public String replyLike(ReplyVO vo, HttpSession session) {
		ArticleVO avo = (ArticleVO) session.getAttribute("article");
		replyService.replyLike(vo);
		return "readArticle.do?article_no=" + avo.getArticle_no();
	}

	@RequestMapping("/replyLikeCancle.do")
	public String replyLikeCancle(ReplyVO vo, HttpSession session) {
		ArticleVO avo = (ArticleVO) session.getAttribute("article");
		replyService.replyLikeCancle(vo);
		return "readArticle.do?article_no=" + avo.getArticle_no();
	}

	@RequestMapping("/replyHate.do")
	public String replyHate(ReplyVO vo, HttpSession session) {
		ArticleVO avo = (ArticleVO) session.getAttribute("article");
		replyService.replyHate(vo);
		return "readArticle.do?article_no=" + avo.getArticle_no();
	}

	@RequestMapping("/replyHateCancle.do")
	public String replyHateCancle(ReplyVO vo, HttpSession session) {
		ArticleVO avo = (ArticleVO) session.getAttribute("article");
		replyService.replyHateCancle(vo);
		return "readArticle.do?article_no=" + avo.getArticle_no();
	}
}
