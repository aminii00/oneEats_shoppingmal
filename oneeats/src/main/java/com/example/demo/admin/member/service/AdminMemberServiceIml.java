package com.example.demo.admin.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.member.dao.AdminMemberDAO;

@Service("adminMemberService")
public class AdminMemberServiceIml implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;
}
