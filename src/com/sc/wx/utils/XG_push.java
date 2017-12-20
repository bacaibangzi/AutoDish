package com.sc.wx.utils;

import org.json.JSONException;
import org.json.JSONObject;

import com.tencent.xinge.Message;
import com.tencent.xinge.XingeApp;

public class XG_push {

	private static final int accessId=2100045621;
	private static final String secretkey="6f9b0ae86cf172c0a45974f00d1136f6";
	
	//下发单个账号
	public static boolean pushSingleAccount(String content,String account) throws JSONException {

		XingeApp xinge = new XingeApp(accessId, secretkey);	
		Message message = new Message();
		message.setTitle("title");
		message.setContent(content);
		message.setExpireTime(72*3600);
		message.setType(Message.TYPE_MESSAGE);
		JSONObject ret = xinge.pushSingleAccount(XingeApp.DEVICE_ALL, account, message);
		
		
		if(ret.get("ret_code").toString().equals("0"))
			return true;
		else
			return false;
	}
	
}
