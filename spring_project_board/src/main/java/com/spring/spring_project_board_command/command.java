package com.spring.spring_project_board_command;

import org.springframework.ui.Model;

public interface command {

	public void BoardDelete(Model model) throws Exception;
	public void BoardDetail(Model model) throws Exception;
	public void BoardList(Model model) throws Exception;
	public void BoardModifyForm(Model model) throws Exception;
	public void BoardModify(Model model) throws Exception;
	public void BoardReplyForm(Model model) throws Exception;
	public void BoardReply(Model model) throws Exception;
	public void BoardWrite(Model model) throws Exception;
	public void MemberJoin(Model model) throws Exception;
	public boolean MemberLogin(Model model) throws Exception;
	public void MemberLogout(Model model) throws Exception;
}
