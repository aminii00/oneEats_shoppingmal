package com.example.demo.admin.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.community.dao.AdminCommunityDAO;
import com.example.demo.vo.MostQnAVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.OneQnAVO;
import com.example.demo.vo.RecipeVO;

@Service("adminCommunityService")
public class AdminCommunityServiceImpl implements AdminCommunityService {

	@Autowired
	private AdminCommunityDAO adminCommunityDAO;

	@Override
	public List<NoticeVO> adminNoticeList() {
		List<NoticeVO> noticeList = adminCommunityDAO.adminNoticeList();
		return noticeList;
	}

	@Override
	public NoticeVO adminNoticeDetail(int noticeNo) {
		NoticeVO noticeVO = adminCommunityDAO.adminNoticeDetail(noticeNo);
		return noticeVO;
	}

	@Override
	public void adminNotideDetailupdate(NoticeVO noticeVO) {
		adminCommunityDAO.adminNotideDetailupdate(noticeVO);
	}

	@Override
	public void deleteNotice(int noticeNo) {
		adminCommunityDAO.deleteNotice(noticeNo);
	}

	@Override
	public int newNum() {
		int noticeNo = adminCommunityDAO.newNum();
		return noticeNo;
	}

	@Override
	public void addNotice(NoticeVO noticeVO) {
		adminCommunityDAO.addNotice(noticeVO);
	}

	@Override
	public int selectMostQnAListTotalNumWithCategory(String category) {

		return adminCommunityDAO.selectMostQnAListTotalNumWithCategory(category);
	}

	@Override
	public List<MostQnAVO> selectMostQnAListWithPagingMap(Map pagingMap) {
		return adminCommunityDAO.selectMostQnAListWithPagingMap(pagingMap);
	}

	@Override
	public void insertNewMostQnAWithMap(Map condMap) {
		adminCommunityDAO.insertNewMostQnAWithMap(condMap);
	}

	@Override
	public MostQnAVO selectMostQnAByNo(String qnaNo) {
		return adminCommunityDAO.selectMostQnAByNo(qnaNo);
	}

	@Override
	public void updateMostQnAWithMap(Map condMap) {
		adminCommunityDAO.updateMostQnAWithMap(condMap);
	}

	@Override
	public void deleteMostQnA(int qnaNo) {
		adminCommunityDAO.deleteMostQnA(qnaNo);
	}

	@Override
	public List<RecipeVO> selectRecipeListWithPagingMap(Map pagingMap) {
		return adminCommunityDAO.selectRecipeListWithPagingMap(pagingMap);
	}

	@Override
	public int selectTotalRecipeNum(Map pagingMap) {
		
		return adminCommunityDAO.selectTotalRecipeNum(pagingMap);
	}
	
	@Override
	public List<OneQnAVO> oneQnAList(){
		List<OneQnAVO> oneQnAList = adminCommunityDAO.oneQnAList();
		return oneQnAList;
	}
	
	

}
