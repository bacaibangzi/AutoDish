package com.sc.dish.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.dish.pojo.Nutrition;
import com.sc.dish.service.NutritionService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Controller
@RequestMapping("/nutrition")
public class NutritionAction extends BaseAction {
	@Autowired
	NutritionService nutritionService;

	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "dish/nutritionMain";
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
			@ModelAttribute Page<Nutrition> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<Nutrition> list = nutritionService.queryNutritionsForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * Nutrition编辑页面queryNutritionsPublishForPage
	 * @param vo
	 * @param Nutrition
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Nutrition Nutrition,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(nutritionService.getNutritionById(vo),Nutrition);
		} 
		return "dish/nutritionEidt";
	}
	
	/**
	 * Nutrition详细信息页面
	 * @param vo
	 * @param Nutrition
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Nutrition Nutrition,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(nutritionService.getNutritionById(vo),Nutrition);
		return "dish/nutritionDetail";
	}
	
	/**
	 * 保存Nutrition信息
	 * @param vo
	 * @param Nutrition
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Nutrition Nutrition,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		try{
		nutritionService.saveOrUpdateNutritionInfo(Nutrition);
		}catch(Exception err){
			err.printStackTrace();
			if( err instanceof DuplicateKeyException){
				vo.setErrMsg("编码重复");
				return "dish/nutritionEidt";
			}
		}
		return "dish/nutritionMain";
	}
	
	/**
	 * 删除Nutrition信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		nutritionService.deleteNutritionById(vo);
		return "dish/nutritionMain";
	}

}
