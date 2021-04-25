package com.dev1.view.board;


import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dev1.springproject.board.BoardService;
import com.dev1.springproject.board.BoardVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	//Write Article
	@RequestMapping(value = "/writeArticle.do", method = RequestMethod.GET)
	public String InsertForm(BoardVO vo) {
		return "writeBoard.jsp";
	}
	
	@RequestMapping(value = "/writeArticle.do", method = RequestMethod.POST)
	public String InsertBoard(BoardVO vo) {
		long timeInMilliSeconds = new java.util.Date().getTime();
		Date now = new Date(timeInMilliSeconds);
		vo.setRegDate(now);
		vo.setModDate(now);
		vo.setRead_cnt(0);
		boardService.insertBoard(vo);
		return "list.do";
	}
	
	@RequestMapping(value="/getArticle.do", params= {"number"})
	public String getBoard(BoardVO vo, Model model, @RequestParam("number") int number)
	{
		//Save to Select Article
		vo.setNumber(number);
		model.addAttribute("board", boardService.getBoard(vo));
		return "getBoard.jsp";
	}
	
	//Update Article
	@RequestMapping(value="/updateArticle.do", method=RequestMethod.GET)
	public String updateGetBoard(BoardVO vo, Model model)
	{
		//Move to "updateBoard.jsp"
		return "updateBoard.jsp";
	}
	
	@RequestMapping(value="/updateArticle.do", method=RequestMethod.POST)
	public String updatePostBoard(@ModelAttribute("board") BoardVO vo, Model model)
	{
		//Update to Select Article
		long timeInMilliSeconds = new java.util.Date().getTime();
		Date now = new Date(timeInMilliSeconds);
		vo.setModDate(now);
		boardService.updateBoard(vo);
		return "list.do";
	}
	
	//Viewing a Board
	@RequestMapping("/list.do")
	public String getBoardList(BoardVO vo, Model model) {
		//Model ���� ����
	model.addAttribute("boardList", boardService.getBoardList(vo));
	return "getBoardList.jsp"; // view �̸� ����
	}
	
	//Delete Article
	@RequestMapping(value="/deleteArticle.do", params = {"number"})
	public String deleteBoard(BoardVO vo, @RequestParam("number") int number)
	{
		vo.setNumber(number);
		boardService.deleteBoard(vo);
		return "redirect:list.do";
	}
}
