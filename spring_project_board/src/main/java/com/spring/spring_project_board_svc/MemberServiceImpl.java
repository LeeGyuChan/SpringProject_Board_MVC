package com.spring.spring_project_board_svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.spring_project_board_dao.MemberDAO;
import com.spring.spring_project_board_vo.MemberBean;

@Transactional
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public boolean joinMember(MemberBean member) throws Exception{
		// TODO Auto-generated method stub

		
		boolean joinSuccess = false;

		int insertCount = memberDAO.insertMember(member);
		if(insertCount > 0){
			joinSuccess = true;
		}

		return joinSuccess;
	}

	@Override
	public boolean login(MemberBean member) throws Exception{
		// TODO Auto-generated method stub
		
		
		boolean loginResult = false;
		String loginId = memberDAO.selectLoginId(member);
		if(loginId != null){
			loginResult = true;
		}

	
		return loginResult;
	}

}
