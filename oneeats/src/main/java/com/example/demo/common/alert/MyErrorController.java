package com.example.demo.common.alert;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("myErrorController")
public class MyErrorController implements ErrorController {
	@RequestMapping("/error")
	public ModelAndView handleError(HttpServletRequest request) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		ModelAndView mav = new ModelAndView();
		if (status != null) {
			Integer statusCode = Integer.valueOf(status.toString());

			mav.addObject("statusCode", statusCode);

		}
		mav.setViewName("/error");
		return mav;
	}
}
