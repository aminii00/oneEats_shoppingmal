package com.example.demo.admin.community.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.MostQnAVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.OneQnAVO;

public interface AdminCommunityService {
	public List<NoticeVO> adminNoticeList();
	
	public NoticeVO adminNoticeDetail(int noticeNo);
	
	public void adminNotideDetailupdate(NoticeVO noticeVO);
	
	 public void deleteNotice(int noticeNo);
	 
	 public int newNum();
	 
	 public void addNotice(NoticeVO noticeVO);

	public int selectMostQnAListTotalNumWithCategory(String category);

	public List<MostQnAVO> selectMostQnAListWithPagingMap(Map pagingMap);

	public void insertNewMostQnAWithMap(Map condMap);

	public MostQnAVO selectMostQnAByNo(String qnaNo);

	public void updateMostQnAWithMap(Map condMap);

	public void deleteMostQnA(int qnaNo);
	
	public List<OneQnAVO> oneQnAList();
}
