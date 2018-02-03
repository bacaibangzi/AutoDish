package com.sc.dish.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.dish.dao.MealTimeMapper;
import com.sc.dish.dao.MenuMealMapper;
import com.sc.dish.pojo.MealTime;
import com.sc.dish.pojo.MenuMaterial;
import com.sc.dish.pojo.MenuMeal;
import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Service
public class MenuMealService extends BaseService<MenuMeal>{
	@Autowired
	MenuMealMapper menuMealMapper;
	@Autowired
	MealTimeMapper mealTimeMapper;

	/**
	 * 删除APP
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteMenuMealById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				menuMealMapper.delete(conditionMap);
			}
		} catch (Exception err) {
			err.printStackTrace();
		}
		return true;
	}
	 


	public void save(ConditionVO vo)throws Exception{
		for (String id : vo.getEntityIds().split(",")) {
			MealTime Meal = mealTimeMapper.getById(Long.parseLong(id));
			
			MenuMeal menuMeal = new MenuMeal();
			menuMeal.setDishSn(vo.getEntityId());
			menuMeal.setMealSn(id);
			menuMeal.setP1(Meal.getName());
			
			menuMealMapper.insert(menuMeal);
		}
	}
	
	/**
	 * 根据Id得到APP信息
	 * 
	 * @param vo
	 * @return
	 */
	public MenuMeal getMenuMealById(ConditionVO vo) throws Exception {
		return menuMealMapper.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增APP
	 * 
	 * @param entity
	 */
	public void saveOrUpdateMenuMealInfo(MenuMeal entity) throws Exception {
		if (entity.getSn() == null || "".equals(entity.getSn())) {  
			menuMealMapper.insert(entity);
		} else {
			menuMealMapper.update(entity);
		}
	}

	/**
	 * 根据条件查询相关APP
	 * 
	 * @param vo
	 * @return
	 */
	public List<MenuMeal> queryMenuMealsByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return menuMealMapper.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<MenuMeal> queryMenuMealsForPage(ConditionVO vo,
			Page<MenuMeal> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", vo.getOrgCode());
		conditionMap.put("dishSn", vo.getEntityId());
		return super.queryForPage(menuMealMapper, conditionMap, page);
	}

	/**
	 * 根据餐台查找菜品类型
	 * 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<MenuMeal> queryMenuMealsByCant(String platNo) throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", platNo);
		return menuMealMapper.query(conditionMap);
	}
	
}
