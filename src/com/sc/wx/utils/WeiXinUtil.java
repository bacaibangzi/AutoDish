package com.sc.wx.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.dom4j.Element;
import org.json.JSONObject;

import com.linkage.netmsg.NetMsgclient;
import com.sc.framework.utils.NetMsgclientSingleton;

/**
 * 微信公共类
 * 
 * @author cuibin
 * 
 */
public class WeiXinUtil {

	// 令牌
	public static final String TOKEN = "jbm";// "wwwscposcom";

	/**
	 * checkSignature
	 * 
	 * @param request
	 * @return
	 */
	public static boolean checkSignature(HttpServletRequest request) {
		try {
			String signature = request.getParameter("signature");
			String timestamp = request.getParameter("timestamp");
			String nonce = request.getParameter("nonce");
			String[] tmpArr = { TOKEN, timestamp, nonce };
			Arrays.sort(tmpArr);
			String tmpStr = ArrayToString(tmpArr);
			tmpStr = SHA1Encode(tmpStr);
			if (tmpStr.equalsIgnoreCase(signature)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * SHA1Encode
	 * 
	 * @param sourceString
	 * @return
	 */
	public static String SHA1Encode(String sourceString) {
		String resultString = null;
		try {
			resultString = new String(sourceString);
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			resultString = byte2hexString(md.digest(resultString
					.getBytes("gbk")));
		} catch (Exception ex) {
		}
		return resultString;
	}

	/**
	 * byte2hexString
	 * 
	 * @param bytes
	 * @return
	 */
	public static final String byte2hexString(byte[] bytes) {
		StringBuffer buf = new StringBuffer(bytes.length * 2);
		for (int i = 0; i < bytes.length; i++) {
			if (((int) bytes[i] & 0xff) < 0x10) {
				buf.append("0");
			}
			buf.append(Long.toString((int) bytes[i] & 0xff, 16));
		}
		return buf.toString().toUpperCase();
	}

	/**
	 * ArrayToString
	 * 
	 * @param arr
	 * @return
	 */
	public static String ArrayToString(String[] arr) {
		StringBuffer bf = new StringBuffer();
		for (int i = 0; i < arr.length; i++) {
			bf.append(arr[i]);
		}
		return bf.toString();
	}

	/**
	 * getMapHash
	 * 
	 * @param element
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map getMapHash(Element element) {
		Map<String, String> map = new HashMap<String, String>();
		List<Element> elements = element.elements();
		for (Element element2 : elements) {
			map.put(element2.getName(), element2.getText());
		}
		return map;
	}
	
	public static String getOpenID(String appid, String appSecret, String code){
		String openid = "";	
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&secret="+appSecret+"&code="+code+"&grant_type=authorization_code";
		System.out.println("++++++++++++++url: "+url);
		try{
			URL urlGet = new URL(url);
			HttpURLConnection http = (HttpURLConnection) urlGet
					.openConnection();

			http.setRequestMethod("GET"); // 必须是get方式请求
			http.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);
			System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
			System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
			http.connect();

			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] jsonBytes = new byte[size];
			is.read(jsonBytes);
			String message = new String(jsonBytes, "UTF-8");
			JSONObject jsonString = new JSONObject(message);
			System.out.println("++++++++++++++jsonString: "+jsonString);
			openid = jsonString.getString("openid");
		}catch(Exception err){
			err.printStackTrace();
		}
		return openid;
	}
	
	public static String getAccess_token(String APPID, String APPSECRET) throws Exception{

		String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
				+ APPID + "&secret=" + APPSECRET;
		System.out.println("+++++++++++++++++++url: "+url);
		String accessToken = null;
//		try {
			URL urlGet = new URL(url);
			HttpURLConnection http = (HttpURLConnection) urlGet
					.openConnection();

			http.setRequestMethod("GET"); // 必须是get方式请求
			http.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);
			System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
			System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
			http.connect();

			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] jsonBytes = new byte[size];
			is.read(jsonBytes);
			String message = new String(jsonBytes, "UTF-8");

			JSONObject demoJson = new JSONObject(message);
			System.out.println(demoJson);
			accessToken = demoJson.getString("access_token");

			System.out.println(message);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		return accessToken;
	}
	
	/**
	 * 发送消息
	 * @param access_token
	 * @param openid
	 * @param msg
	 * @return
	 */

    public final static String CUSTOMER_SEND = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=";//客服，向用户发送消息
    
	public static boolean customerSendMsg(String access_token,String openid,String msg){
		try {
			String data = "{\"touser\":\""+openid+"\",\"msgtype\":\"text\",\"text\":{\"content\":\""+msg+"\"}}";
			System.out.println("data="+data);
			
			String jsonString = HttpUtils.sendPostUrl(CUSTOMER_SEND+access_token, data, "utf-8");
			System.out.println("jsonString="+jsonString);
			ObjectMapper mapper = new ObjectMapper();
			JsonNode root= mapper.readTree(jsonString);
			String errcode = (root.get("errcode"))+"";
			String errmsg = (root.get("errmsg"))+"";
			System.out.println("errcode="+errcode+",errmsg="+errmsg);
			
			if("0".equals(errcode)){
				return true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	public static void createMean(String APPID, String APPSECRET,String menu)throws Exception {

				/*
				String menu = "{\"button\":[{\"type\":\"view\",\"name\":\"微餐饮1\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd9ccc742b1c39110&redirect_uri=http://yun.scpos.com/CateSystem/weiXinCY/weixinDZ-weixin&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect\"}," +
						"{\"type\":\"view\",\"name\":\"微官网\",\"url\":\"http://www.5566.net\"}," +
						"{\"type\":\"view\",\"name\":\"我的\",\"url\":\"http://yun.scpos.com/CateSystem/weiXinCY/weixinDZ-weixin/\"}]}";
				*/
		
				menu = "{\"button\":[{\"type\":\"view\",\"name\":\"在线订房\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd74c43a48ccfb9f8&redirect_uri=http://yun.scpos.com/QRCodeLock/wx/index-weixin&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect\"}," +
						//"{\"type\":\"view\",\"name\":\"微官网\",\"url\":\"http://www.5566.net\"}," +
						"{\"type\":\"view\",\"name\":\"我的房卡\",\"url\":\"http://yun.scpos.com/QRCodeLock/wx/rqCode-weixin\"}]}";
		
				// 此处改为自己想要的结构体，替换即可
				String access_token = getAccess_token(APPID, APPSECRET);

				String action = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token="
						+ access_token;
//				try {
					URL url = new URL(action);
					HttpURLConnection http = (HttpURLConnection) url.openConnection();

					http.setRequestMethod("POST");
					http.setRequestProperty("Content-Type",
							"application/x-www-form-urlencoded");
					http.setDoOutput(true);
					http.setDoInput(true);
					System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
					System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒

					http.connect();
					OutputStream os = http.getOutputStream();
					os.write(menu.getBytes("UTF-8"));// 传入参数
					os.flush();
					os.close();

					InputStream is = http.getInputStream();
					int size = is.available();
					byte[] jsonBytes = new byte[size];
					is.read(jsonBytes);
					String message = new String(jsonBytes, "UTF-8");
					System.out.println(message);
//				} catch (MalformedURLException e) {
//					e.printStackTrace();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
			}
	
	public static void main(String args[]) throws Exception{
		
		//wx9604c6b26801507e  710e5872ffdf1e59ed2bd51e378bff11
		createMean("wxd74c43a48ccfb9f8", "3199c86b7a61212cb9f5da36d26ea765","");
	}
	/**
	 * 短信验证码发送	
	 */
	public static void sendCode(String tel,String code) throws Exception{
			NetMsgclientSingleton msgclientSingleton  =NetMsgclientSingleton.getInstance();
			NetMsgclient msgclient = msgclientSingleton.getClient();
			String msgReturn = msgclient.sendMsg(msgclient, 1, tel, NetMsgclientSingleton.mode.replaceAll("X", code)
				, 1);

			System.out.println("获取手机短信验证码发送返回值："+msgReturn);
			
			msgclient.closeConn();
	}
}
