package com.spring.spring_project_board_svc;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.spring_project_board_dao.BoardDAO;
import com.spring.spring_project_board_vo.BoardBean;

@Transactional
@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO boardDAO;
	
	
	@Override
	public boolean isArticleWriter(int board_num, String pass) throws Exception {
		boolean isArticleWriter = false;

		isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);
		return isArticleWriter;
	}

	@Override
	public boolean modifyArticle(BoardBean article) throws Exception {
		
		boolean isModifySuccess = false;
		int updateCount = boardDAO.updateArticle(article);
		
		if(updateCount>0){
			isModifySuccess=true;
			}

		return isModifySuccess; 
	}

	@Override
	public boolean replyArticle(BoardBean article) throws Exception {
		
		boolean isReplySuccess = false;
		int insertCount =0;

		insertCount = boardDAO.insertReplyArticle(article);
		
		if(insertCount>0){
			isReplySuccess = true;
		}
		return isReplySuccess;
	}

	@Override
	public int getListCount() throws Exception {
		
		int listCount =0;
		listCount = boardDAO.selectListCount();
		
		return listCount;
	}

	@Override
	public ArrayList<BoardBean> getArticleList(int page, int limit) throws Exception {
		
		ArrayList<BoardBean> articleList = null;
		articleList = boardDAO.selectArticleList(page, limit);

		return articleList;
	}

	@Override
	public BoardBean getArticle(int board_num) throws Exception {

		BoardBean article = null;

		boardDAO.updateReadCount(board_num);
		article = boardDAO.selectArticle(board_num);
	
		return article;
	}

	@Override
	public boolean removeArticle(BoardBean article) throws Exception {
		
		boolean isRemoveSuccess = false;
		int deleteCount= boardDAO.deleteArticle(article);
		
		if(deleteCount>0){
			isRemoveSuccess = true;		
		}

		return isRemoveSuccess;
	}

	@Override
	public boolean registArticle(BoardBean boardBean) throws Exception {
		
		boolean isWriteSuccess = false;

		 int insertCount = boardDAO.insertArticle(boardBean);
		 
		if(insertCount>0){
			 isWriteSuccess = true;
		 }

		return isWriteSuccess;
	}

}
