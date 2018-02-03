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

import com.sc.dish.pojo.MenuMeal;
import com.sc.dish.service.MenuMealService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Controller
@RequestMapping("/menuMeal")
public class MenuMealAction extends BaseAction {
	@Autowired
	MenuMealService menuMealService;

	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain(@ModelAttribute ConditionVO vo,HttpServletRequest request) {
		request.setAttribute("vo", vo);
		return "dish/menuMealMain";
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
			@ModelAttribute Page<MenuMeal> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<MenuMeal> list = menuMealService.queryMenuMealsForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * MenuMeal编辑页面queryMenuMealsPublishForPage
	 * @param vo
	 * @param MenuMeal
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") MenuMeal MenuMeal,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(menuMealService.getMenuMealById(vo),MenuMeal);
		} 
		return "dish/menuMealEidt";
	}
	
	/**
	 * MenuMeal详细信息页面
	 * @param vo
	 * @param MenuMeal
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") MenuMeal MenuMeal,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(menuMealService.getMenuMealById(vo),MenuMeal);
		return "dish/menuMealDetail";
	}
	
	/**
	 * 保存MenuMeal信息
	 * @param vo
	 * @param MenuMeal
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	@ResponseBody
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute MenuMeal MenuMeal,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		
		menuMealService.save(vo);
		//return "dish/menuMealMain";
		return "true";
	}
	
	/**
	 * 删除MenuMeal信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		menuMealService.deleteMenuMealById(vo);
		return "dish/menuMealMain";
	}

}
