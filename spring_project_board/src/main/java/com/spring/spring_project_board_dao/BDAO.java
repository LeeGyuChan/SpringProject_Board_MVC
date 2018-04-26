package com.spring.spring_project_board_dao;

import java.util.List;

import com.spring.spring_project_board_vo.BoardBean;

public interface BDAO {

	public int selectListCount();
	public List<BoardBean> selectArticleList(int page);
	public BoardBean selectArticle(int board_num);
	public int insertArticle(BoardBean article);
	//public void insertReplyArticle(BoardBean article);
	public void updateArticle(BoardBean article);
	public void deleteArticle(BoardBean article);
	public void updateReadCount(int board_num);
	//public void isArticleBoardWriter(int board_num, String pass);
	
}
