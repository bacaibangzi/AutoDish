package com.sc.wx.utils;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.sc.framework.utils.NetMsgclientSingleton;
import com.sc.wx.pojo.AccessToken;
import com.sc.wx.pojo.BaseResp;
import com.sc.wx.pojo.Button_click;
import com.sc.wx.pojo.RetInfo;
import com.sc.wx.pojo.UserBaseInfo;

import net.sf.json.JSONObject;
/**
 * 微信接口类（多项微信端功能）
 * @author pan
 *
 */
public class WX {
    private final static Log log = LogFactory.getLog(WX.class);
    public final static String HOST = "https://mp.weixin.qq.com";
    public final static String LOGIN_URL = "https://mp.weixin.qq.com/cgi-bin/login";
    public final static String VERIFYCODE_URL = "https://mp.weixin.qq.com/cgi-bin/verifycode";
    public final static String LOGOUT_URL = "https://mp.weixin.qq.com/cgi-bin/logout?t=wxm-logout&lang=zh_CN";
    public final static String MODE_CHANGE_URL = "https://mp.weixin.qq.com/misc/skeyform";//修改高级设置模式，
    public final static String SERVER_CONFIG = "https://mp.weixin.qq.com/advanced/callbackprofile";//设置服务器，
    
    
    public final static String GET_ACCESS_TOKEN = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&";//
    public final static String GET_USER_BASE_INFO = "https://api.weixin.qq.com/cgi-bin/user/info?&lang=zh_CN&";//
    public final static String MENU = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=";//添加菜单
    public final static String CUSTOMER_SEND = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=";//客服，向用户发送消息
    
    public final static String USER_AGENT_H = "User-Agent";
    public final static String USER_AGENT = "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36";
    public final static String REFERER_H = "Referer";
    public final static String REFERER = "https://mp.weixin.qq.com/";
    private HttpClient client = new HttpClient();
    
    private static WX wX = new WX();

    private Cookie[] cookies;
    private String cookiestr;

    public String token;
    public int loginErrCode;
    public String loginErrMsg;
    private int msgSendCode;
    private String msgSendMsg;

    private String loginUser;
    private String loginPwd;
    private boolean isLogin = false;
    
    public static WX  getInstance(){
    	return wX;
    }
    
    
    
    private WX() {
    }
    
    private WX(String user, String pwd) {
    	this.loginUser = user;
    	this.loginPwd = pwd;
    }

    public Cookie[] getCookies() {
        return cookies;
    }

    public void setCookies(Cookie[] cookies) {
        this.cookies = cookies;
    }

    public String getCookiestr() {
        return cookiestr;
    }

