package com.spring.spring_project_board_dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.spring_project_board_vo.BoardBean;

@Repository
public class BoardDAO{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	
	public int selectListCount(){

		Integer listCount = jdbcTemplate.queryForObject("select count(*) from tboard",Integer.class);
		return listCount;
	}
	
	public ArrayList<BoardBean> selectArticleList(int page, int limit){
		
		int startrow=(page-1)*10;
		String board_list_sql="select * from tboard order by BOARD_RE_REF desc, BOARD_RE_SEQ asc limit ?, 10";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		List<BoardBean> article  = jdbcTemplate.query(board_list_sql,
				new RowMapper<BoardBean>(){
			
			@Override
			public BoardBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				BoardBean board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));;
				board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				return board;
			}
	}
				, startrow);
		articleList.addAll(article);
		return articleList;
		
		
		
		
	}
	
	public BoardBean selectArticle(int board_num){
		
		BoardBean boardBean  = jdbcTemplate.queryForObject("select * from tboard where BOARD_NUM=?",
				
			new RowMapper<BoardBean>(){
			@Override
			public BoardBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				BoardBean boardBean = new BoardBean();
				boardBean.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				boardBean.setBOARD_NAME(rs.getString("BOARD_NAME"));
				boardBean.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				boardBean.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				boardBean.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				boardBean.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				boardBean.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				boardBean.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				boardBean.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				return boardBean;
			}
		},board_num);
		
		return boardBean;
	
	}
	
	public int insertArticle(BoardBean article){
		/*String sql="";
		Integer num = jdbcTemplate.queryForObject("select max(board_num) from tboard",Integer.class);

		if(num!=0){
			num+=1;
		}
		else{
			num=1;
		}
		sql = "insert into tboard (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
		sql+="BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,"+"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"
		+"BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
		
		int insertCount = jdbcTemplate.update(sql, num, article.getBOARD_NAME(), article.getBOARD_PASS(),article.getBOARD_SUBJECT(),
				article.getBOARD_CONTENT(),article.getBOARD_FILE(),num,0,0,0);*/
		String sql="";
		
		 final Integer num = jdbcTemplate.queryForObject("select max(board_num) from tboard", 
				new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				int num = rs.getInt(1);
				if(num!=0){
					num+=1;
				}
				else{
					num=1;
				}
				return num;
			}
		});
		sql = "insert into tboard (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
		sql+="BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,"+"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"
		+"BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
		
		int insertCount = jdbcTemplate.update(sql, num, article.getBOARD_NAME(), article.getBOARD_PASS(),article.getBOARD_SUBJECT(),
				article.getBOARD_CONTENT(),article.getBOARD_FILE(),num,0,0,0);
		return insertCount;
		
	}
	
	public int insertReplyArticle(BoardBean article){
		

		int insertCount=0;
		int re_ref=article.getBOARD_RE_REF();
		int re_lev=article.getBOARD_RE_LEV();          
		int re_seq=article.getBOARD_RE_SEQ();
		
		Integer num = jdbcTemplate.queryForObject("select max(board_num) from tboard",Integer.class);
		if(num!=0){
			num+=1;
		}
		else{
			num=1;
		}
		
		String sql="update tboard set BOARD_RE_SEQ=BOARD_RE_SEQ+1 where BOARD_RE_REF=? ";
		sql+="and BOARD_RE_SEQ>?";
		
		jdbcTemplate.update(sql,re_ref,re_seq);
		
		re_seq=re_seq+1;
		re_lev=re_lev+1;
		
		sql="insert into tboard (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
		sql+="BOARD_CONTENT,BOARD_FILE, BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,";
		sql+="BOARD_READCOUNT,BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
		
		insertCount = jdbcTemplate.update(sql, num, article.getBOARD_NAME(), article.getBOARD_PASS(),article.getBOARD_SUBJECT(),
				article.getBOARD_CONTENT(),"",re_ref,re_lev,re_seq,0);
		return insertCount;
		
	}
	public int updateArticle(BoardBean article){
		
		int updateCount=0;
		String sql="update tboard set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";
		updateCount = jdbcTemplate.update(sql,article.getBOARD_SUBJECT(),article.getBOARD_CONTENT(),article.getBOARD_NUM());
		
		return updateCount;
	}
	
	public int deleteArticle(BoardBean article){
		
		int deleteCount =0;
		String sql="delete from tboard where BOARD_RE_REF=? and BOARD_RE_LEV>=?";
		
		deleteCount = jdbcTemplate.update(sql,article.getBOARD_RE_REF(),article.getBOARD_RE_LEV());
		
		return deleteCount;
	}
	
	public void updateReadCount(int board_num){
		

		String sql="update tboard set BOARD_READCOUNT=BOARD_READCOUNT+1 where BOARD_NUM="+board_num;
		jdbcTemplate.update(sql);

	}
	
	public boolean isArticleBoardWriter(int board_num, String pass){
		boolean isWriter = false;
		String sql="select * from tboard where BOARD_NUM=?";
	
		String board_pass = jdbcTemplate.queryForObject(sql,
				new RowMapper<String>(){
					@Override
					public String mapRow(ResultSet rs, int rowNum) throws SQLException {
						
						return rs.getString("BOARD_PASS");
					}
					
		},
		board_num);
		
		if(pass.equals(board_pass)){
			isWriter = true;
		}
		return isWriter;
	}

}
