package com.example.demo.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.community.dao.CommunityDAO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDAO communityDAO;
}
