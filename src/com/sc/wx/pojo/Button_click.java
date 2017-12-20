package com.sc.wx.pojo;
/**
 * 微信接口(WX)打开开发模式用类
 * @author pan
 *
 */
public class Button_click {
private String type="click";
private String name;
private String key;


public Button_click( String name, String key) {
	super();
	this.name = name;
	this.key = key;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getKey() {
	return key;
}
public void setKey(String key) {
	this.key = key;
}


}
