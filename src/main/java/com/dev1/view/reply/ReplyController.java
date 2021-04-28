package com.dev1.view.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dev1.springproject.reply.ReplyService;
import com.dev1.springproject.reply.ReplyVO;

@Controller
@SessionAttributes("reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	@RequestMapping("/writeReply.do")
	public String writeReply(ReplyVO vo) {
		replyService.writeReply(vo);
		return "readArticle.do?article_no="+vo.getArticle_no();
	}
}
