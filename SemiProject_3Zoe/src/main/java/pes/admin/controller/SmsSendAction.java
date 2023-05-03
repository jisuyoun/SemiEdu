package pes.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import common.controller.AbstractController;
import net.nurigo.java_sdk.api.Message;

public class SmsSendAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	   //   >> SMS발송 <<

	      String api_key = "NCSF5FACPBNNEKU7";
	     
	      String api_secret = "9BMEP74D0CYKCJTTONQTKDATVPJUHM0T";
	      
	      Message coolsms = new Message(api_key, api_secret);
	      // net.nurigo.java_sdk.api.Message 임. 
	            
	      String mobile = request.getParameter("mobile");
	      String smsContent = request.getParameter("smsContent");
	      
	      HashMap<String, String> paraMap = new HashMap<>();
	      paraMap.put("to", mobile); // 수신번호
	      paraMap.put("from", "01040690418"); // 발신번호

	      paraMap.put("type", "SMS"); // Message type ( SMS(단문), LMS(장문), MMS, ATA )
	      paraMap.put("text", smsContent); 
	      
	      String datetime = request.getParameter("datetime");
	      if(datetime != null) {
	         paraMap.put("datetime", datetime);
	      }
	      
	      paraMap.put("app_version", "JAVA SDK v2.2"); // application name and version
	      
	      JSONObject jsobj = (JSONObject) coolsms.send(paraMap);
	      
	      String json = jsobj.toString();
	      
	      System.out.println("~~~~ 확인용 json => " + json);
	      
	      request.setAttribute("json", json);
	      
	      super.setRedirect(false);
	      super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
