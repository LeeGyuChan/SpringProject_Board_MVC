package com.spring.spring_project_board_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.spring_project_board_vo.BoardBean;

@Repository
public class BDAOImpl implements BDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectListCount() {

		return sqlSession.selectOne("selectListCount");
	}

	@Override
	public List<BoardBean> selectArticleList(int page) {

		return sqlSession.selectList("selectArticleList",page);
	}

	@Override
	public BoardBean selectArticle(int board_num) {
		
		return sqlSession.selectOne("selectArticle",board_num);
	}

	@Override
	public void updateArticle(BoardBean article) {
		
		sqlSession.update("updateArticle",article);
	}

	@Override
	public void deleteArticle(BoardBean article) {
		
		sqlSession.delete("deleteArticle",article);
		
	}

	@Override
	public int insertArticle(BoardBean article) {
		
		sqlSession.insert("insertArticle",article);
		return 1;
	}

	@Override
	public void updateReadCount(int board_num) {
		
		sqlSession.update("updateReadCount",board_num);
	}


}
