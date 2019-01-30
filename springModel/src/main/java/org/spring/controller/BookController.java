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
	@RequestMapping(value = "book/addInfo.do", method=RequestMethod.POST)
	public int addInfo(Model model, HttpServletRequest request) {
		return dao.addInfo(createDTO(request));
	}
	
	@ResponseBody
	@RequestMapping(value = "book/checkOut.do", method=RequestMethod.POST)
	public int checkOut(Model model, HttpServletRequest request) {
		return dao.checkOut(bookCoodList(request), getUserId(request));
	}
	@ResponseBody
	@RequestMapping(value = "book/checkIn.do", method=RequestMethod.POST)
	public int checkIn(Model model, HttpServletRequest request) {
		return dao.checkIn(bookCoodList(request), getUserId(request));
	}
	
	@RequestMapping(value = "book/list.do", method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("bookList", dao.list());
		return "/book/list";
	}
	
	public String getUserId(HttpServletRequest request) {
		return (String)request.getSession().getAttribute("sessionId");
	}
	
	public BookDTO createDTO(HttpServletRequest request) {
		return new BookDTO(request.getParameter("bookCood"), request.getParameter("bookName"),request.getParameter("bookAuthor") ,request.getParameter("bookState") );
	}
	
	public ArrayList<BookDTO> bookCoodList(HttpServletRequest request){
		ArrayList<BookDTO> bookCoodList = new ArrayList<>();
		for(String bookCood : request.getParameterValues("bookCood")) {
			bookCoodList.add(new BookDTO(bookCood));
		}
		return bookCoodList;
	}

}
