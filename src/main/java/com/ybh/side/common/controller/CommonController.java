package com.ybh.side.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ybh.side.common.dto.UserDTO;
import com.ybh.side.common.service.CommonService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CommonController {

	private final CommonService cs;

	@GetMapping("/")
	public String goMain(Model model) {
		model.addAttribute("homeChk", true);
		return "main.page";
	}

	@GetMapping("goLogin")
	public String goLogin(Model model) {
		model.addAttribute("loginForm", true);
		return "common/login.page";
	}

	@ResponseBody//세션 추가, 쿠키도?
	@PostMapping("loginChk")
	public UserDTO loginChk(@RequestBody UserDTO dto, HttpServletRequest req) {

		UserDTO resultDto = cs.loginChk(dto);

		if(resultDto.getErrMessage().equals("")) {
			HttpSession session = req.getSession();
			session.setAttribute("sessUserName", resultDto.getUserName());
			session.setAttribute("sessUserId", resultDto.getUserId());
			session.setMaxInactiveInterval(60 * 60);
		}
		return resultDto;
	}

	@GetMapping("goRegister")
	public String goRegister(Model model) {
		model.addAttribute("loginForm", true);
		return "common/register.page";
	}

	@ResponseBody
	@PostMapping("registerChk")
	public int registerChk(@RequestBody UserDTO dto) {
		return cs.registerChk(dto);
	}

	@GetMapping("goLogout")
	public String goLogout(HttpSession session) {
		session.invalidate();
		return "redirect:goLogin";
	}



}
