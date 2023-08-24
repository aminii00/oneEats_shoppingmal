package com.example.demo.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.member.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	//민아 로그인
	@Override
	public MemberVO login(Map  loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	
	//민아 회원가입
		@Override
		public void registerInfo(MemberVO memberVO) throws Exception{
			memberDAO.insertNewMember(memberVO);
		}
		@Override
		public int registerInfoNo() throws Exception{
			int MemberNo = memberDAO.insertMemberNo();
			return MemberNo;
		}

		@Override
		public String idSearch(MemberVO memberVO) throws DataAccessException {
			return memberDAO.idSearch(memberVO);
		}
		
		@Override
		public void sellerRegisterInfo(MemberVO memberVO) throws Exception{
			memberDAO.insertSellerNewMember(memberVO);
		}
		
		@Override
		public MemberVO pwSearch(MemberVO memberVO) throws DataAccessException {
			return memberDAO.pwSearch(memberVO);
		}
		
		@Override
		public int updatePw(MemberVO member) throws DataAccessException {
			return memberDAO.updatePw(member);
		}


		@Override
		public void insertMemberWithMap(Map memberMap) {
			memberDAO.insertMemberWithMap(memberMap);
			
		}


		@Override
		public MemberVO selectMemberByEmail(String email) {
			
			return memberDAO.selectMemberByEmail(email);
		}


		@Override
		public MemberVO selectMemberById(String id) {
			return memberDAO.selectMemberById(id);
		}
		
		
		
}
