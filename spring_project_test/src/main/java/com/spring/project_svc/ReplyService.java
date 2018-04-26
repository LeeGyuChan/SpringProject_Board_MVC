package com.spring.project_svc;

import java.util.List;

import com.spring.project_vo.PageCriteria;
import com.spring.project_vo.ReplyBean;

public interface ReplyService {
	
	public void inputReply(ReplyBean replyBean) throws Exception;
	
	public List<ReplyBean> replyList(Integer board_num)  throws Exception;
	
	public void modifyReply(ReplyBean replyBean) throws Exception;
	
	public void delReply(Integer re_num) throws Exception;
	
	public List<ReplyBean> replyListPage(Integer board_num, PageCriteria pageCriteria)  throws Exception;
	
	public int reCount(Integer board_num) throws Exception;
}
