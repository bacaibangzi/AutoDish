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

import com.sc.dish.pojo.WeightUnit;
import com.sc.dish.service.WeightUnitService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Controller
@RequestMapping("/weightUnit")
public class WeightUnitAction extends BaseAction {
	@Autowired
	WeightUnitService weightUnitService;

	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "dish/weightUnitMain";
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
			@ModelAttribute Page<WeightUnit> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<WeightUnit> list = weightUnitService.queryWeightUnitsForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * WeightUnit编辑页面queryWeightUnitsPublishForPage
	 * @param vo
	 * @param WeightUnit
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") WeightUnit WeightUnit,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(weightUnitService.getWeightUnitById(vo),WeightUnit);
		} 
		return "dish/weightUnitEidt";
	}
	
	/**
	 * WeightUnit详细信息页面
	 * @param vo
	 * @param WeightUnit
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") WeightUnit WeightUnit,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(weightUnitService.getWeightUnitById(vo),WeightUnit);
		return "dish/weightUnitDetail";
	}
	
	/**
	 * 保存WeightUnit信息
	 * @param vo
	 * @param WeightUnit
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute WeightUnit WeightUnit,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		
		weightUnitService.saveOrUpdateWeightUnitInfo(WeightUnit);
		return "dish/weightUnitMain";
	}
	
	/**
	 * 删除WeightUnit信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		weightUnitService.deleteWeightUnitById(vo);
		return "dish/weightUnitMain";
	}

}
