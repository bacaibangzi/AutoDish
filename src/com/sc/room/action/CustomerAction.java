package com.sc.room.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;
import com.sc.room.pojo.Customer;
import com.sc.room.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerAction  extends BaseAction{
	@Autowired
	CustomerService customerService;

	/**
	 * 类型页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "room/customerMain";
	}

	/**
	 * 加载类型信息
	 * @param vo
	 * @param page
	 * @param response
	 */
	@RequestMapping(value = "/list.htm", method = RequestMethod.POST)
	@ResponseBody
	public void list(@ModelAttribute ConditionVO vo,
			@ModelAttribute Page<Customer> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<Customer> list = customerService.queryCustomersForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * Customer编辑页面queryCustomersPublishForPage
	 * @param vo
	 * @param Customer
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Customer Customer,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(customerService.getCustomerById(vo),Customer);
		}else{ 
		}
		return "room/customerEidt";
	}
	
	/**
	 * Customer详细信息页面
	 * @param vo
	 * @param Customer
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Customer Customer,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(customerService.getCustomerById(vo),Customer);
		return "room/customerDetail";
	}
	
	/**
	 * 保存Customer信息
	 * @param vo
	 * @param Customer
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute Customer Customer,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo); 
		customerService.saveOrUpdateCustomerInfo(Customer);
		return "room/customerMain";
	}
	
	/**
	 * 删除Customer信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		customerService.deleteCustomerById(vo);
		return "true";
	}

}
