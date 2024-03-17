package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.vo.Article;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrHomeController {

	@RequestMapping("/usr/home/main")
	public String showMain(HttpServletRequest req) {
//		Rq rq = (Rq) req.getAttribute("rq");
		
//		model.addAttribute("loginedMemberId", rq.getLoginedMemberId());
		
		return "/usr/home/main";
	}

	@RequestMapping("/")
	public String showRoot() {

		return "redirect:/usr/home/main";
	}
}