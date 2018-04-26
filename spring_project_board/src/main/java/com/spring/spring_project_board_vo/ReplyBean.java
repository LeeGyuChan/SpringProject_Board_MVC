package com.spring.spring_project_board_vo;

import java.sql.Date;

public class ReplyBean {

	private Integer RE_NUM;
	private Integer BOARD_NUM;
	private String REPLYCONTENT;
	private String REPLYER;
	private Date RE_DATE;
	
	
	public Integer getRE_NUM() {
		return RE_NUM;
	}
	public void setRE_NUM(Integer rE_NUM) {
		RE_NUM = rE_NUM;
	}
	public Integer getBOARD_NUM() {
		return BOARD_NUM;
	}
	public void setBOARD_NUM(Integer bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}
	public String getREPLYCONTENT() {
		return REPLYCONTENT;
	}
	public void setREPLYCONTENT(String rEPLYCONTENT) {
		REPLYCONTENT = rEPLYCONTENT;
	}
	public String getREPLYER() {
		return REPLYER;
	}
	public void setREPLYER(String rEPLYER) {
		REPLYER = rEPLYER;
	}
	public Date getRE_DATE() {
		return RE_DATE;
	}
	public void setRE_DATE(Date rE_DATE) {
		RE_DATE = rE_DATE;
	}
	
	
}
