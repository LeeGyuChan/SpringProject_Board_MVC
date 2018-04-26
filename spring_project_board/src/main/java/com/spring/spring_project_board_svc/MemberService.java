package com.spring.spring_project_board_svc;

import com.spring.spring_project_board_vo.MemberBean;

public interface MemberService {

	public boolean joinMember(MemberBean member)throws Exception;
	public boolean login(MemberBean member)throws Exception;
}
