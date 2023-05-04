package ljh.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;


public class FileDownloadAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String courseCode = request.getParameter("courseCode");
		
		try {
			// 다운로드 할 파일의 경로를 구하고 File 객체를 생성한다.
			HttpSession session = request.getSession();
			
			ServletContext svlCtx= session.getServletContext();
			String downloadFileDir = svlCtx.getRealPath("/images");
			
			//System.out.println(" === 파일이 다운로드 되어지는 절대경로 downloadFileDir ==> "+downloadFileDir);
			// === 파일이 다운로드 되어지는 절대경로 uploadFileDir ==> C:\NCS\workspace(jsp)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MyMVC\images
			
			// ***** 시스템에 업로드 되어진 파일설명서 첨부파일명 및 오리지널 파일명 알아오기 ***** //
			InterProductDAO pdao = new ProductDAO();
			Map<String,String> map = pdao.getPrdmanualFileName(pnum);
			//알아와야 할 컬럼이 2개고 1 행이니까 map or vo인데 컬럼이 2개명만 알고싶으니까 map
			
			// File 객체 생성하기
			String filePath=downloadFileDir+"\\"+map.get("prdmanual_systemFileName");
			//prdmanual_systemFileName은 파일서버에 업로드 되어진 제품설명서 파일명
		
			File file = new File(filePath);
			
			
			// MIME TYPE 설정하기 
	        // (구글에서 검색어로 MIME TYPE 을 해보면 MIME TYPE에 따른 문서종류가 쭉 나온다)
	        String mimeType = svlCtx.getMimeType(filePath);
	        
		     //   System.out.println("~~~~ 확인용 mimeType => " + mimeType);
		     //  ~~~~ 확인용 mimeType => application/pdf  .pdf 파일임
		     //   ~~~~ 확인용 mimeType => image/jpeg       .jpg 파일임
		     //  ~~~~ 확인용 mimeType => application/vnd.openxmlformats-officedocument.spreadsheetml.sheet    엑셀파일임.
		
		
	        if(mimeType == null) {
	        	mimeType = "application/octet-stream";
	        	// "application/octet-stream" 은 일반적으로 잘 알려지지 않은 모든 종류의 이진 데이터를 뜻하는 것임.
	        	
	        }
	        response.setContentType(mimeType);
	        
	        
	        //다운로드 되어질 파일명 알아와서 설정해오기
	        String prdmanual_orginFileName = map.get("prdmanual_orginFileName");
	        // map.get("prdmanual_orginFileName")은 웬클라이언트의 웹브라우저에서 파일을 업로드 할 때 올린 제품설명서 파일명임.
	        
	        // prdmanual_orginFileName(다운로드 되어지는 파일명)이 한글일때  
	        // 한글 파일명이 깨지지 않도록 하기위한 웹브라우저 별로 encoding 하기 및  다운로드 파일명 설정해주기
	        
	        String downloadFileName = "";
	        String header = request.getHeader("User-Agent");
	        
	        if (header.contains("Edge")){
	           downloadFileName = URLEncoder.encode(prdmanual_orginFileName, "UTF-8").replaceAll("\\+", "%20");
	            response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
	         } else if (header.contains("MSIE") || header.contains("Trident")) { // IE 11버전부터는 Trident로 변경됨.
	            downloadFileName = URLEncoder.encode(prdmanual_orginFileName, "UTF-8").replaceAll("\\+", "%20");
	            response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
	        } else if (header.contains("Chrome")) {
	           downloadFileName = new String(prdmanual_orginFileName.getBytes("UTF-8"), "ISO-8859-1");
	            response.setHeader("Content-Disposition", "attachment; filename=" + downloadFileName);
	        } else if (header.contains("Opera")) {
	           downloadFileName = new String(prdmanual_orginFileName.getBytes("UTF-8"), "ISO-8859-1");
	            response.setHeader("Content-Disposition", "attachment; filename=" + downloadFileName);
	        } else if (header.contains("Firefox")) {
	           downloadFileName = new String(prdmanual_orginFileName.getBytes("UTF-8"), "ISO-8859-1");
	            response.setHeader("Content-Disposition", "attachment; filename=" + downloadFileName);
	        }
	        
	        
	        // *** 다운로드할 요청 파일을 읽어서 클라이언트로 파일을 전송하기 *** //
	        FileInputStream finStream = new FileInputStream(file);
	        // 1byte 기반 파일 입력 노드스트림 생성
	        
	        ServletOutputStream srvOutStream = response.getOutputStream();
	        // 1byte 기반 파일 입력 노드스트림 생성
	        // ServletOutputStream은 바이너리 데이터를 웹 브라우저로 전송할 때 사용한다.
	        
	        byte arrb[] = new byte[4096];
	        int data = 0;
	        while( (data = finStream.read(arrb, 0, arrb.length)) != -1) {//-1은 파일의 끝이다.
	        	srvOutStream.write(arrb, 0, data);
	        }//while
	        
	        srvOutStream.flush();
	        //쌓인걸 쭉 보내기
	        
	        srvOutStream.close();
	        finStream.close();
	        
        
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
