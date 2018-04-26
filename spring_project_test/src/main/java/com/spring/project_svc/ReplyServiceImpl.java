package com.spring.project_svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project_dao.RDAOImpl;
import com.spring.project_vo.PageCriteria;
import com.spring.project_vo.ReplyBean;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private RDAOImpl rDAOImpl;
	@Override
	public void inputReply(ReplyBean replyBean) throws Exception {
		// TODO Auto-generated method stub
		rDAOImpl.insertArticle(replyBean);
	}

	@Override
	public List<ReplyBean> replyList(Integer board_num) throws Exception {
		// TODO Auto-generated method stub
		return rDAOImpl.selectArticleList(board_num);
	}

	@Override
	public void modifyReply(ReplyBean replyBean) throws Exception {
		// TODO Auto-generated method stub
		rDAOImpl.updateArticle(replyBean);
	}

	@Override
	public void delReply(Integer re_num) throws Exception {
		// TODO Auto-generated method stub
		rDAOImpl.deleteArticle(re_num);
	}

	@Override
	public List<ReplyBean> replyListPage(Integer board_num, PageCriteria pageCriteria) throws Exception {
		// TODO Auto-generated method stub
		return rDAOImpl.reListPage(board_num, pageCriteria);
	}

	@Override
	public int reCount(Integer board_num) throws Exception {
		// TODO Auto-generated method stub
		return rDAOImpl.reCount(board_num);
	}
	
	
}
