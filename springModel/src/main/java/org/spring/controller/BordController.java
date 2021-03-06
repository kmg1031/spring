package org.spring.controller;


import javax.servlet.http.HttpServletRequest;

import org.spring.dao.BordDAO;
import org.spring.dto.BordDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BordController {

	@Autowired
	BordDAO dao;

	@ResponseBody
	@RequestMapping(value = "bord/write.do", method=RequestMethod.POST)
	public int write(Model model, HttpServletRequest request) {
		return dao.write(createDTO(request));
	}
	
	@RequestMapping(value = "bord/list.do", method=RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) {
		String page = request.getParameter("page");
		System.out.println(dao.getPageDTO(page).getPageNow());
		model.addAttribute("pageDTO", dao.getPageDTO(page));
		model.addAttribute("bordList", dao.list(page));
		return "bord/list";
	}
	
	@RequestMapping(value = "bord/info.do", method=RequestMethod.GET)
	public String info(Model model, HttpServletRequest request) {
		model.addAttribute("bordInfo", dao.info(createDTO(request)));
		return "/bord/info";
	}
	
	@ResponseBody
	@RequestMapping(value = "bord/update.do", method=RequestMethod.POST)
	public int update(HttpServletRequest request, @RequestParam("sessionId") String sessionId) {
		return dao.update(createDTO(request),sessionId);
	}

	@ResponseBody
	@RequestMapping(value = "bord/delete.do", method=RequestMethod.POST)
	public int delete(HttpServletRequest request, @RequestParam("sessionId") String sessionId) {
		return dao.delete(createDTO(request),sessionId);
	}
	
	
	
	
	public BordDTO createDTO(HttpServletRequest request) {
		int no = 1;
		if (request.getParameter("no") != null) {
			try{
				no = Integer.parseInt(request.getParameter("no"));
			}catch (Exception e) {
				e.printStackTrace();
				no = 0;
			}
		}
		return new BordDTO(no, request.getParameter("userId"), request.getParameter("title"),request.getParameter("memo"));
	}

}
