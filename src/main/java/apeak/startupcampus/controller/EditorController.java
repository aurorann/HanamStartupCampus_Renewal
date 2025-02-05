package apeak.startupcampus.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import apeak.startupcampus.model.dto.PhotoVo;

@Controller
@RequestMapping("/common")
@Secured({"ROLE_ADMIN"})
public class EditorController {
	
	@RequestMapping("/photoUpload.do")
    public String photoUpload(HttpServletRequest request, PhotoVo vo){
		
		System.out.println("단일 파일 업로드 실행");
		
        String callback = vo.getCallback();
        String callback_func = vo.getCallback_func();
        String file_result = "";
        try {
            if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
                //파일이 존재하면
                String original_name = vo.getFiledata().getOriginalFilename();
                String ext = original_name.substring(original_name.lastIndexOf(".")+1);
                //파일 기본경로
                String rootPath = request.getSession().getServletContext().getRealPath("/");
                //파일 기본경로 _ 상세경로
                String path = rootPath + "upload\\popup"  + File.separator;              
                File file = new File(path);
                System.out.println("path:"+path);
                //디렉토리 존재하지 않을경우 디렉토리 생성
                if(!file.exists()) {
                    file.mkdirs();
                }
                //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
                String realname = UUID.randomUUID().toString() + "." + ext;
                
                String url = rootPath+"/upload/popup/"+realname;
                url.replaceAll("\\\\", "/");
                System.out.println(url+"url");
            ///////////////// 서버에 파일쓰기 ///////////////// 
                vo.getFiledata().transferTo(new File(path+realname));
                file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL="+realname;
            } else {
                file_result += "&errstr=error";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + callback + "?callback_func="+callback_func+file_result;
    }
	
	@RequestMapping("/multiplePhotoUpload.do")
    public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
        try {
             //파일정보
             String sFileInfo = "";
             //파일명을 받는다 - 일반 원본파일명
             String filename = request.getHeader("file-name");
             //파일 확장자
             String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
             //확장자를소문자로 변경
             filename_ext = filename_ext.toLowerCase();
             //파일 기본경로
             String dftFilePath = request.getSession().getServletContext().getRealPath("/");
             //파일 기본경로 _ 상세경로
             String filePath = dftFilePath + "upload\\popup" + File.separator;
             File file = new File(filePath);
             if(!file.exists()) {
                file.mkdirs();
             }
             
             System.out.println("path : "+filePath);
             
             String realFileNm = "";
             SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
             String today= formatter.format(new java.util.Date());
             realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
             String rlFileNm = filePath + realFileNm;
             ///////////////// 서버에 파일쓰기 ///////////////// 
             InputStream is = request.getInputStream();
             OutputStream os=new FileOutputStream(rlFileNm);
             int numRead;
             byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
             while((numRead = is.read(b,0,b.length)) != -1){
                os.write(b,0,numRead);
             }
             if(is != null) {
                is.close();
             }
             os.flush();
             os.close();
             ///////////////// 서버에 파일쓰기 /////////////////
             // 정보 출력
             sFileInfo += "&bNewLine=true";
             // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
             sFileInfo += "&sFileName="+ filename;;
             sFileInfo += "&sFileURL="+request.getSession().getServletContext().getContextPath()+"/upload/popup/"+realFileNm;
             
             System.out.println("sfileInfo : "+sFileInfo);
             
             PrintWriter print = response.getWriter();
             print.print(sFileInfo);
             print.flush();
             print.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
