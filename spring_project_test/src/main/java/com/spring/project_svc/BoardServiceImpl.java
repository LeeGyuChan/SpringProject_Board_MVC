package com.spring.project_svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project_dao.BDAOImpl;
import com.spring.project_vo.BoardVO;
import com.spring.project_vo.FindCriteria;
import com.spring.project_vo.PageCriteria;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BDAOImpl bDAOImpl;
	@Override
	public void insertAriticle(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		bDAOImpl.insertAritcle(boardVO);
	}

	
	@Override
	public List<BoardVO> boardList(PageCriteria pageCriteria) throws Exception {
		// TODO Auto-generated method stub
		return bDAOImpl.listAll(pageCriteria);
	}

	@Override
	public void modifyArticle(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		bDAOImpl.updateArticle(boardVO);
	}

	@Override
	public void delArticle(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		bDAOImpl.deleteArticle(boardVO);
	}

	@Override
	public int listAllCount() throws Exception {
		// TODO Auto-generated method stub
		return bDAOImpl.listAllCount();
	}


	@Override
	public List<BoardVO> boardFindList(FindCriteria findCriteria) throws Exception {
		// TODO Auto-generated method stub
		return bDAOImpl.listFindAll(findCriteria);
	}


	@Override
	public int listFindCount(FindCriteria findCriteria) throws Exception {
		// TODO Auto-generated method stub
		return bDAOImpl.listFindCount(findCriteria);
	}


	@Override
	public BoardVO selectArticle(int board_num) throws Exception {
		// TODO Auto-generated method stub
		bDAOImpl.updateReadCount(board_num);
		return bDAOImpl.selectArticle(board_num);
	}


	@Override
	public void insertAnswerArticle(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		bDAOImpl.insertAnswerArticle(boardVO);
	}

	@Override
	public void updateAnswerArticle(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		bDAOImpl.updateAnswerArticle(boardVO);
	}


	@Override
	public void boardReplyCount(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		bDAOImpl.updateReplyCount(boardVO);
	}
}
