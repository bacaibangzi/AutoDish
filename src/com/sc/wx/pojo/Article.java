package com.sc.wx.pojo;
/**
 * 微信图文回复用类
 * @author Administrator
 *
 */
public class Article {
private String Title;
private String Description;
private String PicUrl;
private String Url;
public String getTitle() {
	return Title;
}
public void setTitle(String title) {
	Title = title;
}
public String getDescription() {
	return Description;
}
public void setDescription(String description) {
	Description = description;
}
public String getPicUrl() {
	return PicUrl;
}
public void setPicUrl(String picUrl) {
	PicUrl = picUrl;
}
public String getUrl() {
	return Url;
}
public void setUrl(String url) {
	Url = url;
}
public Article() {
	super();
	// TODO Auto-generated constructor stub
}
public Article(String title, String description, String picUrl, String url) {
	super();
	Title = title;
	Description = description;
	PicUrl = picUrl;
	Url = url;
}


}
