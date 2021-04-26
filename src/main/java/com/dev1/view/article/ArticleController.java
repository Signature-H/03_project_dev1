package com.dev1.view.article;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dev1.springproject.article.ArticleService;
import com.dev1.springproject.article.ArticleVO;
import com.dev1.springproject.member.MemberVO;

@Controller
@SessionAttributes("article")
public class ArticleController {

	@Autowired
	private ArticleService articleService;

	@RequestMapping(value = "/writeArticle.do", method = RequestMethod.GET)
	public String writeArticleForm(ArticleVO vo) {
		return "writeArticleForm.jsp";
	}

	@RequestMapping(value = "/writeArticle.do", method = RequestMethod.POST)
	public String writeArticle(ArticleVO vo) {
		articleService.writeArticle(vo);
		return "list.do";
	}

	@RequestMapping(value = "/updateArticle.do", method = RequestMethod.GET)
	public String updateArticleForm(ArticleVO vo, Model model) {
		return "updateArticleForm.jsp";
	}

	@RequestMapping(value = "/updateArticle.do", method = RequestMethod.POST)
	public String updateArticle(@ModelAttribute("article") ArticleVO vo, Model model) {
		articleService.updateArticle(vo);
		return "readArticle.do?article_no=" + vo.getArticle_no();
	}

	@RequestMapping("/readArticle.do")
	public String readArticle(ArticleVO vo, Model model) {
		model.addAttribute("article", articleService.readArticle(vo));
		return "readArticleForm.jsp";
	}

	@RequestMapping("/list.do")
	public String articleList(ArticleVO vo, Model model) {
		model.addAttribute("articleList", articleService.articleList(vo));
		return "listForm.jsp";
	}

	@RequestMapping("/deleteArticle.do")
	public String deleteBoard(ArticleVO vo, HttpSession session) {
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		ArticleVO avo = (ArticleVO)session.getAttribute("article");
		if(mvo.getId().equals(avo.getWriter_id())) {
			articleService.deleteArticle(vo);
		}
		return "list.do";
	}
}
