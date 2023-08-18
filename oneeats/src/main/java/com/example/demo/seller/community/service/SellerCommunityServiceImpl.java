package com.example.demo.seller.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.seller.community.dao.SellerCommunityDAO;

@Service("sellerCommunityService")
public class SellerCommunityServiceImpl implements SellerCommunityService{
	@Autowired
	private SellerCommunityDAO sellerCommunityDAO;

}
