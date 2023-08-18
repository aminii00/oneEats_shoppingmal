package com.example.demo.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.main.service.MainService;

@Controller("mainController")
public class MainControllerImpl implements MainController {
	@Autowired
	private MainService mainService;
}
