package org.spring.memberController;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.spring.memberDAO.MemberDAO;
import org.spring.memberDTO.FileDTO;
import org.spring.util.Crawler;
import org.spring.util.UtilFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ServiceController {
	
	@Autowired
	MemberDAO dao;
	
	@RequestMapping(value="/crawler.do" , method=RequestMethod.GET)
	public String crawler(Model model, HttpServletRequest request) throws IOException {
		Crawler crawler = new Crawler();
		model.addAttribute("allList", crawler.crawler());
		return "crawler";
	}
	
	@RequestMapping(value="fileUploade.do" , method=RequestMethod.POST)
	public String reAddProCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,MultipartHttpServletRequest request){
		
		System.out.println("reAddProCtrl uploadFile : " + uploadFile);

		UtilFile utilFile = new UtilFile();
		
		FileDTO dto = utilFile.fileUpload(request, uploadFile);

		System.out.println(dao.file(dto));
		
		return "index";
	}
	
	
	
}
