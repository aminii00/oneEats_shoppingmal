package com.example.demo.admin.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.admin.order.service.AdminOrderService;

@Controller("adminOrderController")
public class AdminOrderControllerImpl implements AdminOrderController {
	@Autowired
	private AdminOrderService adminOrderService;
}
