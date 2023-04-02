package apeak.startupcampus.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/file")
public class FileController {
	
	@Autowired
	ServletContext servlet;

	@RequestMapping("/download")
	private void fileDownload(HttpServletRequest request, HttpServletResponse response, String filePath,String fileName) {
		String saveDir = request.getSession().getServletContext().getRealPath("");
		System.out.println(filePath);
		filePath = filePath.replace("/" + servlet.getContextPath(), "");
		System.out.println(filePath);
		
		File file = new File(saveDir+File.separator+filePath);
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		try {
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			sos = response.getOutputStream();
			
			fileName = new String(fileName.getBytes("utf-8"),"iso-8859-1");

			
			response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
			response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
			response.setContentLength((int) file.length());
			int read = 0;
			while ((read = bis.read()) != -1) {
				sos.write(read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				sos.close();
				bis.close();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
}