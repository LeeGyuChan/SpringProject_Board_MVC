package com.spring.project_dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project_vo.PageCriteria;
import com.spring.project_vo.ReplyBean;

@Repository
public class RDAOImpl implements RDAO{

	@Autowired
	private SqlSession sqlSession2;
	
	@Override
	public List<ReplyBean> selectArticleList(Integer board_num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession2.selectList("selectArticleList",board_num);
	}

	@Override
	public void insertArticle(ReplyBean article) throws Exception {
		// TODO Auto-generated method stub
		sqlSession2.insert("insertArticle", article);
	}

	@Override
	public void updateArticle(ReplyBean article) throws Exception {
		// TODO Auto-generated method stub
		sqlSession2.update("updateArticle",article);
	}

	@Override
	public void deleteArticle(Integer re_num) throws Exception {
		// TODO Auto-generated method stub
		sqlSession2.delete("deleteArticle",re_num);
	}

	@Override
	public List<ReplyBean> reListPage(Integer board_num, PageCriteria pageCriteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> reMap = new HashMap<>();
		
		reMap.put("board_num",board_num);
		reMap.put("pageCriteria",pageCriteria);
		
		return sqlSession2.selectList("reListPage",reMap);
	}

	@Override
	public int reCount(Integer board_num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession2.selectOne("reCount",board_num);
	}


}
