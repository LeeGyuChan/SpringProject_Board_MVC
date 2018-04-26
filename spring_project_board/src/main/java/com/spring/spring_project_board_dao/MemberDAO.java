package com.spring.spring_project_board_dao;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.spring_project_board_vo.MemberBean;

@Repository
public class MemberDAO {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public int insertMember(MemberBean member){
		String sql="INSERT INTO MEMBER VALUES (?,?,?,?,?,?)";
		int insertCount=0;
		
		insertCount = jdbcTemplate.update(sql,member.getMEMBER_ID(),member.getMEMBER_PW(),member.getMEMBER_NAME(),
				 member.getMEMBER_AGE(),member.getMEMBER_GENDER(),member.getMEMBER_EMAIL());
		
		return insertCount;
	}
	
	public String selectLoginId(MemberBean member){
		String loginId = null;
		String sql="SELECT * FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PW=?";
		try{
		loginId = jdbcTemplate.queryForObject(sql,
					
					new RowMapper<String>(){
					@Override
					public String mapRow(ResultSet rs, int rowNum) throws SQLException {
						// TODO Auto-generated method stub
						
						return rs.getString("member_id");
					
					}
				},member.getMEMBER_ID(),member.getMEMBER_PW());
		}catch(Exception e){}		
				return loginId;
	
	}
	
	
}