package com.sc.wxutil;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

/**
 * @author uclbrt
 *
 */
public class Demo_UclbrtHttpClient {
	
	/**
	 * main function
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		
		/**
		 * 参数格式请参见
		 *  http://qrm.uclbrt.com/openQrcodeLinkv2.0.html#openCenterMenuAnchor
		 * 中参数说明
		 * **/
		String protocol = "https";
		String ip = "api.uclbrt.com";
		String port = "8058";
		//如下参数格式要求，请参看文档说明，具体数据，参看文档查询。
		String communityNo = "1316879945"; //集群编号
		String buildNo =  "001"; //楼栋编号(楼栋号、楼层号必选同为必选或必不选)
		String floorNo = "001"; //楼层编号(楼栋号、楼层号必选同为必选或必不选)
		String roomNo = "001"; //房间编号(注：如果楼栋编号、楼层编号参数未传入,请确保集群下的房间号唯一)
		String accSid = "98651082ab89c3f1b50f35caf794179f";//账户Id.有32个英文字母和阿拉伯数字组成的主账户唯一标识符
		String token = "e687bc93c89b9b59611de521a70ed4";
		String mobile = "18100615126";
		String begTime ="1711132130";
		String endTime ="1711132135";	
		String areaCode = "86";
		

		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyMMddHHmm");
		String dateString = formatter.format(currentTime);
		Calendar calendar=Calendar.getInstance();   
		calendar.setTime(currentTime); 
		calendar.add(Calendar.MINUTE, 5);
		String dateString1 = formatter.format(calendar.getTime());
		System.out.println("->"+dateString+"-"+dateString1);
		
		begTime = dateString;
		endTime = dateString1;
		
		//TestFuncXML(protocol, ip, port, communityNo, buildNo, floorNo, roomNo, accSid, token,areaCode,mobile,begTime,endTime);

		//TestFuncXMLBySamePara(protocol, ip, port, communityNo, buildNo, floorNo, roomNo, accSid, token, areaCode, mobile, begTime, endTime);
		
		TestFuncJSON(protocol, ip, port, communityNo, buildNo, floorNo, roomNo, accSid, token, areaCode, mobile, begTime, endTime);
		
