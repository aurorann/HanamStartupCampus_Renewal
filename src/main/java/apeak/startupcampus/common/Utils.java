package apeak.startupcampus.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;

public class Utils {
	private static final Logger LOGGER = LoggerFactory.getLogger(Utils.class);
	
	public static int[] getSeqAsc(int sNum, int eNum) {
		if(sNum > eNum) {
			int temp = eNum;
			eNum = sNum;
			sNum = temp;
		}
		
		LOGGER.info(sNum + " -> " + eNum);
		
		int[] seqList = new int[(eNum-sNum)+1];
		for(int i = 0; sNum <= eNum; sNum++, i++) {
			seqList[i] = sNum;
		}
		LOGGER.info(seqList.toString());
		return seqList;
	}
	
	public static int[] getSeqDesc(int sNum, int eNum) {
		if(sNum > eNum) {
			int temp = eNum;
			eNum = sNum;
			sNum = temp;
		}
		int[] seqList = new int[(eNum-sNum)+1];
		for(int i = 0; sNum < eNum; sNum++, i++) {
			seqList[i] = sNum;
		}
		
		return seqList;
	}
	
	public static String lPad(String strContext, int iLen, String strChar) {
		String strResult = "";
		StringBuilder sbAddChar = new StringBuilder();
		for( int i = strContext.length(); i < iLen; i++ ) {
			sbAddChar.append( strChar );
		}
		strResult = sbAddChar + strContext;
		return strResult;
	}
	
	public static String rPad(String strContext, int iLen, String strChar) {
		String strResult = "";
		StringBuilder sbAddChar = new StringBuilder();
		for( int i = strContext.length(); i < iLen; i++ ) {
			sbAddChar.append( strChar );
		}
		strResult = strContext + sbAddChar;
		return strResult;
	}
	
	public static String getUserDeviceInfo(HttpServletRequest req) {
        String  browserDetails  =   req.getHeader("User-Agent");
        String  userAgent       =   browserDetails;
        String  user            =   userAgent.toLowerCase();

        String os = "";
        String browser = "";

        //=================OS=======================
         if (userAgent.toLowerCase().indexOf("windows") >= 0 )
         {
             os = "Windows";
         } else if(userAgent.toLowerCase().indexOf("mac") >= 0)
         {
             os = "Mac";
         } else if(userAgent.toLowerCase().indexOf("x11") >= 0)
         {
             os = "Unix";
         } else if(userAgent.toLowerCase().indexOf("android") >= 0)
         {
             os = "Android";
         } else if(userAgent.toLowerCase().indexOf("iphone") >= 0)
         {
             os = "IPhone";
         }else{
             os = "UnKnown, More-Info: "+userAgent;
         }
         //===============Browser===========================
        if (user.contains("msie"))
        {
            String substring=userAgent.substring(userAgent.indexOf("MSIE")).split(";")[0];
            browser=substring.split(" ")[0].replace("MSIE", "IE")+"-"+substring.split(" ")[1];
        } else if (user.contains("safari") && user.contains("version"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Safari")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
        } else if ( user.contains("opr") || user.contains("opera"))
        {
            if(user.contains("opera"))
                browser=(userAgent.substring(userAgent.indexOf("Opera")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
            else if(user.contains("opr"))
                browser=((userAgent.substring(userAgent.indexOf("OPR")).split(" ")[0]).replace("/", "-")).replace("OPR", "Opera");
        } else if (user.contains("chrome"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Chrome")).split(" ")[0]).replace("/", "-");
        } else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1)  || (user.indexOf("mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1) || (user.indexOf("mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1) )
        {
            browser = "Netscape-?";

        } else if (user.contains("firefox"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Firefox")).split(" ")[0]).replace("/", "-");
        } else if(user.contains("rv"))
        {
            browser="IE-" + user.substring(user.indexOf("rv") + 3, user.indexOf(")"));
        } else
        {
            browser = "UnKnown, More-Info: "+userAgent;
        }
        
        return os + " / " + browser;
	}
	
	public static void setPageViewLocation(Model model, String main, String sub) {
		model.addAttribute("locationMain", main);
		model.addAttribute("locationSub", sub);
	}
}
