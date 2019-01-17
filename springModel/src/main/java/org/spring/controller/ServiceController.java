package org.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.spring.dao.FileDAO;
import org.spring.dto.FileDTO;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServiceController {
	
	@Autowired
	FileDAO dao;
	
	@RequestMapping(value="/crawler.do" , method=RequestMethod.GET)
	public String crawler(Model model, HttpServletRequest request) throws IOException {
		Crawler crawler = new Crawler();
		model.addAttribute("allList", crawler.crawler());
		return "crawler";
	}
	
	@RequestMapping(value="/fileUpload.do" , method=RequestMethod.POST)
	public String fileUpload(@RequestParam("uploadFile") MultipartFile uploadFile,MultipartHttpServletRequest request){
		
		System.out.println("reAddProCtrl uploadFile : " + uploadFile);

		UtilFile utilFile = new UtilFile();
		
		FileDTO dto = utilFile.fileUpload(request, uploadFile);

		if(dto!=null) System.out.println(dao.fileUpload(dto));
		
		return "index";
	}
	@RequestMapping(value="fileDownload.do" , method=RequestMethod.GET)
	public ModelAndView fileDownload(@RequestParam("fileName") String fileName){
		
		FileDTO dto = new FileDTO(fileName, "", 0);
		
		File downFile = new File(dao.getFilePath(dto));
		
		System.out.println("controller fileDownload fileName : " + fileName);
		System.out.println("controller fileDownload downFile Path : " + downFile.getAbsolutePath());
		
		return new ModelAndView("fileDownload", "downloadFile", downFile);
	}
	
	@RequestMapping(value="fileList.do" , method=RequestMethod.GET)
	public ModelAndView fileList(){
	
		ArrayList<FileDTO> fileList = dao.getFileList();
		
		System.out.println(fileList.get(1).getFileName());
		
		return new ModelAndView("fileList", "fileList", fileList);
	}
	
}
