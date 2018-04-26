package com.spring.spring_project_board_command;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.spring_project_board_dao.BDAO;
import com.spring.spring_project_board_dao.BDAOImpl;
import com.spring.spring_project_board_svc.BoardServiceImpl;
import com.spring.spring_project_board_svc.MemberServiceImpl;
import com.spring.spring_project_board_vo.BoardBean;
import com.spring.spring_project_board_vo.MemberBean;
import com.spring.spring_project_board_vo.PageInfo;

@Service
public class CommandImpl implements command{
	
	@Autowired
	private BoardServiceImpl boardServiceImpl;
	
	@Autowired MemberServiceImpl memberServiceImpl;
	
	@Autowired
	private BDAOImpl bDAOImpl;
	
	@Override
	public void BoardDelete(Model model) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String nowPage = request.getParameter("page");

		boolean isArticleWriter = boardServiceImpl.isArticleWriter(board_num,request.getParameter("BOARD_PASS"));
		//BoardBean article = boardServiceImpl.getArticle(board_num);
		if(isArticleWriter){
		BoardBean article =bDAOImpl.selectArticle(board_num);
		bDAOImpl.deleteArticle(article);
		model.addAttribute("nowPage", nowPage);
		}
		/*if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다.')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			
			//boolean isDeleteSuccess=boardServiceImpl.removeArticle(article);
			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패.')");
				out.println("history.back();");
				out.println("</script>");				
			}
			else{
				model.addAttribute("nowPage", nowPage);
			}

		}
		*/
	}

	@Override
	public void BoardDetail(Model model) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		//BoardBean article = boardServiceImpl.getArticle(board_num);
		BoardBean article = bDAOImpl.selectArticle(board_num);
		
		request.setAttribute("page", page);
		request.setAttribute("article", article);
		
		model.addAttribute("request", request);
	}

	@Override
	public void BoardList(Model model) throws Exception {
		// TODO Auto-generated method stub
		
		//ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		int page = 1;
		int limit =10;
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		if(request!=null&&request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		int startrow=(page-1)*10;
	
		//int listCount = boardServiceImpl.getListCount();
		
		int listCount = bDAOImpl.selectListCount();
		//articleList = boardServiceImpl.getArticleList(page,limit);
		
		
		int maxPage=(int)((double)listCount/limit+0.95);
		
		int startPage = (((int)((double)page/ 10+0.9))-1)*10+1;
		int endPage = startPage+10-1;
		
		if(endPage>maxPage) endPage=maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		model.addAttribute("pageInfo", pageInfo);
		//model.addAttribute("articleList", articleList);
		model.addAttribute("articleList",bDAOImpl.selectArticleList(startrow));
	}

	@Override
	public void BoardModifyForm(Model model) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		//BoardBean article = boardServiceImpl.getArticle(board_num);
		BoardBean article = bDAOImpl.selectArticle(board_num);
		String nowPage = request.getParameter("page");
		request.setAttribute("article",article);
		request.setAttribute("page", nowPage);
		model.addAttribute("request", request);
		
	}

	@Override
	public void BoardReplyForm(Model model) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String nowPage = request.getParameter("page");
		int board_num =  Integer.parseInt(request.getParameter("board_num"));
		
		//BoardBean article = boardServiceImpl.getArticle(board_num);
		BoardBean article = bDAOImpl.selectArticle(board_num);
		request.setAttribute("article", article);
		request.setAttribute("page", nowPage);
		model.addAttribute("request", request);
	}

	@Override
	public void BoardReply(Model model) throws Exception {
		// TODO Auto-generated method stub
		
		 Map<String, Object> map = model.asMap();
		 HttpServletRequest request = (HttpServletRequest)map.get("request");
		 HttpServletResponse response = null;
		 String nowPage = request.getParameter("page");
		 BoardBean article = new BoardBean();
		 article.setBOARD_NUM(Integer.parseInt(request.getParameter("BOARD_NUM")));
		 article.setBOARD_NAME(request.getParameter("BOARD_NAME"));
		 article.setBOARD_PASS(request.getParameter("BOARD_PASS"));
		 article.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		 article.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		 article.setBOARD_RE_REF(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
		 article.setBOARD_RE_LEV(Integer.parseInt(request.getParameter("BOARD_RE_LEV")));
		 article.setBOARD_RE_SEQ(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));
		 boolean isReplySuccess = boardServiceImpl.replyArticle(article);
		 
		 if(isReplySuccess){

		 }
		 else{
			 response.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('답장실패')");
			 out.println(" history.back(){");
			 out.println("</script>");
		 }		
		 request.setAttribute("article", article);
		 model.addAttribute("request", request);
	}

	@Override
	public void BoardWrite(Model model) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		
		BoardBean boardBean = new BoardBean();
	
		boardBean.setBOARD_NAME(request.getParameter("BOARD_NAME"));
		boardBean.setBOARD_PASS(request.getParameter("BOARD_PASS"));
		boardBean.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		boardBean.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		boardBean.setBOARD_FILE("");
		
		//boolean isWriteSuccess = boardServiceImpl.registArticle(boardBean);
		int isWriteSuccess = bDAOImpl.insertArticle(boardBean);
		if(isWriteSuccess>0){
			/*response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");*/
		}
		else{
			
			model.addAttribute("article", boardBean);
		}
	}

	@Override
	public void BoardModify(Model model) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
	/*	HttpServletResponse response = null;
		boolean isModifySuccess =false;*/
		int board_num = Integer.parseInt(request.getParameter("BOARD_NUM"));
		String nowPage = request.getParameter("page");
		BoardBean article = new BoardBean();
		boolean isRightUser = boardServiceImpl.isArticleWriter(board_num,request.getParameter("BOARD_PASS"));
		article.setBOARD_NUM(board_num);
		article.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		article.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		if(isRightUser){
			bDAOImpl.updateArticle(article);
		}
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("article",article);
		model.addAttribute("request", request);
		
		/*if(!isRightUser){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			article.setBOARD_NUM(board_num);
			article.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
			article.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
			//isModifySuccess=boardServiceImpl.modifyArticle(article);
			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패.')");
				out.println("history.back();");
				out.println("</script>");				
			}
			else{
				request.setAttribute("nowPage", nowPage);
				request.setAttribute("article",article);
				model.addAttribute("request", request);
				
			}
	
		
		}*/
	}

	@Override
	public void MemberJoin(Model model) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		MemberBean member=new MemberBean();
   		boolean joinResult=false;
   		
   		member.setMEMBER_ID(request.getParameter("MEMBER_ID"));
   		member.setMEMBER_PW(request.getParameter("MEMBER_PW"));
   		member.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
   		member.setMEMBER_AGE(Integer.parseInt(request.getParameter("MEMBER_AGE")));
   		member.setMEMBER_GENDER(request.getParameter("MEMBER_GENDER"));
   		member.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL"));
   		
   		joinResult=memberServiceImpl.joinMember(member);
   		
   	
   		if(joinResult==false){
   			/*response.setContentType("text/html;charset=UTF-8");
   			PrintWriter out = response.getWriter();
   			out.println("<script>");
   			out.println("alert('ȸ����Ͻ���')");
   			out.println("history.back()");
   			out.println("</script>");*/
	   	}
   		else{

   		//forward.setPath("./memberLogin.me");
   		}
	}

	@Override
	public boolean MemberLogin(Model model) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session=request.getSession();
   		
		MemberBean member=new MemberBean();
   		member.setMEMBER_ID(request.getParameter("MEMBER_ID"));
   		member.setMEMBER_PW(request.getParameter("MEMBER_PW"));
   		
   		
   		boolean loginResult = memberServiceImpl.login(member);
   	
   		if(loginResult){
   	    
   		session.setAttribute("id", member.getMEMBER_ID());
   		
   		request.setAttribute("MEMBER_ID", member.getMEMBER_ID());
   		}
   		else{
   			
   			/*response.setContentType("text/html;charset=euc-kr");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('�α��� ����');");
	   		out.println("location.href='./memberLogin.me';");
	   		out.println("</script>");*/
   		}
   		return loginResult;
	}

	@Override
	public void MemberLogout(Model model) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session=request.getSession();
		session.invalidate();
		
	}

}
