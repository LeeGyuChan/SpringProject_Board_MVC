package com.spring.project_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project_svc.BoardServiceImpl;
import com.spring.project_vo.BoardVO;
import com.spring.project_vo.FindCriteria;

@Controller
public class FrontController {

	@Autowired
	private BoardServiceImpl boardServiceImpl;
	
	@RequestMapping("/login")
	public String login(){
		System.out.println("login()");
		
		return "security/login";
	}
	
	@RequestMapping("/test")
	public String test(){
		System.out.println("test()");
		
		return "test";
	}
	
	
	@RequestMapping("/boardWriteForm")
	public String boardWriteForm(){
		System.out.println("boardWriteForm()");
		
		return "board/board_write_Form";
	}
	
	@RequestMapping("/home")
	public String homeView(FindCriteria findCriteria, Model model) throws Exception{
		System.out.println("homeView()");
		model.addAttribute("findCriteria", findCriteria);
		return "home";
	}             
	
	
	@RequestMapping(method = RequestMethod.POST, value="/boardWritePro")
	public String boardWritePro(BoardVO boardVO) throws Exception{
		System.out.println("boardWritePro()");
		
		boardServiceImpl.insertAriticle(boardVO);
		
		return "redirect:home";
	}
	
	@RequestMapping("/boardDetail")
	public String boardDetail(Model model, @RequestParam("board_num") int board_num, FindCriteria findCriteria) throws Exception{
		System.out.println("boardDetail()");
		
		BoardVO selectedArticle = boardServiceImpl.selectArticle(board_num);
		model.addAttribute("selectedArticle",selectedArticle);
		model.addAttribute("findCriteria", findCriteria);
		
		return "/board/board_detail";
	}
	
	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam("board_num") int board_num, FindCriteria findCriteria, Model model) throws Exception{
		System.out.println("boardDelete()");
		
		BoardVO selectedArticle = boardServiceImpl.selectArticle(board_num);
		model.addAttribute("selectedArticle", selectedArticle);
		model.addAttribute("findCriteria", findCriteria);
		
		return "/board/board_delete";
	}   
	
	@RequestMapping("/boardModifyForm")
	public String boardModifyForm(Model model, @RequestParam("board_num") int board_num, FindCriteria findCriteria )throws Exception{
		System.out.println("boardModifyForm()");
		
		BoardVO selectedArticle = boardServiceImpl.selectArticle(board_num);
		model.addAttribute("selectedArticle",selectedArticle);
		model.addAttribute("findCriteria", findCriteria);
		
		return "/board/board_modify_Form";
	}
	
	@RequestMapping(method = RequestMethod.POST, value="/boardModifyPro")
	public String boardModifyPro(BoardVO boardVO,FindCriteria findCriteria, Model model) throws Exception{
		System.out.println("boardModifyPro()");
		
		boardServiceImpl.modifyArticle(boardVO);
		model.addAttribute("findCriteria", findCriteria);
		
		return "redirect:home";
	}
	
	@RequestMapping("/boardAnswerForm")
	public String boardAnswerForm(@RequestParam("board_num") int board_num, FindCriteria findCriteria, Model model) throws Exception{
		System.out.println("boardAnswerForm()");
		
		BoardVO selectedArticle = boardServiceImpl.selectArticle(board_num);
		model.addAttribute("selectedArticle", selectedArticle);
		model.addAttribute("findCriteria", findCriteria);
		
		return "/board/board_answer";
	}
	
	@RequestMapping(method = RequestMethod.POST, value="/boardAnswerPro")
	public String boardAnswerPro(BoardVO boardVO) throws Exception{
		System.out.println("boardAnswerPro()");
		
		boardServiceImpl.updateAnswerArticle(boardVO);
		boardServiceImpl.insertAnswerArticle(boardVO);
		
		return "redirect:home";
	}
	
	
}
	
