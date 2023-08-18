package com.example.demo.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.main.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO mainDAO;
	
}
