package com.spring.project_svc;

import java.util.List;

import com.spring.project_vo.BoardVO;
import com.spring.project_vo.FindCriteria;
import com.spring.project_vo.PageCriteria;

public interface BoardService {

	public void insertAriticle(BoardVO boardVO) throws Exception;
	
	public BoardVO selectArticle(int board_num) throws Exception;
	
	public List<BoardVO> boardList(PageCriteria pageCriteria)  throws Exception;
	
	public void boardReplyCount(BoardVO boardVO) throws Exception;
	
	public void modifyArticle(BoardVO boardVO) throws Exception;
	
	public void delArticle(BoardVO boardVO) throws Exception;
	
	public int listAllCount() throws Exception;
	
	public List<BoardVO> boardFindList(FindCriteria findCriteria) throws Exception;
	
	public int listFindCount(FindCriteria findCriteria) throws Exception;
	
	public void insertAnswerArticle(BoardVO boardVO) throws Exception;
	
	public void updateAnswerArticle(BoardVO boardVO) throws Exception;
	
}
