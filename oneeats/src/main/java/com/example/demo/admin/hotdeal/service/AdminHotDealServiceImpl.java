package com.example.demo.admin.hotdeal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.hotdeal.dao.AdminHotDealDAO;

@Service("adminHotDealService")
public class AdminHotDealServiceImpl implements AdminHotDealService {
	@Autowired
	private AdminHotDealDAO adminHotDealDAO;
}
