package com.example.demo.admin.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.community.dao.AdminCommunityDAO;

@Service("adminCommunityService")
public class AdminCommunityServiceImpl implements AdminCommunityService {
	@Autowired
	private AdminCommunityDAO adminCommunityDAO;

}
