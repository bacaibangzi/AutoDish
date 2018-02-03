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

import com.sc.dish.pojo.MenuNutrition;
import com.sc.dish.service.MenuNutritionService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Controller
@RequestMapping("/menuNutrition")
public class MenuNutritionAction extends BaseAction {
	@Autowired
	MenuNutritionService menuNutritionService;

	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain(@ModelAttribute ConditionVO vo,HttpServletRequest request) {
		request.setAttribute("vo", vo);
		return "dish/menuNutritionMain";
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
			@ModelAttribute Page<MenuNutrition> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<MenuNutrition> list = menuNutritionService.queryMenuNutritionsForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * MenuNutrition编辑页面queryMenuNutritionsPublishForPage
	 * @param vo
	 * @param MenuNutrition
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") MenuNutrition MenuNutrition,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(menuNutritionService.getMenuNutritionById(vo),MenuNutrition);
		} 
		return "dish/menuNutritionEidt";
	}
	
	/**
	 * MenuNutrition详细信息页面
	 * @param vo
	 * @param MenuNutrition
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") MenuNutrition MenuNutrition,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(menuNutritionService.getMenuNutritionById(vo),MenuNutrition);
		return "dish/menuNutritionDetail";
	}
	
	/**
	 * 保存MenuNutrition信息
	 * @param vo
	 * @param MenuNutrition
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	@ResponseBody
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute MenuNutrition MenuNutrition,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		
		menuNutritionService.save(vo);
		//return "dish/menuNutritionMain";
		return "true";
	}
	
	/**
	 * 删除MenuNutrition信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		menuNutritionService.deleteMenuNutritionById(vo);
		return "dish/menuNutritionMain";
	}

}
