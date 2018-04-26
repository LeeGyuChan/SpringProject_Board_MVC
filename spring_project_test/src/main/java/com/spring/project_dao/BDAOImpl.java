package com.spring.project_dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project_vo.BoardVO;
import com.spring.project_vo.FindCriteria;
import com.spring.project_vo.PageCriteria;

@Repository
public class BDAOImpl implements BDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> listAll(PageCriteria pageCriteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> boardMap = new HashMap<>();
		boardMap.put("pageCriteria", pageCriteria);
		
		return sqlSession.selectList("listAll",boardMap);
	}

	@Override
	public int listAllCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("listAllCount");
	}

	@Override
	public BoardVO selectArticle(int board_num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("selectArticle",board_num);
	}

	@Override
	public void insertAritcle(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("insertArticle",boardVO);
	}

	@Override
	public void deleteArticle(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("deleteArticle",boardVO);
	}
 
	@Override
	public void updateArticle(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("updateArticle",boardVO);
	}

	@Override
	public List<BoardVO> listFindAll(FindCriteria findCriteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> boardMap = new HashMap<>();
		boardMap.put("findCriteria", findCriteria);
		
		return sqlSession.selectList("listFindAll",boardMap);
	}

	@Override
	public int listFindCount(FindCriteria findCriteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> boardMap = new HashMap<>();
		boardMap.put("findCriteria", findCriteria);
		return sqlSession.selectOne("listFindCount",boardMap);
	}

	@Override
	public void updateReadCount(int board_num) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("updateReadCount",board_num);
	}

	@Override
	public void insertAnswerArticle(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("insertAnswerArticle",boardVO);
	}

	@Override
	public void updateAnswerArticle(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("updateAnswerArticle",boardVO);
	}

	@Override
	public void updateReplyCount(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("boardReplyCount", boardVO);
	}

}
