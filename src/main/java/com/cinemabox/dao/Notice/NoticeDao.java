package com.cinemabox.dao.Notice;

import java.util.List;

import com.cinemabox.dto.Notice.NoticeDetailDto;
import com.cinemabox.dto.Notice.NoticeDto;
import com.cinemabox.dto.Notice.NoticeListDto;
import com.cinemabox.vo.Notice;

public interface NoticeDao {
	
	/**
	 * 전체공지사항 조회 
	 * @param searchData 
	 * @return no
	 */
	List<Notice> getNoticeAll(NoticeListDto searchData);
	
	/**
	 * 번호로 공지사항 상세 조회 
	 * @return
	 */
	NoticeDetailDto getDetailNoticeByNo(int no);
	
	/**
	 * 공지하기 
	 * @param addNotice
	 */
	void insertNotice(NoticeDto addNotice);
	
	/**
	 *  지정된 번호로 공지 내용 삭제하기 
	 * @param no
	 */
	void deleteNotice(int no);
	
	/**
	 * 조회수 증가 
	 * @param importNotice
	 */
	void increaseHit(int no);
	
	/**
	 *  공지사항 수정하기 
	 * @param no
	 */
	void changeNotice(NoticeDetailDto no);

	/**
	 *  고객센터 메인페이지에 공지사항 추가
	 * @return
	 */
	List<Notice> noticeMain();

	/**
	 * 공지사항 페이지수 
	 * @param searchData
	 * @return
	 */
	int getPageAllCnt(NoticeListDto searchData);


}
