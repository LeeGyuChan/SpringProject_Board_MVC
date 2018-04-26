package com.spring.spring_project_board_controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.spring_project_board_command.CommandImpl;
import com.spring.spring_project_board_dao.BDAOImpl;
import com.spring.spring_project_board_svc.Upload;
import com.spring.spring_project_board_vo.BoardBean;
import com.spring.spring_project_board_vo.MemberBean;
import com.spring.spring_project_board_vo.PageCriteria;


/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardFrontController{
	
	@Autowired
	private Upload upload;

	@Autowired
	private CommandImpl commandImpl;
	
	
	@RequestMapping("/boardWriteForm.bo")
	public String boardWriteForm(Model model){
		System.out.println("boardWriteForm()");
		
		return "board/qna_board_write";
	}
	
	
	
	
	@RequestMapping(method = RequestMethod.POST, value="/boardWritePro.bo")
	public String boardWritePro(MultipartHttpServletRequest request, Model model) throws Exception{
		System.out.println("boardWritePro()");
		
		if(upload.fileIUpload(request)){
			model.addAttribute("result","파일업로드 성공!!");
		}else{
			model.addAttribute("result","파일업로드 실패!!");
		}
		
		
		model.addAttribute("request",request);
		commandImpl.BoardWrite(model);
		
		return "redirect:home.bo#contact";
	}
	
	@RequestMapping("/home.bo")
	public String boardListView(HttpServletRequest request,Model model) throws Exception{
		System.out.println("boardList()");
		
		model.addAttribute("request", request);
		commandImpl.BoardList(model);

		return "home";
	}
	
	
	@RequestMapping("/boardDetail.bo")
	public String boardDetail(HttpServletRequest request,Model model) throws Exception{
		System.out.println("boardDetail()");
		
		model.addAttribute("request", request);
		commandImpl.BoardDetail(model);
		
		return "board/qna_board_view";
	}
	
	
	@RequestMapping("/boardModifyForm.bo")
	public String boardModifyForm(HttpServletRequest request, Model model) throws Exception{
		System.out.println("boardModifyForm()");
		
		model.addAttribute("request", request);
		commandImpl.BoardModifyForm(model);
		return "board/qna_board_modify";
	}
	
	@RequestMapping(method = RequestMethod.POST, value="/boardModifyPro.bo")
	public String boardModifyPro(HttpServletRequest request, Model model)throws Exception{
		System.out.println("boardModifyPro()");
		
		model.addAttribute("request", request);
		commandImpl.BoardModify(model);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request2 = (HttpServletRequest)map.get("request");
		String nowPage = request2.getParameter("nowPage");
		BoardBean article= (BoardBean)request2.getAttribute("article");
		//return "boardDetail.bo?page="+nowPage+"&board_num="+article.getBOARD_NUM();
		return "redirect:home.bo?"+nowPage+"#contact";
	}
	
	@RequestMapping("/boardReplyForm.bo")
	public String boardReplyForm(HttpServletRequest request,Model model) throws Exception{
		System.out.println("boardReplyForm()");
		
		model.addAttribute("request", request);
		commandImpl.BoardReplyForm(model);
		
		return "board/qna_board_reply";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/boardReplyPro.bo")
	public String boardReplyPro(HttpServletRequest request, Model model) throws Exception{
		System.out.println("boardReplyPro()");
		
		model.addAttribute("request", request);
		commandImpl.BoardReply(model);
		
		return "redirect:home.bo#contact";
	}
	
	@RequestMapping("/boardDeleteForm.bo")
	public String boardDeleteForm(@RequestParam("page") String nowPage, @RequestParam("board_num") int board_num, HttpServletRequest request, Model model){
		System.out.println("boardDeleteForm()");

		//String nowPage = request.getParameter("page");
		request.setAttribute("page", nowPage);
		//int board_num = Integer.parseInt(request.getParameter("board_num"));
		request.setAttribute("board_num", board_num);
		//model.addAttribute("request", request);
		return "board/qna_board_delete";
	}
	@RequestMapping(method=RequestMethod.POST, value="/boardDeletePro.bo")
	public String boardDeletePro(HttpServletRequest request,HttpServletResponse response, Model model) throws Exception{
		System.out.println("boardDeletePro()");
		
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		
		commandImpl.BoardDelete(model);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request2 = (HttpServletRequest)map.get("request");
		String nowPage = request2.getParameter("nowPage");
		
		
		return "redirect:home.bo?"+nowPage+"#contact";
	}
	
	@RequestMapping("/memberJoinForm.bo")
	public String memberJoinForm(Model model) throws Exception{
		System.out.println("memberJoinForm()");
		
		return "joinForm";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/memberJoinPro.bo")
	public String memberJoinPro(HttpServletRequest request, Model model) throws Exception{
		
		System.out.println("memberJoinPro()");
		model.addAttribute("request", request);
		
		commandImpl.MemberJoin(model);
		
		return "redirect:home.bo";
	}
	
	@RequestMapping(method = RequestMethod.POST, value="/login.bo")
	public String login(HttpServletRequest request,Model model,RedirectAttributes redirectAttr) throws Exception{
		System.out.println("login()");

		model.addAttribute("request", request);
		boolean loginResult = commandImpl.MemberLogin(model);
		if(loginResult)
		redirectAttr.addFlashAttribute("MEMBER_ID", request.getParameter("MEMBER_ID"));
		return "redirect:home.bo";
	}
	
	@RequestMapping(method = RequestMethod.POST, value="/logout.bo")
	public String logout(HttpServletRequest request,Model model) throws Exception{
		System.out.println("logout()");
		
		model.addAttribute("request", request);
		commandImpl.MemberLogout(model);
		return "redirect:home.bo";
	}

}
