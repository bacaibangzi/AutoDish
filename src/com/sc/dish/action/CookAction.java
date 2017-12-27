package com.sc.dish.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.dish.pojo.Cook;
import com.sc.dish.service.CookService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Controller
@RequestMapping("/cook")
public class CookAction extends BaseAction {
	@Autowired
	CookService cookService;

	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "dish/cookMain";
	}

	/**
	 * 加载产品服务信息
	 * @param vo
	 * @param page
	 * @param response
	 */
	@RequestMapping(value = "/list.htm", method = RequestMethod.POST)
	@ResponseBody
	public void list(@ModelAttribute ConditionVO vo,
			@ModelAttribute Page<Cook> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<Cook> list = cookService.queryCooksForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * Cook编辑页面queryCooksPublishForPage
	 * @param vo
	 * @param Cook
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Cook Cook,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(cookService.getCookById(vo),Cook);
		} 
		return "dish/CookEidt";
	}
	
	/**
	 * Cook详细信息页面
	 * @param vo
	 * @param Cook
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Cook Cook,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(cookService.getCookById(vo),Cook);
		return "dish/CookDetail";
	}
	
	/**
	 * 保存Cook信息
	 * @param vo
	 * @param Cook
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute Cook Cook,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		
		cookService.saveOrUpdateCookInfo(Cook);
		return "dish/CookMain";
	}
	
	/**
	 * 删除Cook信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		cookService.deleteCookById(vo);
		return "dish/CookMain";
	}

}