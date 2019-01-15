package org.spring.memberController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {

	@RequestMapping(value="/" , method=RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		return "index";
	}
	
	@RequestMapping(value="/*.view" , method=RequestMethod.GET)
	public String view(Model model, HttpServletRequest request) {
		String uri=request.getRequestURI();
		String path=request.getContextPath();
		String basicURI=uri.substring(path.length());
		System.out.println(basicURI.substring(1,basicURI.length()-5));
		return basicURI.substring(1,basicURI.length()-5);
	}
	
}
