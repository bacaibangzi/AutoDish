package com.sc.dish.dao;

import java.util.List;
import java.util.Map;

import com.sc.dish.pojo.MenuNutrition;
import com.sc.dish.pojo.Nutrition;
import com.sc.framework.base.dao.BaseDao;

public interface NutritionMapper extends BaseDao<Nutrition>{

	public List<Nutrition> queryByDishSn(Map<String, Object> conditionMap)
			throws Exception;	
}
