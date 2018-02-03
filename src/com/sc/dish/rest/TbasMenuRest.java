package com.sc.dish.rest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sc.dish.pojo.TbasMenu;
import com.sc.dish.pojo.TbasPlatinfo;
import com.sc.dish.service.MaterialService;
import com.sc.dish.service.MealTimeService;
import com.sc.dish.service.NutritionService;
import com.sc.dish.service.TbasMenuService;
import com.sc.dish.service.TbasPlatinfoService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/rest/tbasMenu")
public class TbasMenuRest extends BaseAction{
	@Autowired
	TbasMenuService tbasMenuService;
	@Autowired
	TbasPlatinfoService tbasPlatinfoService;
	@Autowired
	MaterialService materialService;
	@Autowired
	MealTimeService mealTimeService;
	@Autowired
	NutritionService nutritionService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/add-rest", method = RequestMethod.POST)
	public void add(@RequestBody String content,
			HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		ConditionVO vo = new ConditionVO();
		JSONObject jsonObject = null;
		String orgCode = null;
		Gson gson = this.createGson();
		List<TbasMenu> list = null;
		try {
			try {
				//jsonObject = JSONObject.fromObject(StringUtil.replaceBlank(content));
				list = gson.fromJson(content, new TypeToken<List<TbasMenu>>(){}.getType()); 
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception("JSON格式或解码错误");
			}

			if(list==null){
				throw new Exception("上传数据不为空");
			}
			
			for(TbasMenu tbasMenu : list){
				tbasMenuService.saveOrUpdateTbasMenuInfo(tbasMenu);
			}
			
			map.put("message", "成功");
			map.put("success", "true");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
			map.put("success", "false");
		} finally{
			jsonObject = null;
			orgCode = null;
			vo = null;
		}

		response.setStatus(200);
		renderJson(map,response);
	}
	
	@RequestMapping(value = "/get-rest", method = RequestMethod.GET)
	//@ResponseBody
	public void get(@RequestBody String content,
			HttpServletRequest request,HttpServletResponse response) {
		List<TbasMenu> list = null;
		String platNo = null;
		Map<String, Object> map = new HashMap<String, Object>();
		ConditionVO vo = new ConditionVO();
		try {
			platNo = request.getHeader("platNo"); 
			if(platNo==null||"".equals(platNo)){
				throw new Exception("餐台号不能为空");
			}
			// 根据餐台号查找org_code
			TbasPlatinfo tbasPlatinfo = tbasPlatinfoService.getByNo(platNo);
			if(tbasPlatinfo==null){
				throw new Exception("餐台号不正确");
			}
			
			list = tbasMenuService.queryTbasMenusByOrgCode(tbasPlatinfo.getOrgCode());
			
			// 
			for(TbasMenu tbasMenu : list){
				tbasMenu.setMaterial(materialService.queryByDishSn(tbasMenu.getSn()));
				tbasMenu.setMealTime(mealTimeService.queryByDishSn(tbasMenu.getSn()));
				tbasMenu.setNutrition(nutritionService.queryByDishSn(tbasMenu.getSn()));
			}
			
			map.put("success", "true"); 
			map.put("list", list); 
		} catch (Exception e) {
			e.printStackTrace();
			map.put("message", e.getMessage()); 
			map.put("success", "false"); 
			//return map;
		}finally{
			vo = null;
			platNo = null;
		}
		//return list;
		response.setStatus(200);
		renderJson(map,response);
	}
}
