package com.sc.dish.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sc.dish.pojo.FoodType;
import com.sc.dish.pojo.WeightUnit;
import com.sc.dish.service.WeightUnitService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.utils.StringUtil;
import com.sc.framework.vo.ConditionVO;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/rest/weightUnit")
public class WeightUnitRest extends BaseAction{
	@Autowired
	WeightUnitService weightUnitService;

	@RequestMapping(value = "/add-rest", method = RequestMethod.POST)
	public void add(@RequestBody String content,
			HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		ConditionVO vo = new ConditionVO();
		JSONObject jsonObject = null;
		String orgCode = null;
		Gson gson = this.createGson();
		List<WeightUnit> list = null;
		try {
			try {
				//jsonObject = JSONObject.fromObject(StringUtil.replaceBlank(content));
				list = gson.fromJson(StringUtil.replaceBlank(content), new TypeToken<List<WeightUnit>>(){}.getType()); 
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception("JSON格式或解码错误");
			}
			
			for(WeightUnit wightUnit : list){
				weightUnitService.saveOrUpdateWeightUnitInfo(wightUnit);
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
		List<WeightUnit> list = null;
		String platNo = null;
		Map<String, Object> map = new HashMap<String, Object>();
		ConditionVO vo = new ConditionVO();
		try {
			platNo = request.getHeader("platNo"); 
			list = weightUnitService.queryWeightUnitsByCant(platNo);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("message", e.getMessage()); 
			renderJson(map,response);
			//return map;
		}finally{
			vo = null;
			platNo = null;
		}
		//return list;
		response.setStatus(200);
		renderJson(list,response);
	}
}
