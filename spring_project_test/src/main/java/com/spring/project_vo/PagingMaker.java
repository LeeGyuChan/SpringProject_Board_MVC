package com.spring.project_vo;

public class PagingMaker {
	
	/*
	 * 
	 * [페이징 처리]

			# endPage와 startPage 구하기
			-endpage 구하기 :
			 endPage = (Math.ceil(현재페이지번호/페이지 목록에 나타낼 페이지 수)*페이지 목록에 나타낼 페이지 수)

			-startPage 구하기 :
			 startPage = (endPage - 페이지 목록에 나타낼 페이지 수) +1

			# totalData와 endPage의 재계산

			 finalEndPage = Math.ceil(totalData / 한페이지당 보여줄 글의 수)

			 if(endPage > finalEndPage){
			    endPage = finalEndPage
			 }

			# Prev(이전)과 Next(다음) 계산

			 prev = start == 1 ? false : true;
			 
			 next = endPage*한페이지당 보여줄 글의 수 > totalData ? false:true;		 
	*
	*
	*/
	
	private int totalData; //전체 데이타 갯수
	private int startPage; //페이지목록의 시작번호
	private int endPage; //페이지 목록의 끝번호
	private int finalEndPage; //최종 페이지 번호
	private boolean prev; //이전 버튼을 나타내는 값
	private boolean next; //다음 버튼을 나타내는 값
	
	private int displayPageNum =10; //페이지 목록에 나타낼 페이지 수
	
	private PageCriteria pageCriteria;

	
	public void setPageCriteria(PageCriteria pageCriteria){
		this.pageCriteria = pageCriteria;
	}


	public void setTotalData(int totalData) {
		this.totalData = totalData;
		
		getPagingData();
	}

	public void getPagingData(){
		endPage = (int)(Math.ceil(pageCriteria.getPage()/(double)displayPageNum)*displayPageNum);
		
		startPage = (endPage -displayPageNum)+1;
		
		finalEndPage = (int)(Math.ceil(totalData /(double)pageCriteria.getNumPerPage()));
		
		if(endPage >finalEndPage){
			endPage = finalEndPage;
		}
		prev = startPage == 1? false:true;
		next = endPage*pageCriteria.getNumPerPage() >= totalData ? false:true; 
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getFinalEndPage() {
		return finalEndPage;
	}


	public void setFinalEndPage(int finalEndPage) {
		this.finalEndPage = finalEndPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getDisplayPageNum() {
		return displayPageNum;
	}


	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}


	public int getTotalData() {
		return totalData;
	}


	public PageCriteria getPageCriteria() {
		return pageCriteria;
	}
	
}
