package com.spring.project_vo;

public class FindCriteria extends PageCriteria{

	private String findType;
	private String keyWord;
	

	public String getFindType() {
		return findType;
	}
	
	public void setFindType(String findType) {
		this.findType = findType;
	}
	
	public String getKeyWord() {
		return this.keyWord;
	}
	
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	
}
