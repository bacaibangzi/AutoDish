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

import com.sc.dish.pojo.MenuCook;
import com.sc.dish.service.MenuCookService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Controller
@RequestMapping("/menuCook")
public class MenuCookAction extends BaseAction {
	@Autowired
	MenuCookService menuCookService;

	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "dish/menuCookMain";
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
			@ModelAttribute Page<MenuCook> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<MenuCook> list = menuCookService.queryMenuCooksForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * MenuCook编辑页面queryMenuCooksPublishForPage
	 * @param vo
	 * @param MenuCook
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") MenuCook MenuCook,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(menuCookService.getMenuCookById(vo),MenuCook);
		} 
		return "dish/menuCookEidt";
	}
	
	/**
	 * MenuCook详细信息页面
	 * @param vo
	 * @param MenuCook
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") MenuCook MenuCook,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(menuCookService.getMenuCookById(vo),MenuCook);
		return "dish/menuCookDetail";
	}
	
	/**
	 * 保存MenuCook信息
	 * @param vo
	 * @param MenuCook
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute MenuCook MenuCook,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		
		menuCookService.saveOrUpdateMenuCookInfo(MenuCook);
		return "dish/menuCookMain";
	}
	
	/**
	 * 删除MenuCook信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		menuCookService.deleteMenuCookById(vo);
		return "dish/menuCookMain";
	}

}
