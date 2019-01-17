package org.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.spring.dao.MemberDAO;
import org.spring.dto.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	MemberDAO dao;
	
	@ResponseBody
	@RequestMapping(value="info.do" , method=RequestMethod.POST)
	public MemberDTO info(Model model, HttpServletRequest request) {
		return dao.info(creDTO(request));
	}
	@ResponseBody
	@RequestMapping(value="idCheck.do" , method=RequestMethod.POST)
	public String idCheck(Model model, HttpServletRequest request) {
		return dao.idCheck(creDTO(request));
	}
	@ResponseBody
	@RequestMapping(value="join.do" , method=RequestMethod.POST)
	public String join(Model model, HttpServletRequest request) {
		return dao.join(creDTO(request))+"";
	}
	@ResponseBody
	@RequestMapping(value="login.do" , method=RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		return dao.login(creDTO(request), request)+"";
	}
	@RequestMapping(value="logout.do" , method=RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request) {
		dao.logout(request);
		return "index";
	}
	@ResponseBody
	@RequestMapping(value="delete.do" , method=RequestMethod.POST)
	public String delete(Model model, HttpServletRequest request) {
			return dao.Delete(creDTO(request), request)+"";
	}
	@ResponseBody
	@RequestMapping(value="update.do" , method=RequestMethod.POST)
	public String update(Model model, HttpServletRequest request) {
		return dao.update(creDTO(request))+"";
	}
	@ResponseBody
	@RequestMapping(value="list.do" , method=RequestMethod.POST)
	public String list(Model model, HttpServletRequest request) {
		request.setAttribute("list",dao.list());
		return "list";
	}
	private MemberDTO creDTO(HttpServletRequest request) {
		return new MemberDTO(request.getParameter("userId"), request.getParameter("userPw"), request.getParameter("userName"));
	}
	
}
