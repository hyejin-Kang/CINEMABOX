package com.cinemabox.web.utils;

import lombok.Data;

@Data
public class Paging {
	// 현재페이지
	private int nowPage;
	// 시작페이지
	private int startPage;
	// 끝페이지
	private int endPage;
	//게시글 총 갯수
	private int total;
	// 페이지당 글 갯수
	private int cntPerPage;
	// 마지막페이지
	private int lastPage;
	// SQL쿼리에 쓸 start
	private int start;
	// end
	private int end;
	// 기본페이지 수
	private int cntPage = 15;
	
	// 기본생성자
	public Paging() {}
		
	public Paging(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
		
}