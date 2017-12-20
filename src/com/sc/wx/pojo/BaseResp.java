package com.sc.wx.pojo;
/**
 * 微信接口(WX)打开开发模式用类
 * @author pan
 *
 */
public class BaseResp {
	public String ret ="0";
    public String err_msg ;
	public String getRet() {
		return ret;
	}
	public void setRet(String ret) {
		this.ret = ret;
	}
	public String getErr_msg() {
		return err_msg;
	}
	public void setErr_msg(String err_msg) {
		this.err_msg = err_msg;
	}
    
    
}
