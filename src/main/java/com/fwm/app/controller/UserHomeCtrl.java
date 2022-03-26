package com.fwm.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserHomeCtrl {
	@RequestMapping("/user/home")
	@ResponseBody
	public String showMain() {
		return "재고관리 메인";
	}

}
