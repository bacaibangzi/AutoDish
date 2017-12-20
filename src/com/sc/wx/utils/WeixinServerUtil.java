package com.sc.wx.utils;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.sc.wx.resp.Article;

/**
 * 微信图文消息用工具类
 * @author Administrator
 *
 */
public class WeixinServerUtil {

	
	//创建文本xml
	public static String createText(String ToUserNameStr,String FromUserNameStr,String text){
        String xmlStr = null;
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.newDocument();

            Element xml = document.createElement("xml");
            document.appendChild(xml);

            Element ToUserName = document.createElement("ToUserName");
            ToUserName.appendChild(document.createCDATASection(ToUserNameStr));
            xml.appendChild(ToUserName);
            Element FromUserName = document.createElement("FromUserName");
            FromUserName.appendChild(document.createCDATASection(FromUserNameStr));
            xml.appendChild(FromUserName);
            Element CreateTime = document.createElement("CreateTime");
            CreateTime.setTextContent((System.currentTimeMillis()/1000)+"");
            xml.appendChild(CreateTime);
            Element MsgType = document.createElement("MsgType");
            MsgType.appendChild(document.createCDATASection("text"));
            xml.appendChild(MsgType);
            Element Content = document.createElement("Content");
            Content.appendChild(document.createCDATASection(text));
            xml.appendChild(Content);
            

            TransformerFactory transFactory = TransformerFactory.newInstance();
            Transformer transFormer = transFactory.newTransformer();
            DOMSource domSource = new DOMSource(document);

            //export string
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            transFormer.transform(domSource, new StreamResult(bos));
            xmlStr = bos.toString("utf-8");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return xmlStr;
    }
	
	//创建图文类型xml
	public static String createNews(String ToUserNameStr,String FromUserNameStr,List<Article> datas){
        String xmlStr = null;
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.newDocument();

            Element xml = document.createElement("xml");
            document.appendChild(xml);

            Element ToUserName = document.createElement("ToUserName");
            ToUserName.appendChild(document.createCDATASection(ToUserNameStr));
            xml.appendChild(ToUserName);
            Element FromUserName = document.createElement("FromUserName");
            FromUserName.appendChild(document.createCDATASection(FromUserNameStr));
            xml.appendChild(FromUserName);
            Element CreateTime = document.createElement("CreateTime");
            CreateTime.setTextContent((System.currentTimeMillis()/1000)+"");
            xml.appendChild(CreateTime);
            Element MsgType = document.createElement("MsgType");
            MsgType.appendChild(document.createCDATASection("news"));
            xml.appendChild(MsgType);
            Element ArticleCount = document.createElement("ArticleCount");
            ArticleCount.setTextContent(datas.size()+"");
            xml.appendChild(ArticleCount);
            
            
            Element Articles = document.createElement("Articles");
            
            for(Article article : datas){
            	Element item = document.createElement("item");
            	
            	Element Title = document.createElement("Title");
            	Title.appendChild(document.createCDATASection(article.getTitle()));
            	item.appendChild(Title);
            	Element Description = document.createElement("Description");
            	Description.appendChild(document.createCDATASection(article.getDescription()));
            	item.appendChild(Description);
            	Element PicUrl = document.createElement("PicUrl");
            	PicUrl.appendChild(document.createCDATASection(article.getPicUrl()));
            	item.appendChild(PicUrl);
            	Element Url = document.createElement("Url");
            	Url.appendChild(document.createCDATASection(article.getUrl()));
            	item.appendChild(Url);
            	
                Articles.appendChild(item);
            }
            
            xml.appendChild(Articles);
            

            TransformerFactory transFactory = TransformerFactory.newInstance();
            Transformer transFormer = transFactory.newTransformer();
            DOMSource domSource = new DOMSource(document);

            //export string
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            transFormer.transform(domSource, new StreamResult(bos));
            xmlStr = bos.toString("utf-8");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return xmlStr;
    }
	
	
public static HashMap<String, String> parseXml (InputStream inStream){
		
		HashMap<String, String> hashMap = new HashMap<String, String>();
		try {
			
			
			System.out.println("available="+inStream.available());
			if(inStream.available()==0)
				return hashMap;
			
			
			
			
			//创建DocumentBuilderFactory，该对象将创建DocumentBuilder。
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			//创建DocumentBuilder，DocumentBuilder将实际进行解析以创建Document对象
			DocumentBuilder builder = factory.newDocumentBuilder();
			//解析该文件以创建Document对象
			Document document = builder.parse(inStream);
			//获取XML文件根节点 
			Element root = document.getDocumentElement();
			//获得所有子节点
			NodeList childNodes = root.getChildNodes();
			for(int i = 0; i < childNodes.getLength(); i++) {
				Node childNode = (Node) childNodes.item(i);
				if(childNode.getNodeType() == Node.ELEMENT_NODE) {
					Element childElement = (Element) childNode;
					if("ToUserName".equals(childElement.getNodeName())) {
						hashMap.put("ToUserName", childElement.getFirstChild().getNodeValue());
					} else if("FromUserName".equals(childElement.getNodeName())) {
						hashMap.put("FromUserName", childElement.getFirstChild().getNodeValue());
					} else if("CreateTime".equals(childElement.getNodeName())) {
						hashMap.put("CreateTime", childElement.getFirstChild().getNodeValue());
					}else if("MsgType".equals(childElement.getNodeName())) {
						hashMap.put("MsgType", childElement.getFirstChild().getNodeValue());
					}else if("Event".equals(childElement.getNodeName())) {
						hashMap.put("Event", childElement.getFirstChild().getNodeValue());
					}else if("EventKey".equals(childElement.getNodeName())) {
						hashMap.put("EventKey", childElement.getFirstChild().getNodeValue());
					}else if("Content".equals(childElement.getNodeName())) {
						hashMap.put("Content", childElement.getFirstChild().getNodeValue());
					}else if("MsgId".equals(childElement.getNodeName())) {
						hashMap.put("MsgId", childElement.getFirstChild().getNodeValue());
					}else if("PicUrl".equals(childElement.getNodeName())) {
						hashMap.put("PicUrl", childElement.getFirstChild().getNodeValue());
					}else if("MediaId".equals(childElement.getNodeName())) {
						hashMap.put("MediaId", childElement.getFirstChild().getNodeValue());
					}
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return hashMap;
	}
}