		//TestFuncJSONBysamePara(protocol, ip, port, communityNo, buildNo, floorNo, roomNo, accSid, token, areaCode, mobile, begTime, endTime);

		
	}
	
	@SuppressWarnings("deprecation")
	public static void TestFuncXML(String protocol,String  ip,String  port,String  communityNo,String  buildNo, String floorNo, String roomNo, String accSid,String  token,String areaCode,String mobile,String begTime,String endTime){
		System.out.println("******************generate card by XML parameters******************");
		String l= getInfoXML(protocol, ip, port, communityNo, buildNo, floorNo, roomNo, accSid, token,areaCode,mobile,begTime,endTime);
		System.out.println(l);
		String roomID = null;
		Document doc = null;
		try {
			doc = DocumentHelper.parseText(l);
			Element rootElt = doc.getRootElement(); 
            Iterator iter = rootElt.elementIterator("no"); 
            if(iter.hasNext()){
            	   Element ele = (Element) iter.next();
                   roomID = ele.getText();
            }
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		System.out.println("******************get card******************");
		//如果 cardNo 参数为空，则返回该号码下所有房卡， 如果不为空 ，则返回该cardNo 对应的房卡
		//cardNo  if cardNo is null , it will return all cards ,if not ,it will return card that key is cardNo
		RSATest.encryTest(communityNo,areaCode,mobile, accSid, token,roomID);
		
		System.out.println("******************cancel by  roomID******************");
		String l3 = cancelInfoXML(protocol,  ip,  port, roomID, accSid,  token );
		System.out.println(l3);
	}
	public static void TestFuncXMLBySamePara(String protocol,String  ip,String  port,String  communityNo,String  buildNo, String floorNo, String roomNo, String accSid,String  token,String areaCode,String mobile,String begTime,String endTime){
		System.out.println("******************generate card by xml parameters*****************");
		String l= getInfoXML(protocol, ip, port, communityNo, buildNo, floorNo, roomNo, accSid, token,areaCode,mobile,begTime,endTime);
		System.out.println(l);
		
		System.out.println("******************get card******************");
		//如果 cardNo 参数为空，则返回该号码下所有房卡， 如果不为空 ，则返回该cardNo 对应的房卡
		//cardNo  if cardNo is null , it will return all cards ,if not ,it will return card that key is cardNo
		RSATest.encryTest(communityNo,areaCode,mobile, accSid, token,null);
		//cancel by parameters same as generate func.
		System.out.println("******************cancel by get parameters******************");
		String l6 = cancelInfoXML(protocol, ip, port, communityNo, buildNo, buildNo, roomNo, accSid, token,areaCode,mobile,begTime,endTime);
		System.out.println(l6);
		
	}
	
	public static void TestFuncJSON(String protocol,String  ip,String  port,String  communityNo,String  buildNo, String floorNo, String roomNo, String accSid,String  token,String areaCode,String mobile,String begTime,String endTime){
		System.out.println("***********generate by json parameters*************************");
		String joStr= getInfoJSON(protocol, ip, port, communityNo, buildNo, floorNo, roomNo, accSid, token,areaCode,mobile,begTime,endTime);
		System.out.println(joStr);
		Map<String , String> jsonInfoMap = new HashMap<String, String>();
		if(null != joStr){
			joStr = joStr.replace("{", "");
			joStr = joStr.replace("}", "");
			String[] jsonInfo = joStr.split(",");
			for(String ji : jsonInfo){
				String[] attriInfo = ji.split(":");
				jsonInfoMap.put(attriInfo[0].replace("\"", ""), attriInfo[1].replace("\"", ""));
			}
		}
		String roomID = jsonInfoMap.get("no");
		
		System.out.println("******************get card******************");
		//如果 cardNo 参数为空，则返回该号码下所有房卡， 如果不为空 ，则返回该cardNo 对应的房卡
		//cardNo  if cardNo is null , it will return all cards ,if not ,it will return card that key is cardNo
		RSATest.encryTest(communityNo,areaCode,mobile, accSid, token,roomID);
		
		System.out.println("******************cancel by  roomID******************");
		//String l4 = cancelInfoJSON( protocol, ip, port, roomID, accSid, token);
		//System.out.println(l4);
	}
	
	public static void TestFuncJSONBysamePara(String protocol,String  ip,String  port,String  communityNo,String  buildNo, String floorNo, String roomNo, String accSid,String  token,String areaCode,String mobile,String begTime,String endTime){
		System.out.println("***********generate by json parameters*************************");
		String joStr= getInfoJSON(protocol, ip, port, communityNo, buildNo, floorNo, roomNo, accSid, token,areaCode,mobile,begTime,endTime);
		System.out.println(joStr);
		
		System.out.println("******************get card******************");
		//如果 cardNo 参数为空，则返回该号码下所有房卡， 如果不为空 ，则返回该cardNo 对应的房卡
		//cardNo  if cardNo is null , it will return all cards ,if not ,it will return card that key is cardNo
		RSATest.encryTest(communityNo,areaCode,mobile, accSid, token,null);
		
		System.out.println("******************cancel by get parameters******************");
		String l5= cancelInfoJSON(protocol, ip, port, communityNo, buildNo, floorNo, roomNo, accSid, token,areaCode,mobile,begTime,endTime);
		System.out.println(l5);	
	}
	
	/**
	 * @param protocol
	 * @param ip
	 * @param port
	 * @param communityNo
	 * @param buildNo
	 * @param floorNo
	 * @param roomNo
	 * @param acc
	 * @param token
	 * @return
	 */
	public static String getFunc(String protocol, String ip, String port,
			String communityNo, String buildNo, String floorNo, String roomNo,String startTime ,String endTime,
			String acc, String token) {
		String result = "";
		EncryptUtil eu = new EncryptUtil();
		String timeT = dateFormat();
		String sig = acc + token + timeT;
		String signature;
		try {
		signature = eu.md5Digest(sig);
		String url = protocol + "://" + ip + ":" + port
				+ "?c=Qrcode&a=get&communityNo=" + communityNo + "&buildNo="
				+ buildNo + "&floorNo=" + floorNo + "&roomNo=" + roomNo
				+ "&startTime="+startTime + "&endTime="+endTime
				+ "&sig=" + signature.toUpperCase();
		
		
		CloseableHttpClient closeableHttpClient = createHttpsClient();
		// 建立HttpPost对象
		HttpPost httppost = new HttpPost(url);
		httppost.setHeader("Accept", "application/json");
		httppost.setHeader("Content-Type",
				"application/json;charset=utf-8");

		String src = acc + ":" + timeT;
		String auth = eu.base64Encoder(src);
		httppost.setHeader("Authorization", auth);
		
		//配置post 数据。
		MultipartEntityBuilder multipartEntityBuilder = MultipartEntityBuilder
				.create();
		multipartEntityBuilder.setCharset(Charset.forName(HTTP.UTF_8));
		// 生成 HTTP POST 实体
		HttpEntity httpEntity = multipartEntityBuilder.build();
		httppost.setEntity(httpEntity);
		// 发送Post,并返回一个HttpResponse对象
		long culTime = System.currentTimeMillis();
		org.apache.http.Header h[] =httppost.getAllHeaders();
		HttpResponse httpResponse = closeableHttpClient.execute(httppost);
		HttpEntity httpEntity1 = httpResponse.getEntity();
		result = EntityUtils.toString(httpEntity1);
		// 关闭连接
		closeableHttpClient.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * @param joStr
	 * @param imgFilePath
	 */
	public static void genPic(String joStr , String imgFilePath){
		if(null != joStr){
		joStr = joStr.replace("{", "");
		joStr = joStr.replace("}", "");
		String[] jsonInfo = joStr.split(",");
		Map<String , String> jsonInfoMap = new HashMap<String, String>();
		for(String ji : jsonInfo){
			String[] attriInfo = ji.split(":");
			jsonInfoMap.put(attriInfo[0].replace("\"", ""), attriInfo[1].replace("\"", ""));
		}
		System.out.println(jsonInfoMap.get("status"));
		if(jsonInfoMap.get("status").equals("200")){
			//保存图片文件
			String picString = jsonInfoMap.get("info");
			try {
				sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
				picString = picString.replace("\\", "");
				// Base64解码
				byte[] b = decoder.decodeBuffer(picString);
				for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
				b[i] += 256;
				}
				}
				// 生成jpeg图片
				FileOutputStream out = new FileOutputStream(new File(imgFilePath));
				out.write(b);
				out.flush();
				out.close();
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	}
	
	public static String getRoomXmlString(String roomCardID){
		StringBuilder sb = new StringBuilder();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<request>");
		sb.append("<no>").append(roomCardID).append("</no>");
		sb.append("</request>");
		return sb.toString();
	}
	
	public static String getXmlString(String protocol, String ip, String port,
			String communityNo, String buildNo, String floorNo, String roomNo,
			String acc, String token ,String areaCode,String mobile,String begTime ,String endTime){
		StringBuilder sb = new StringBuilder();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<request>");
		if(areaCode != null){
			sb.append("<areaCode>").append(areaCode).append("</areaCode>");
		}
		sb.append("<mobile>").append(mobile).append("</mobile>");
		sb.append("<communityNo>").append(communityNo).append("</communityNo>");
		if(buildNo != null){
			sb.append("<buildNo>").append(buildNo).append("</buildNo>");
		}
		if(floorNo != null){
			sb.append("<floorNo>").append(floorNo).append("</floorNo>");
		}
		sb.append("<roomNo>").append(roomNo).append("</roomNo>");
		sb.append("<startTime>").append(begTime).append("</startTime>");
		sb.append("<endTime>").append(endTime).append("</endTime>");
		sb.append("</request>");
		return sb.toString();
	}
	
	public static String getRoomJSONString(String roomCardID){
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"no\":\"").append(roomCardID).append("\"");
		sb.append("}");
		return sb.toString();
	}
	public static String getJSONString(String protocol, String ip, String port,
			String communityNo, String buildNo, String floorNo, String roomNo,
			String acc, String token ,String areaCode,String mobile,String begTime ,String endTime){
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		if(areaCode != null){
			sb.append("\"areaCode\":\"").append(areaCode).append("\",");
		}
		sb.append("\"mobile\":\"").append(mobile).append("\",");
		sb.append("\"communityNo\":\"").append(communityNo).append("\",");
		if(buildNo != null){
			sb.append("\"buildNo\":\"").append(buildNo).append("\",");
		}
		if(floorNo != null){
			sb.append("\"floorNo\":\"").append(floorNo).append("\",");
		}
		sb.append("\"roomNo\":\"").append(roomNo).append("\",");
		sb.append("\"startTime\":\"").append(begTime).append("\",");
		sb.append("\"endTime\":\"").append(endTime).append("\"");
		sb.append("}");
		return sb.toString();
	}
	
	
	public static CloseableHttpClient createHttpsClient() throws Exception {
		X509TrustManager x509mgr = new X509TrustManager() {
			@Override
			public void checkClientTrusted(X509Certificate[] xcs, String string) {
			}

			@Override
			public void checkServerTrusted(X509Certificate[] xcs, String string) {
			}

			@Override
			public X509Certificate[] getAcceptedIssuers() {
				return null;
			}
		};
		SSLContext sslContext = SSLContext.getInstance("TLS");
		sslContext.init(null, new TrustManager[] { x509mgr },
				new java.security.SecureRandom());
		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
				sslContext,
				SSLConnectionSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
		return HttpClients.custom().setSSLSocketFactory(sslsf).build();
	}

	public static String dateFormat() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		Date curDate = new Date(System.currentTimeMillis());
		return formatter.format(curDate);
	}

	public static HashMap<String, Object> xmlToMap(String xml) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Document doc = null;
		try {
			doc = DocumentHelper.parseText(xml); // 将字符串转为XML
			Element rootElt = doc.getRootElement(); // 获取根节点
			HashMap<String, Object> hashMap2 = new HashMap<String, Object>();
			ArrayList<HashMap<String, Object>> arrayList = new ArrayList<HashMap<String, Object>>();
			for (Iterator i = rootElt.elementIterator(); i.hasNext();) {
				Element e = (Element) i.next();
				if ("statusCode".equals(e.getName())
						|| "statusMsg".equals(e.getName()))
					map.put(e.getName(), e.getText());
				else {
					{
						HashMap<String, Object> hashMap3 = new HashMap<String, Object>();
						for (Iterator i2 = e.elementIterator(); i2.hasNext();) {
							Element e2 = (Element) i2.next();
							hashMap3.put(e2.getName(), e2.getText());
						}
						if (hashMap3.size() != 0) {
							hashMap2.put(e.getName(), hashMap3);
						} else {
							hashMap2.put(e.getName(), e.getText());
						}
						map.put("data", hashMap2);
					}
				}
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * @param protocol   	https
	 * @param ip 			address
	 * @param port			port
	 * @param communityNo	community number
	 * @param buildNo		build number
	 * @param floorNo		floor number
	 * @param roomNo		room number
	 * @param acc			account sid
	 * @param token			token
	 * @param areaCode		areaCode if null, the default is 86(china).
	 * @param mobile		mobile number
	 * @param begTime		begin time
	 * @param endTime		end time
	 * @return				room number
	 */
	public static String getInfoXML(String protocol, String ip, String port,
			String communityNo, String buildNo, String floorNo, String roomNo,
			String acc, String token ,String areaCode ,String mobile,String begTime ,String endTime) {
		String result = "";
		EncryptUtil eu = new EncryptUtil();
		String timeT = dateFormat();
		String sig = acc + token + timeT;
		String signature;
		try {
		signature = eu.md5Digest(sig);
		String url = protocol + "://" + ip + ":" + port
				+ "?c=Qrcode&a=getLink&sig=" + signature.toUpperCase();
		CloseableHttpClient closeableHttpClient = createHttpsClient();
		// 建立HttpPost对象
		HttpPost httppost = new HttpPost(url);
		
		httppost.setHeader("Accept", "application/xml");
		httppost.setHeader("Content-Type",
				"application/x-www-form-urlencode;charset=utf-8");
		
		String src = acc + ":" + timeT;
		String auth = eu.base64Encoder(src);
		httppost.setHeader("Authorization", auth);
		//TODO  BEGIN
		
		String reqXml = getXmlString( protocol,  ip,  port,
				 communityNo,  buildNo,  floorNo,  roomNo,
				 acc,  token , areaCode,mobile, begTime , endTime);
		
		BasicHttpEntity bhe = new BasicHttpEntity();
		ByteArrayInputStream bis = new ByteArrayInputStream(reqXml.getBytes("UTF-8"));
		bhe.setContent(new ByteArrayInputStream(reqXml
				.getBytes("UTF-8")));
		bhe.setContentLength(reqXml.getBytes("UTF-8").length);
		httppost.setEntity(bhe);
		
		
		 //TODO END		 
		long culTime = System.currentTimeMillis();
		org.apache.http.Header h[] =httppost.getAllHeaders();
		HttpResponse httpResponse = closeableHttpClient.execute(httppost);
		HttpEntity httpEntity1 = httpResponse.getEntity();
		result = EntityUtils.toString(httpEntity1);
		// 关闭连接
		closeableHttpClient.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static String cancelInfoXML(String protocol, String ip, String port,
			String communityNo, String buildNo, String floorNo, String roomNo,
			String acc, String token ,String areaCode,String mobile,String begTime ,String endTime) {
		String result = "";
		EncryptUtil eu = new EncryptUtil();
		String timeT = dateFormat();
		String sig = acc + token + timeT;
		String signature;
		try {
		signature = eu.md5Digest(sig);
		String url = protocol + "://" + ip + ":" + port
				+ "?c=Qrcode&a=cancelCardByRoom&sig=" + signature.toUpperCase();
		CloseableHttpClient closeableHttpClient = createHttpsClient();
		// 建立HttpPost对象
		HttpPost httppost = new HttpPost(url);
		
		httppost.setHeader("Accept", "application/xml");
		httppost.setHeader("Content-Type",
				"application/x-www-form-urlencode;charset=utf-8");
		
		String src = acc + ":" + timeT;
		String auth = eu.base64Encoder(src);
		httppost.setHeader("Authorization", auth);
		//TODO  BEGIN
		
		String reqXml = getXmlString( protocol,  ip,  port,
				 communityNo,  buildNo,  floorNo,  roomNo,
				 acc,  token , areaCode,mobile, begTime , endTime);
		
		BasicHttpEntity bhe = new BasicHttpEntity();
		ByteArrayInputStream bis = new ByteArrayInputStream(reqXml.getBytes("UTF-8"));
		bhe.setContent(new ByteArrayInputStream(reqXml
				.getBytes("UTF-8")));
		bhe.setContentLength(reqXml.getBytes("UTF-8").length);
		httppost.setEntity(bhe);
		
		
		 //TODO END		 
		long culTime = System.currentTimeMillis();
		org.apache.http.Header h[] =httppost.getAllHeaders();
		HttpResponse httpResponse = closeableHttpClient.execute(httppost);
		HttpEntity httpEntity1 = httpResponse.getEntity();
		result = EntityUtils.toString(httpEntity1);
		// 关闭连接
		closeableHttpClient.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static String cancelInfoXML(String protocol, String ip, String port,
			String roomCardID,String acc, String token ) {
		String result = "";
		EncryptUtil eu = new EncryptUtil();
		String timeT = dateFormat();
		String sig = acc + token + timeT;
		String signature;
		try {
		signature = eu.md5Digest(sig);
		String url = protocol + "://" + ip + ":" + port
				+ "?c=Qrcode&a=cancelCard&sig=" + signature.toUpperCase();
		CloseableHttpClient closeableHttpClient = createHttpsClient();
		// 建立HttpPost对象
		HttpPost httppost = new HttpPost(url);
		
		httppost.setHeader("Accept", "application/xml");
		httppost.setHeader("Content-Type",
				"application/x-www-form-urlencode;charset=utf-8");
		
		String src = acc + ":" + timeT;
		String auth = eu.base64Encoder(src);
		httppost.setHeader("Authorization", auth);
		//TODO  BEGIN
		
		String reqXml = getRoomXmlString(roomCardID);
		
		BasicHttpEntity bhe = new BasicHttpEntity();
		ByteArrayInputStream bis = new ByteArrayInputStream(reqXml.getBytes("UTF-8"));
		bhe.setContent(new ByteArrayInputStream(reqXml
				.getBytes("UTF-8")));
		bhe.setContentLength(reqXml.getBytes("UTF-8").length);
		httppost.setEntity(bhe);
		
		
		 //TODO END		 
		long culTime = System.currentTimeMillis();
		org.apache.http.Header h[] =httppost.getAllHeaders();
		HttpResponse httpResponse = closeableHttpClient.execute(httppost);
		HttpEntity httpEntity1 = httpResponse.getEntity();
		result = EntityUtils.toString(httpEntity1);
		// 关闭连接
		closeableHttpClient.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
    
	public static String getInfoJSON(String protocol, String ip, String port,
			String communityNo, String buildNo, String floorNo, String roomNo,
			String acc, String token,String areaCode,String mobile,String begTime ,String endTime) {
		String result = "";
		EncryptUtil eu = new EncryptUtil();
		String timeT = dateFormat();
		String sig = acc + token + timeT;
		String signature;
		try {
		signature = eu.md5Digest(sig);
		String url = protocol + "://" + ip + ":" + port
				+ "?c=Qrcode&a=getLink&sig=" + signature.toUpperCase();
		CloseableHttpClient closeableHttpClient = createHttpsClient();
		// 建立HttpPost对象
		HttpPost httppost = new HttpPost(url);
		
		
		httppost.setHeader("Accept", "application/json");
		httppost.setHeader("Content-Type",
				"application/x-www-form-urlencode;charset=utf-8");

		
		String src = acc + ":" + timeT;
		String auth = eu.base64Encoder(src);
		httppost.setHeader("Authorization", auth);
		String reqXml1 = getJSONString( protocol,  ip,  port,
				 communityNo,  buildNo,  floorNo,  roomNo,
				 acc,  token , areaCode ,mobile, begTime , endTime);
		
		BasicHttpEntity bhe = new BasicHttpEntity();
		bhe.setContent(new ByteArrayInputStream(reqXml1
				.getBytes("UTF-8")));
		bhe.setContentLength(reqXml1.getBytes("UTF-8").length);
		httppost.setEntity(bhe);
		long culTime = System.currentTimeMillis();
		org.apache.http.Header h[] =httppost.getAllHeaders();
		HttpResponse httpResponse = closeableHttpClient.execute(httppost);
		
//		System.out.println("获取数据消耗时间（毫秒）： "+(System.currentTimeMillis()-culTime));
		HttpEntity httpEntity1 = httpResponse.getEntity();
		result = EntityUtils.toString(httpEntity1);
		// 关闭连接
		closeableHttpClient.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static String cancelInfoJSON(String protocol, String ip, String port,
			String communityNo, String buildNo, String floorNo, String roomNo,
			String acc, String token,String areaCode ,String mobile,String begTime ,String endTime) {
		String result = "";
		EncryptUtil eu = new EncryptUtil();
		String timeT = dateFormat();
		String sig = acc + token + timeT;
		String signature;
		try {
		signature = eu.md5Digest(sig);
		String url = protocol + "://" + ip + ":" + port
				+ "?c=Qrcode&a=cancelCardByRoom&sig=" + signature.toUpperCase();
		CloseableHttpClient closeableHttpClient = createHttpsClient();
		// 建立HttpPost对象
		HttpPost httppost = new HttpPost(url);
		
		
		httppost.setHeader("Accept", "application/json");
		httppost.setHeader("Content-Type",
				"application/x-www-form-urlencode;charset=utf-8");

		
		String src = acc + ":" + timeT;
		String auth = eu.base64Encoder(src);
		httppost.setHeader("Authorization", auth);
		String reqXml1 = getJSONString( protocol,  ip,  port,
				 communityNo,  buildNo,  floorNo,  roomNo,
				 acc,  token , areaCode ,mobile, begTime , endTime);
		
		BasicHttpEntity bhe = new BasicHttpEntity();
		bhe.setContent(new ByteArrayInputStream(reqXml1
				.getBytes("UTF-8")));
		bhe.setContentLength(reqXml1.getBytes("UTF-8").length);
		httppost.setEntity(bhe);
		long culTime = System.currentTimeMillis();
		org.apache.http.Header h[] =httppost.getAllHeaders();
		HttpResponse httpResponse = closeableHttpClient.execute(httppost);
		
//		System.out.println("获取数据消耗时间（毫秒）： "+(System.currentTimeMillis()-culTime));
		HttpEntity httpEntity1 = httpResponse.getEntity();
		result = EntityUtils.toString(httpEntity1);
		// 关闭连接
		closeableHttpClient.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static String cancelInfoJSON(String protocol, String ip, String port,
			String roomCardID,String acc, String token) {
		String result = "";
		EncryptUtil eu = new EncryptUtil();
		String timeT = dateFormat();
		String sig = acc + token + timeT;
		String signature;
		try {
		signature = eu.md5Digest(sig);
		String url = protocol + "://" + ip + ":" + port
				+ "?c=Qrcode&a=cancelCard&sig=" + signature.toUpperCase();
		CloseableHttpClient closeableHttpClient = createHttpsClient();
		// 建立HttpPost对象
		HttpPost httppost = new HttpPost(url);
		
		
		httppost.setHeader("Accept", "application/json");
		httppost.setHeader("Content-Type",
				"application/x-www-form-urlencode;charset=utf-8");

		
		String src = acc + ":" + timeT;
		String auth = eu.base64Encoder(src);
		httppost.setHeader("Authorization", auth);
		String reqXml1 = getRoomJSONString(roomCardID);
		
		BasicHttpEntity bhe = new BasicHttpEntity();
		bhe.setContent(new ByteArrayInputStream(reqXml1
				.getBytes("UTF-8")));
		bhe.setContentLength(reqXml1.getBytes("UTF-8").length);
		httppost.setEntity(bhe);
		long culTime = System.currentTimeMillis();
		org.apache.http.Header h[] =httppost.getAllHeaders();
		HttpResponse httpResponse = closeableHttpClient.execute(httppost);
		
//		System.out.println("获取数据消耗时间（毫秒）： "+(System.currentTimeMillis()-culTime));
		HttpEntity httpEntity1 = httpResponse.getEntity();
		result = EntityUtils.toString(httpEntity1);
		// 关闭连接
		closeableHttpClient.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
    
}