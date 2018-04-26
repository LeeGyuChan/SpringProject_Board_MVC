package com.spring.spring_project_board_dao;

import java.util.List;

import com.spring.spring_project_board_vo.PageCriteria;
import com.spring.spring_project_board_vo.ReplyBean;

public interface RDAO {

	public List<ReplyBean> selectArticleList(Integer board_num) throws Exception;
	
	public void insertArticle(ReplyBean article) throws Exception;
	
	public void updateArticle(ReplyBean article) throws Exception;
	
	public void deleteArticle(Integer re_num) throws Exception;
	
	public List<ReplyBean> reListPage(Integer board_num, PageCriteria pageCriteria) throws Exception;
	
	public int reCount(Integer board_num) throws Exception;
}