    public void setCookiestr(String cookiestr) {
        this.cookiestr = cookiestr;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getLoginErrCode() {
        return loginErrCode;
    }

    public void setLoginErrCode(int loginErrCode) {
        this.loginErrCode = loginErrCode;
    }

    public String getLoginErrMsg() {
        return loginErrMsg;
    }

    public void setLoginErrMsg(String loginErrMsg) {
        this.loginErrMsg = loginErrMsg;
    }

    public int getMsgSendCode() {
        return msgSendCode;
    }

    public void setMsgSendCode(int msgSendCode) {
        this.msgSendCode = msgSendCode;
    }

    public String getMsgSendMsg() {
        return msgSendMsg;
    }

    public void setMsgSendMsg(String msgSendMsg) {
        this.msgSendMsg = msgSendMsg;
    }

    public String getLoginUser() {
        return loginUser;
    }

    public void setLoginUser(String loginUser) {
        this.loginUser = loginUser;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public boolean isLogin() {
        return isLogin;
    }

    public void setLogin(boolean isLogin) {
        this.isLogin = isLogin;
    }



    
    /**
     * 获取验证码
     *
     * @throws org.apache.commons.httpclient.HttpException
     *
     * @throws java.io.IOException
     */
    
    public void getVerifyCode() {
			try{
				GetMethod get = new GetMethod(VERIFYCODE_URL+"?username="+loginUser+"&r="+System.currentTimeMillis());
    	        get.setRequestHeader(USER_AGENT_H, USER_AGENT);
    	        
    	        int status = client.executeMethod(get);
    	        if (status == HttpStatus.SC_OK) {
    	            
    	            File f = new File("D:\\code.jpg");
    	            FileOutputStream fout =new FileOutputStream("D:\\code.jpg");
    	            InputStream  in= get.getResponseBodyAsStream();
    	            byte[] b = new byte[1024];
    	            int index;
    	            while((index=in.read(b))!=-1){
    	            	fout.write(b,0,index);
    	               }
    	            
    	            in.close();
    	            fout.close();
    	            
    	            this.cookies = client.getState().getCookies();
                    StringBuffer cookie = new StringBuffer();
                    for (Cookie c : client.getState().getCookies()) {
                        cookie.append(c.getName()).append("=")
                                .append(c.getValue()).append(";");
                    }
                    this.cookiestr = cookie.toString();
    	        }
			}catch(Exception e){
				
			}
    	        
	}

	/**
     * 发送登录信息,记录cookie，登录状态，token等信息
     *
     * @return
     */
    public boolean _login(String imgcode) {
        try {
            PostMethod post = new PostMethod(LOGIN_URL);
            post.setRequestHeader("ContentType", "application/x-www-form-urlencoded");
            post.setRequestHeader("Cookie", cookiestr);
            post.setRequestHeader(REFERER_H, REFERER);
            post.setRequestHeader(USER_AGENT_H, USER_AGENT);
            post.setParameter("lang", "zh_CN");
            
//            String imgcode="";
//            if(this.loginErrCode==-8||this.loginErrCode==-27){//有验证码
//            	BufferedReader strin=new BufferedReader(new InputStreamReader(System.in)); 
//                System.out.print("请输入验证码：");  
//                imgcode = strin.readLine(); 
//            }
            
            NameValuePair[] params = new NameValuePair[]{
                    new NameValuePair("username", loginUser),
                    new NameValuePair("pwd", DigestUtils.md5Hex(loginPwd.getBytes("gbk"))),
                    new NameValuePair("imgcode", imgcode),
                    new NameValuePair("f", "json")};
            
            
            post.setQueryString(params);
            
            int status = client.executeMethod(post);
           
            if (status == HttpStatus.SC_OK) {
                String ret = post.getResponseBodyAsString();
                RetInfo retcode = JSON.parseObject(ret, RetInfo.class);
                this.cookies = client.getState().getCookies();
                
                StringBuffer cookie = new StringBuffer();
                for (Cookie c : client.getState().getCookies()) {
                    cookie.append(c.getName()).append("=")
                            .append(c.getValue()).append(";");
                }
                this.cookiestr = cookie.toString();
                
                if (retcode.getBase_resp().getRet().equals("0")) {
                    
                    this.isLogin = true;
                    this.token = getToken(retcode.getRedirect_url());
                    return true;
                }
                
                int errCode = Integer.valueOf(retcode.getBase_resp().getRet());
                this.loginErrCode = errCode;
                switch (errCode) {

                    case -1:
                        this.loginErrMsg = "系统错误，请稍候再试。";
                        return false;
                    case -2:
                        this.loginErrMsg = "帐号或密码错误";
                        return false;
                    case -23:
                        this.loginErrMsg = "您输入的帐号或者密码不正确，请重新输入。";
                        return false;
                    case -21:
                        this.loginErrMsg = "不存在该帐户";
                        return false;
                    case -7:
                        this.loginErrMsg = "访问受限";
                        return false;
                    case -8:
                        this.loginErrMsg = "需要输入验证码";
                        return false;
                    case -27:
                        this.loginErrMsg = "验证码输入错误";
                        return false;
                    case -26:
                        this.loginErrMsg = "该公众会议号已经过期，无法再登录使用。";
                        return false;
                    case -25:
                        this.loginErrMsg = "海外帐号请在公众平台海外版登录";
                        return false;
                    case 0:
                        this.loginErrMsg = "成功登陆，正在跳转...";
                        return true;
                    default:
                        this.loginErrMsg = "未知的返回";
                        return false;
                }
            }
        } catch (Exception e) {
        	e.printStackTrace();
            return false;
        }
        return false;
    }
    
    
    //关闭编辑模式
    public boolean closeEditMode() {
    	try {
    		
    		PostMethod post = new PostMethod(MODE_CHANGE_URL);
    		post.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=UTF-8");
    		post.setRequestHeader("Cookie",  cookiestr);
    		post.setRequestHeader(REFERER_H, REFERER);
    		post.setRequestHeader(USER_AGENT_H, USER_AGENT);
    		
    		post.setParameter("form", "advancedswitchform");
    		post.setParameter("lang", "zh_CN");
    		
    		NameValuePair[] params = new NameValuePair[]{
    				new NameValuePair("flag", "0"),
    				new NameValuePair("type", "1"),
    				new NameValuePair("token", getToken())};
    		
    		post.setQueryString(params);
    		
    		int status = client.executeMethod(post);
    		
    		if (status == HttpStatus.SC_OK) {
    			String ret = post.getResponseBodyAsString();
    			RetInfo retcode = JSON.parseObject(ret, RetInfo.class);
    			if(retcode.getBase_resp().getRet().equals("0"))
    				return true;
    			else
    				return false;
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    		return false;
    	}
    	return false;
    }
    
    //打开开发模式
    public boolean openDevelopMode() {
    	try {
    		PostMethod post = new PostMethod(MODE_CHANGE_URL);
    		post.setRequestHeader("ContentType", "application/x-www-form-urlencoded");
    		post.setRequestHeader("Cookie", cookiestr);
    		post.setRequestHeader(REFERER_H, REFERER);
    		post.setRequestHeader(USER_AGENT_H, USER_AGENT);
    		
    		post.setParameter("form", "advancedswitchform");
    		post.setParameter("lang", "zh_CN");
    		
    		NameValuePair[] params = new NameValuePair[]{
    				new NameValuePair("flag", "1"),
    				new NameValuePair("type", "2"),
    				new NameValuePair("token", getToken())};
    		
    		post.setQueryString(params);
    		
    		int status = client.executeMethod(post);
    		
    		if (status == HttpStatus.SC_OK) {
    			String ret = post.getResponseBodyAsString();
    			RetInfo retcode = JSON.parseObject(ret, RetInfo.class);
    			if(retcode.getBase_resp().getRet().equals("0"))
    				return true;
    			else
    				return false;
    		}
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    		return false;
    	}
    	return false;
    }
    
    //打开开发模式
    public boolean setServerConfig() {
    	try {
    		PostMethod post = new PostMethod(SERVER_CONFIG);
    		post.setRequestHeader("ContentType", "application/x-www-form-urlencoded");
    		post.setRequestHeader("Cookie", cookiestr);
    		post.setRequestHeader(REFERER_H, REFERER);
    		post.setRequestHeader(USER_AGENT_H, USER_AGENT);
    		post.setParameter("t", "ajax-response");
    		post.setParameter("token", getToken());
    		post.setParameter("lang", "zh_CN");
    		
    		NameValuePair[] params = new NameValuePair[]{
    				new NameValuePair("url", "http://115.28.155.165/hddpos_server/WeixinServer"),
    				new NameValuePair("callback_token", "wwwscposcom")};
    		
    		post.setQueryString(params);
    		
    		int status = client.executeMethod(post);
    		
    		if (status == HttpStatus.SC_OK) {
    			String ret = post.getResponseBodyAsString();
    			BaseResp resp = JSON.parseObject(ret, BaseResp.class);
    			if(resp.getRet().equals("0"))
    				return true;
    			else
    				return false;
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    		return false;
    	}
    	return false;
    }

    
    /**
     * 从登录成功的信息中分离出token信息
     *
     * @param s
     * @return
     */
    private String getToken(String s) {
        try {
            if (StringUtils.isBlank(s))
                return null;
            String[] ss = StringUtils.split(s, "?");
            String[] params = null;
            if (ss.length == 2) {
                if (!StringUtils.isBlank(ss[1]))
                    params = StringUtils.split(ss[1], "&");
            } else if (ss.length == 1) {
                if (!StringUtils.isBlank(ss[0]) && ss[0].indexOf("&") != -1)
                    params = StringUtils.split(ss[0], "&");
            } else {
                return null;
            }
            for (String param : params) {
                if (StringUtils.isBlank(param))
                    continue;
                String[] p = StringUtils.split(param, "=");
                if (null != p && p.length == 2
                        && StringUtils.equalsIgnoreCase(p[0], "token"))
                    return p[1];

            }
        } catch (Exception e) {
            String info = "【解析Token失败】【发生异常：" + e.getMessage() + "】";
            System.err.println(info);
            log.debug(info);
            log.info(info);
            return null;
        }
        return null;
    }

    /**
     * 登出操作
     *
     * @throws org.apache.commons.httpclient.HttpException
     *
     * @throws java.io.IOException
     */
    public boolean logout(){
    	try {
    		GetMethod get = new GetMethod(LOGOUT_URL);
            get.setRequestHeader(USER_AGENT_H, USER_AGENT);
            get.setRequestHeader("Cookie", this.cookiestr);
            int status = client.executeMethod(get);
            if (status == HttpStatus.SC_OK) {
                return true;
            }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
        return false;
    }


    

    /**
     * 页面跳转
     *
     * @param url
     */

    public String redirect(String url) {
        
        try {
        	
        	if (url.indexOf("https://") == -1)
                url = HOST + url;
        	
        	if (this.isLogin) {
                GetMethod get = new GetMethod(url);
                get.setRequestHeader(USER_AGENT_H, USER_AGENT);
                get.setRequestHeader(REFERER_H, REFERER);
                get.setRequestHeader("Cookie", this.cookiestr);
                int status = client.executeMethod(get);
                if (status == HttpStatus.SC_OK) {
                    return get.getResponseBodyAsString();
                }
            }
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return null;
    }

    
    
    /**
     * 使用方法:<br>
     * new Weixin()对象，先登录再取粉丝数或者群发。<br>
     * 群发需要传入一个MsgForm参数： 默认发送文本消息，发送给中国区<br>
     * 所以不需要再设置其他参数，调用setContent将需要发送的内容填充就OK<br>
     * 内容中的超链接可以直接发送不用使用<a>标签
     *
     * @param args
     */
//    public  void main(String[] args) {
//
//
//        String LOGIN_USER = "2472414206@qq.com";
//        String LOGIN_PWD = "123456";
////        String LOGIN_USER = "scpos@scpos.com";
////        String LOGIN_PWD = "4000677770";
//        
//        
//        
//    	 Weixin wx = new Weixin(LOGIN_USER, LOGIN_PWD);
//         if(!wx._login(null)){
//        	 if(wx.loginErrCode==-8||wx.loginErrCode==-27){//有验证码
//             	wx.getVerifyCode();
//             }else{//提示错误信息
//            	 System.out.println(wx.loginErrMsg);
//             }
//         }else{
//        	 System.out.println("登录成功！");
//        	 String doc = wx.redirect("/cgi-bin/settingpage?t=setting/index&action=index&token="+wx.token+"&lang=zh_CN");
//        	 
//        	 String originalID = wx.getOriginalID(doc);
//             System.out.println("原始ID:"+originalID);
//             
//             boolean isServiceNo=wx.isServiceNo(doc);
//             System.out.println("服务号："+isServiceNo);
//             
//             boolean isCertification=wx.isCertification(doc);
//             System.out.println("认证情况："+isCertification);
//             
//             System.out.println("配置开发者模式中的服务器信息："+wx.setServerConfig());
//             System.out.println("关闭编辑模式："+wx.closeEditMode());
//             System.out.println("打开开发者模式："+wx.openDevelopMode());
//             doc = wx.redirect("/advanced/advanced?action=dev&t=advanced/dev&token="+wx.token+"&lang=zh_CN");
//             
//             String appID=wx.getAppID(doc);
//             System.out.println("AppId:"+appID);
//             
//             String appSecret=wx.getAppSecret(doc);
//             System.out.println("AppSecret:"+appSecret);
//             
//             System.out.println("注销登录："+wx.logout());
//             
//             AccessToken accessToken = getAccessToken(appID, appSecret);
//             
//             System.out.println("代码植入："+addMenu(accessToken.getAccess_token(), makeMenu())); 
//         }
//        
//    	
//    	
//    	
//    	
//    	
//    	
//    	
//    	
//    	
//    	//获取用户基本信息
//    	//先通过 originalId 数据库里查询，weixin 表中的 AccessToken，AccessTokenTimeout ，检测AccessTokenTimeout是不是已经小于当前时间
//    	//是：就重新获取，并更新AccessTokenTimeout值，否则：就直接使用AccessToken
//    	
//    	String originalId=null,openId = null;
//    	
//    	
//    	String access = null;
//    	
//    	AccessToken accessToken = getAccessToken("wxd9ccc742b1c39110", "b71a520aa6274b2a53916eb2b68b0224");
//    	System.out.println(accessToken.toString());
//    	
//    	UserBaseInfo userBaseInfo = getUserBaseInfo(access, openId);
//    	System.out.println(userBaseInfo);
//    	
//    	
//    	
//    	
//    }
	



	public String getAppID(String doc) {
		// TODO Auto-generated method stub
		if(doc!=null){
			int index =doc.indexOf("{name:\"AppId\",value:\"")+21;
			String 	OriginalID =doc.substring(index,index+18);
			return OriginalID;
		}
		return null;
	}
	
	public String getAppSecret(String doc) {
		// TODO Auto-generated method stub
		if(doc!=null){
			int index =doc.indexOf("{name:\"AppSecret\",value:\"")+25;
			String 	OriginalID =doc.substring(index,index+32);
			return OriginalID;
		}
		return null;
	}

	public String getOriginalID(String doc) {//获取原始ID
		// TODO Auto-generated method stub
		if(doc!=null){
			int index =doc.indexOf("gh_");
			String 	OriginalID =doc.substring(index,index+15);
			return OriginalID;
		}
		return null;
	}
	public boolean isServiceNo(String doc) {//公众号类型
		// TODO Auto-generated method stub
		if(doc!=null){
			if(doc.indexOf("服务号")>0)
				return true;
		}
		return false;
	}
	public boolean isCertification(String doc) {//认证状态
		// TODO Auto-generated method stub
		if(doc!=null){
			if(doc.indexOf("未认证")==-1)
				return true;
		}
		return false;
	}
	
	
	
	public boolean customerSendMsg(String access_token,String openid,String msg){
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
			
			if("0".equals(errcode))
				return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	public AccessToken getAccessToken(String appId,String appSecret) {
		// TODO Auto-generated method stub
		
		AccessToken access_token = null;
			try {
				String jsonString = HttpUtils
						.sendGet(GET_ACCESS_TOKEN+"appid="+appId+"&secret="+appSecret,
								"UTF-8");
				
				System.out.println("jsonString="+jsonString);
				Gson gson = new Gson();
				access_token   = gson.fromJson(jsonString, AccessToken.class);
				
				return access_token;
			} catch (Exception e){
				e.printStackTrace();
			}
		return access_token;
	}
	
	
	public UserBaseInfo getUserBaseInfo(String access_token,String openid) {
		// TODO Auto-generated method stub
		
		UserBaseInfo userBaseInfo = null;
		try {
			String jsonString = HttpUtils
					.sendGet(GET_USER_BASE_INFO+"access_token="+access_token+"&openid="+openid,
							"UTF-8");
			jsonString = jsonString.replace("\\", "");
			System.out.println("jsonString="+jsonString);
			Gson gson = new Gson();
			userBaseInfo  = gson.fromJson(jsonString, UserBaseInfo.class);
			
			return userBaseInfo;
		}catch (Exception e){
			e.printStackTrace();
		}
		return userBaseInfo;
	}
	
	
	
	public  String  makeMenu(){
		
		try {
			Object[] data = new Object[2];
			
			
			data[0]= new Button_click("自助点餐","menu_01");
			data[1] = new Button_click("微官网","menu_02");
//			data[2] = new Button_click("微官网","menu_03");
			
			ByteArrayOutputStream out =new ByteArrayOutputStream();
			ObjectMapper objectMapper=new ObjectMapper();
			JsonGenerator  jsonGenerator = objectMapper.getJsonFactory().createJsonGenerator(out, JsonEncoding.UTF8);
			jsonGenerator.writeStartObject();//{
			jsonGenerator.writeObjectField("button", data);
			jsonGenerator.writeEndObject();//} 
			jsonGenerator.flush();
			jsonGenerator.close();
			String menu = out.toString("utf-8");
			System.out.println("menu="+menu);
			out.close();
			return menu;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	
	public boolean addMenu(String access_token,String param){
		try {
			String jsonString = HttpUtils.sendPostUrl(MENU+access_token, param, "utf-8");
			System.out.println("jsonString="+jsonString);
			ObjectMapper mapper = new ObjectMapper();
			JsonNode root= mapper.readTree(jsonString);
			String errcode = (root.get("errcode"))+"";
			String errmsg = (root.get("errmsg"))+"";
			System.out.println("errcode="+errcode+",errmsg="+errmsg);
			
			if("0".equals(errcode))
				return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return false;
	}
	
	
//	文本	text/plain
		//	二进制流	application/octet-stream
		//	RAR 压缩包	application/x-rar-compressed
		//	Zip 压缩包	application/zip
		//	Flash 文件	application/x-shockwave-flash
		//	QuickTime 视频	video/quicktime
		//	MP4 视频	video/mp4
		//	MP3 音频	audio/mpeg
		//	JPEG 图片	image/jpeg
		//	GIF 图片	image/gif
		//	PNG 图片	image/png
		/**
		* 上传多媒体文件到微信公众平台
		* @param fileType 文件类型
		* @param access_token //在微信平台获取到的凭证
		* @param filename 文件名称
		* @param file 文件流
		* @param content_type 文件类型 image/jpeg、audio/mpeg
		* @param filePath 文件路径
		* @return
		*/
		public String uploadmedia(String fileType,String access_token,String filename, File file,
		String content_type){
		String result = "";
		String end="\r\n";
		String twoHyphens = "--"; //用于拼接
		String boundary="*****"; //用于拼接 可自定义
		URL submit = null;
		JSONObject json=null;
			
		String requestUrl="http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token="
		+ access_token + "&type=" + fileType;
		try {
		submit = new URL(requestUrl);
		HttpURLConnection conn=(HttpURLConnection) submit.openConnection();
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setUseCaches(false);

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Connection", "Keep-Alive");
		conn.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
		
		//对文件进行传输
				FileInputStream fis=new FileInputStream(file);
				
		//获取输出流对象，准备上传文件
		DataOutputStream dos=new DataOutputStream(conn.getOutputStream());
		dos.writeBytes(twoHyphens+boundary+end);
		dos.writeBytes("Content-Disposition: form-data; name=\""+file+"\";filename=\""
		+filename+";filelength=\""+fis.available()+";Content-Type=\""+content_type+end);
		dos.writeBytes(end);
		
		byte[] buffer = new byte[8192]; // 8k
		int count = 0;
		while ((count = fis.read(buffer)) != -1)
		{
		dos.write(buffer, 0, count);
		}
		fis.close(); //关闭文件流

		dos.writeBytes(end);
		dos.writeBytes(twoHyphens + boundary + twoHyphens + end);
		dos.flush();

		InputStream is = conn.getInputStream();
		InputStreamReader isr = new InputStreamReader(is, "utf-8");
		BufferedReader br = new BufferedReader(isr);
		result = br.readLine();
		dos.close();
		is.close();

		} catch (Exception e) {
		e.printStackTrace();
		System.out.println("与服务器连接发生异常错误:" + e.toString());
		System.out.println("连接地址是:" + requestUrl);
		}
		System.out.println("result="+result);
//		json = JSONObject.parseObject(result); //获取到返回Json请自行根据返回码获取相应的结果
		return result;
	}
		public static void main(String[] args) {
			NetMsgclientSingleton msgclientSingleton  =NetMsgclientSingleton.getInstance();
			
			System.out.println(msgclientSingleton);
			
			msgclientSingleton  =NetMsgclientSingleton.getInstance();
			
			System.out.println(msgclientSingleton);
		}
}
