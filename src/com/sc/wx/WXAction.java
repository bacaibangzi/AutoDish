package com.sc.wx;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.framework.utils.StringUtil;
import com.sc.framework.vo.ConditionVO;
import com.sc.room.pojo.Customer;
import com.sc.room.service.CustomerService;
import com.sc.util.SmsUtil;
import com.sc.wx.utils.WeiXinUtil;
import com.sc.wxutil.Demo_UclbrtHttpClient;
import com.sc.wxutil.RSATest;

@Controller
@RequestMapping("/wx")
public class WXAction {
	public static String appid = "wxd74c43a48ccfb9f8";
	public static String appSecret = "3199c86b7a61212cb9f5da36d26ea765";
	@Autowired
	CustomerService customerService;
	/**
	 * toIndex
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="index-weixin", method=RequestMethod.GET)
	public String toIndex(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String hotel = request.getParameter("hotel");
		hotel = hotel==null||"".equals(hotel)?"hotel":hotel;
		System.out.println("===================>"+hotel);
		request.setAttribute("hotel", hotel);
		return "wx/index";
	}
	
	/**
	 * myCenter
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="myCenter-weixin", method=RequestMethod.GET)
	public String myCenter(@ModelAttribute ConditionVO vo,HttpServletRequest request,HttpServletResponse response)throws Exception{

		String code = request.getParameter("code");
		String openid = WeiXinUtil.getOpenID(appid,appSecret,code);
		
		if(openid==null||"".equals(openid)){
			//openid = "000001";
			openid = (String)request.getSession().getAttribute("openid");
		}
		if(openid==null||"".equals(openid)){
			openid = "000001";
		}
		
		System.out.println("------------------> openid:"+openid);
		vo.setOpenid(openid);
		
		request.getSession().setAttribute("openid", openid);
		
		Customer customer = customerService.getByOpenid(openid);
		if(customer==null){
			customer = new Customer();
			customer.setState("-1");
		}
		
		request.setAttribute("vo", vo);
		request.setAttribute("customer", customer);
		
		return "wx/myCenter";
	}
	
	/**
	 * myOrder
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="myOrder-weixin", method=RequestMethod.GET)
	public String myOrder(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		return "wx/myOrder";
	}
	
	/**
	 * reserve
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="reserve-weixin", method=RequestMethod.GET)
	public String reserve(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		return "wx/reserve";
	}
	
	Map<String,String> phoneSms = new HashMap<String,String>();
	@RequestMapping(value="sendSms-weixin", method=RequestMethod.POST)
	@ResponseBody
	public String sendSms(@RequestParam String telephone,HttpServletRequest request,HttpServletResponse response)throws Exception{
		String code = StringUtil.randomString(4);
		SmsUtil.sendMessage(telephone, "57784", "#code#="+code);
		phoneSms.put(telephone, code);
		return "true";
	}
	
	
	@RequestMapping(value="getSn-weixin", method=RequestMethod.POST)
	@ResponseBody
	public String getSn(@ModelAttribute ConditionVO vo,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Customer customer = customerService.getCustomerById(vo);
		if(customer!=null){
			return customer.getState();
		}
		else{
			return "0";
		}
		
	}
	
	@RequestMapping(value="save-weixin", method=RequestMethod.POST)
	@ResponseBody
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute Customer customer,HttpServletRequest request,HttpServletResponse response)throws Exception{
		if(!vo.getCode().equals(phoneSms.get(customer.getTel()))){
			return "yzm";
		}
		
		if(customerService.queryCustomersBySfz(customer.getSfz()).size()>0){
			return "sfz";
		}
		if(customerService.queryCustomersByTel(customer.getTel()).size()>0){
			return "tel";
		}
		
		
		customer.setSex("男");
		customer.setState("0");
		customer.setOpenid(vo.getOpenid());
		customerService.saveOrUpdateCustomerInfo(customer);
		return "true";
	}
	
	
	@RequestMapping(value="rqCode-weixin",method=RequestMethod.GET)
	public String qrCode(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String protocol = "https";
		String ip = "api.uclbrt.com";
		String port = "8058";
		//如下参数格式要求，请参看文档说明，具体数据，参看文档查询。
		String communityNo = "1316880093"; //集群编号
		String buildNo =  "001"; //楼栋编号(楼栋号、楼层号必选同为必选或必不选)
		String floorNo = "001"; //楼层编号(楼栋号、楼层号必选同为必选或必不选)
		String roomNo = "114"; //房间编号(注：如果楼栋编号、楼层编号参数未传入,请确保集群下的房间号唯一)
		String accSid = "3ab13cc579b2a13236218c7c50352b3f";//账户Id.有32个英文字母和阿拉伯数字组成的主账户唯一标识符
		String token = "a2dfdd31b71224c55996043d49b89c";
		String mobile = "18100615126";
		String begTime ="1711112130";
		String endTime ="1711112135";	
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
		
		String joStr= Demo_UclbrtHttpClient.getInfoJSON(protocol, ip, port, communityNo, buildNo, floorNo, roomNo, accSid, token,areaCode,mobile,begTime,endTime);
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
		String redirectUrl = RSATest.encryTest1(communityNo,areaCode,mobile, accSid, token,roomID);
		
		return "redirect:"+redirectUrl;
	}
}
