package org.spring.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.spring.dao.BookDAO;
import org.spring.dto.BookDTO;
import org.spring.dto.BordDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;

@Controller
public class BookController {

	@Autowired
	BookDAO dao;

	@ResponseBody
	@RequestMapping(value = "/book/addInfo.do", method=RequestMethod.POST) // 도서 추가
	public int addInfo(Model model, HttpServletRequest request) {
		return dao.addInfo(createDTO(request));
	}
	
	@ResponseBody
	@RequestMapping(value = "book/checkOut.do", method=RequestMethod.POST) // 도서 대여
	public int checkOut(Model model, HttpServletRequest request) {
		if(dao.stateCheck(request.getParameter("bookCode")).equals("true")) {
			System.out.println(1);
			return dao.checkOut(bookCodeList(request), getUserId(request));
		}else {
			System.out.println(2);
			return 0;
		}
		
	}
	@ResponseBody
	@RequestMapping(value = "book/checkIn.do", method=RequestMethod.POST) // 도서 반납
	public int checkIn(Model model, HttpServletRequest request) {
		if(dao.stateCheck(request.getParameter("bookCode")).equals("true")) {
			return 0;
		}else {
			return dao.checkIn(bookCodeList(request), getUserId(request));
		}
	}
	@ResponseBody
	@RequestMapping(value = "book/stateCheck.do", method=RequestMethod.POST) // 반납여부 확인
	public String stateCheck(Model model, HttpServletRequest request) {
		System.out.println(dao.stateCheck(request.getParameter("bookCode")));
		return dao.stateCheck(request.getParameter("bookCode"));
	}
	
	@RequestMapping(value = "book/list.do", method=RequestMethod.GET) // 도서 목록
	public String list(Model model) {
		model.addAttribute("bookList", dao.list());
		return "/book/list";
	}
	
	@RequestMapping(value = "book/search.do", method=RequestMethod.POST) // 도서 목록
	public String search(Model model, HttpServletRequest request) {
		String option = request.getParameter("option");
		String keyword= request.getParameter("keyword");
		model.addAttribute("bookList", dao.search(option, keyword));
		return "/book/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "book/searchCrawler.do", method=RequestMethod.POST) // 도서 목록
	public String searchCrawler(Model model, HttpServletRequest request) {
		
		return "/book/list";
	}
	
	// private
	
	private String getUserId(HttpServletRequest request) {
		return request.getParameter("userId");
	}
	
	private BookDTO createDTO(HttpServletRequest request) {
		return new BookDTO(request.getParameter("bookCode"), request.getParameter("bookName"),request.getParameter("bookAuthor") ,request.getParameter("bookState") );
	}
	
	private ArrayList<BookDTO> bookCodeList(HttpServletRequest request){
		ArrayList<BookDTO> bookCodeList = new ArrayList<>();
		for(String bookCode : request.getParameterValues("bookCode")) {
			bookCodeList.add(new BookDTO(bookCode));
		}
		return bookCodeList;
	}

}
