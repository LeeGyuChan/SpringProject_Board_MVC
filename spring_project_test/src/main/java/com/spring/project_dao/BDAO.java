package com.spring.project_dao;

import java.util.List;

import com.spring.project_vo.BoardVO;
import com.spring.project_vo.FindCriteria;
import com.spring.project_vo.PageCriteria;

public interface BDAO {
	
	public List<BoardVO> listAll(PageCriteria pageCriteria) throws Exception;
	
	public List<BoardVO> listFindAll(FindCriteria findCriteria) throws Exception;
	
	public int listAllCount() throws Exception;
	
	public int listFindCount(FindCriteria findCriteria) throws Exception;
	
	public void updateReplyCount(BoardVO boardVO) throws Exception;
	
	public BoardVO selectArticle(int board_num) throws Exception;
	
	public void insertAritcle(BoardVO boardVO) throws Exception;
	
	public void deleteArticle(BoardVO boardVO) throws Exception;
	
	public void updateArticle(BoardVO boardVO) throws Exception;
	
	public void updateReadCount(int board_num) throws Exception;
	
	public void insertAnswerArticle(BoardVO boardVO) throws Exception;
	
	public void updateAnswerArticle(BoardVO boardVO) throws Exception;
}
