package com.sc.dish.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.dish.pojo.Cook;
import com.sc.dish.pojo.FoodType;
import com.sc.dish.pojo.Pot;
import com.sc.dish.pojo.TbasMenu;
import com.sc.dish.pojo.WeightUnit;
import com.sc.dish.service.CookService;
import com.sc.dish.service.FoodTypeService;
import com.sc.dish.service.PotService;
import com.sc.dish.service.TbasMenuService;
import com.sc.dish.service.WeightUnitService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Controller
@RequestMapping("/tbasMenu")
public class TbasMenuAction extends BaseAction {
	@Autowired
	TbasMenuService tbasMenuService;
	@Autowired
	WeightUnitService weightUnitService;
	@Autowired
	FoodTypeService foodTypeService;
	@Autowired
	CookService cookService;
	@Autowired
	PotService potService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	/**
	 * 根据code查找菜品类型
	 * @param code
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/ajaxFoodType.htm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> ajaxFoodType(@RequestParam String code,HttpServletRequest request){
		Map<String,String> foodTypeMap = new HashMap<String,String>();
		try {
			List<FoodType> list = foodTypeService.queryFoodTypesByCant(code);
			for(FoodType foodType : list){
				foodTypeMap.put(foodType.getTypeId(), foodType.getTypeName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return foodTypeMap;
	}
	
	/**
	 * 根据code查找菜品单位
	 * @param code
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/ajaxWeightUnit.htm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> ajaxWeightUnit(@RequestParam String code,HttpServletRequest request){
		Map<String,String> weightUnitMap = new HashMap<String,String>();
		try {
			List<WeightUnit> list = weightUnitService.queryWeightUnitsByCant(code);
			for(WeightUnit weightUnit : list){
				weightUnitMap.put(weightUnit.getUnitId(), weightUnit.getUnitName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return weightUnitMap;
	}
	
	
	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "dish/tbasMenuMain";
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
			@ModelAttribute Page<TbasMenu> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<TbasMenu> list = tbasMenuService.queryTbasMenusForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * TbasMenu编辑页面queryTbasMenusPublishForPage
	 * @param vo
	 * @param TbasMenu
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") TbasMenu TbasMenu,HttpServletRequest request) throws Exception{
		Map<String,String> useFlagMap = new HashMap<String,String>();
		useFlagMap.put("0", "不启用");
		useFlagMap.put("1", "启用");

		if(vo.getEntityId()!=null){
			TbasMenu tm = tbasMenuService.getTbasMenuById(vo);
			/*
			Map<String,String> foodTypeMap = new HashMap<String,String>();
			try {
				List<FoodType> list = foodTypeService.queryFoodTypesByCant(tm.getPlatNo());
				for(FoodType foodType : list){
					foodTypeMap.put(foodType.getTypeId(), foodType.getTypeName());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Map<String,String> weightUnitMap = new HashMap<String,String>();
			try {
				List<WeightUnit> list = weightUnitService.queryWeightUnitsByCant(tm.getPlatNo());
				for(WeightUnit weightUnit : list){
					weightUnitMap.put(weightUnit.getUnitId(), weightUnit.getUnitName());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}*/
			
			request.setAttribute("vo", vo);
			BeanUtils.copyProperties(tm,TbasMenu);
		} 
		Map<String,String> foodTypeMap = new HashMap<String,String>();
		Map<String,String> weightUnitMap = new HashMap<String,String>();
		Map<String,String> cookMap = new HashMap<String,String>();
		Map<String,String> potMap = new HashMap<String,String>();
		
		List<FoodType> foodTypeList = foodTypeService.queryFoodTypesByOrgCode(vo.getOrgCode());
		for(FoodType foodType : foodTypeList){
			foodTypeMap.put(foodType.getTypeId(), foodType.getTypeName());
		} 
		
		List<WeightUnit> weightUnitList = weightUnitService.queryWeightUnitsByOrgCode(vo.getOrgCode());
		for(WeightUnit weightUnit : weightUnitList){
			weightUnitMap.put(weightUnit.getUnitId(), weightUnit.getUnitName());
		}
		
		List<Cook> cookList = cookService.queryCooksByOrgCode(vo.getOrgCode());
		for(Cook cook : cookList){
			cookMap.put(cook.getNo(), cook.getName());
		}
		
		List<Pot> potList = potService.queryPotsByOrgCode(vo.getOrgCode());
		for(Pot pot : potList){
			potMap.put(pot.getNo(), pot.getName());
		}

		request.setAttribute("foodTypeMap", foodTypeMap);
		request.setAttribute("weightUnitMap", weightUnitMap);
		request.setAttribute("cookMap", cookMap);
		request.setAttribute("potMap", potMap);
		
		request.setAttribute("useFlagMap", useFlagMap);
		
		return "dish/tbasMenuEidt";
	}
	
	/**
	 * TbasMenu详细信息页面
	 * @param vo
	 * @param TbasMenu
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") TbasMenu TbasMenu,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(tbasMenuService.getTbasMenuById(vo),TbasMenu);
		return "dish/tbasMenuDetail";
	}
	
	/**
	 * 保存TbasMenu信息
	 * @param vo
	 * @param TbasMenu
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute("form") TbasMenu tbasMenu,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		
		Map<String,String> useFlagMap = new HashMap<String,String>();
		useFlagMap.put("0", "不启用");
		useFlagMap.put("1", "启用");
		request.setAttribute("useFlagMap", useFlagMap);
		
		
		Map<String,String> foodTypeMap = new HashMap<String,String>();
		try {
			List<FoodType> list = foodTypeService.queryFoodTypesByCant(tbasMenu.getPlatNo());
			for(FoodType foodType : list){
				foodTypeMap.put(foodType.getTypeId(), foodType.getTypeName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String,String> weightUnitMap = new HashMap<String,String>();
		try {
			List<WeightUnit> list = weightUnitService.queryWeightUnitsByCant(tbasMenu.getPlatNo());
			for(WeightUnit weightUnit : list){
				weightUnitMap.put(weightUnit.getUnitId(), weightUnit.getUnitName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("foodTypeMap", foodTypeMap);
		request.setAttribute("weightUnitMap", weightUnitMap);
		
		
		try{
			tbasMenuService.saveOrUpdateTbasMenuInfo(tbasMenu);
		}catch(Exception err){
			err.printStackTrace();
			if( err instanceof DuplicateKeyException){
				vo.setErrMsg("编码重复");
				return "dish/tbasMenuEidt";
			}
		}
		return "dish/tbasMenuMain";
	}
	
	/**
	 * 删除TbasMenu信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		tbasMenuService.deleteTbasMenuById(vo);
		return "dish/tbasMenuMain";
	}

}
