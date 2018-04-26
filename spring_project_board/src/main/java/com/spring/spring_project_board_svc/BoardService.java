package com.spring.spring_project_board_svc;

import java.util.ArrayList;

import com.spring.spring_project_board_vo.BoardBean;

public interface BoardService {
	//isArticleWriter

	public boolean isArticleWriter(int board_num, String pass)throws Exception;
	
	//BoardModifyProService
	public boolean modifyArticle(BoardBean article)throws Exception;

	//BoardreplyProService
	public boolean replyArticle(BoardBean article)throws Exception;
	
	//BoardListService
	public int getListCount()throws Exception;
	public ArrayList<BoardBean> getArticleList(int page, int limit)throws Exception;
	
	//BoardDetailProService
	//getArticle
	public BoardBean getArticle (int board_num) throws Exception;
	
	//BoardDeleteProService
	public boolean removeArticle(BoardBean article) throws Exception;
	
	//BoardWriteProService
	public boolean registArticle(BoardBean boardBean)throws Exception;
	
	
}
