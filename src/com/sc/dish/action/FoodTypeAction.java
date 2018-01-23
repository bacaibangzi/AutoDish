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

import com.sc.dish.pojo.FoodType;
import com.sc.dish.pojo.TbasPlatinfo;
import com.sc.dish.service.FoodTypeService;
import com.sc.dish.service.TbasPlatinfoService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Controller
@RequestMapping("/foodType")
public class FoodTypeAction extends BaseAction {
	@Autowired
	FoodTypeService foodTypeService;
	@Autowired
	TbasPlatinfoService tbasPlatinfoService;

	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "dish/foodTypeMain";
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
			@ModelAttribute Page<FoodType> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<FoodType> list = foodTypeService.queryFoodTypesForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * FoodType编辑页面queryFoodTypesPublishForPage
	 * @param vo
	 * @param FoodType
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") FoodType FoodType,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){

			FoodType ft = foodTypeService.getFoodTypeById(vo);
			/*
			TbasPlatinfo tbasPlatinfo = tbasPlatinfoService.getByNoOrgCode(ft.getPlatNo(), ft.getOrgCode());		
			request.setAttribute("name", tbasPlatinfo.getPlatName());
			*/
			
			BeanUtils.copyProperties(ft,FoodType);
		}
		return "dish/foodTypeEidt";
	}
	
	/**
	 * FoodType详细信息页面
	 * @param vo
	 * @param FoodType
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") FoodType FoodType,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(foodTypeService.getFoodTypeById(vo),FoodType);
		return "dish/foodTypeDetail";
	}
	
	/**
	 * 保存FoodType信息
	 * @param vo
	 * @param FoodType
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute("form") FoodType FoodType,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		try{
			foodTypeService.saveOrUpdateFoodTypeInfo(FoodType);
		}catch(Exception err){
			err.printStackTrace();
			if( err instanceof DuplicateKeyException){
				vo.setErrMsg("编码重复");
				return "dish/foodTypeEidt";
			}
		}
		return "dish/foodTypeMain";
	}
	
	/**
	 * 删除FoodType信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		foodTypeService.deleteFoodTypeById(vo);
		return "dish/foodTypeMain";
	}

}
