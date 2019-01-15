package org.spring.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import org.spring.dto.FileDTO;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class UtilFile {

	String fileName="";
	
	public FileDTO fileUpload(MultipartHttpServletRequest request, MultipartFile uploadFile) {
		
		String path="";
		String fileName="";
		FileDTO dto = null;
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		try {

			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();
			path = getSaveLocation(request);
			
			System.out.println("File Name : " + fileName);
			System.out.println("File path : " + path);
			
			File file = new File(path);
			
			if(fileName != null && !fileName.equals("")) {
				if(file.exists()) {
					fileName = System.currentTimeMillis() + "_" + fileName;
					file = new File(path + fileName);
				}
			}
			
			System.out.println("File Name : " + fileName);
			System.out.println("File : " + file);
			
			out = new FileOutputStream(file);
			
			System.out.println("file out : " + out);
			
			out.write(bytes);
			
			dto = new FileDTO(fileName, file.getAbsolutePath(), uploadFile.getSize());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(out!=null) out.close();
				if(printWriter!=null) printWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	private String getSaveLocation(MultipartHttpServletRequest request) {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "resources/files/";
		System.out.println("getSaveLocation Path : " + uploadPath + attachPath);
		return uploadPath + attachPath;
	}
	
}
