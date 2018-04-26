package com.spring.spring_project_board_vo;

public class PageCriteria {

	private int page; //현제 페이지 
	private int numPerPage; // 페이지당 보여줄 글의 수
	private int startNum;
	
	public PageCriteria(){
		this.page =1;
		this.numPerPage =10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page<=0){
			this.page = 1;
			return;
		}
		this.page =page;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		if(numPerPage<=0 || numPerPage>100){
			this.numPerPage = 10;
			return;
		}
		this.numPerPage = numPerPage;
	}
	
	public int getStartNum(){
		return this.startNum = (this.page-1)*numPerPage;
	}

}
