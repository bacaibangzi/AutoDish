package com.sc.dish.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.dish.dao.MenuNutritionMapper;
import com.sc.dish.dao.NutritionMapper;
import com.sc.dish.pojo.MenuMaterial;
import com.sc.dish.pojo.MenuMeal;
import com.sc.dish.pojo.MenuNutrition;
import com.sc.dish.pojo.Nutrition;
import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Service
public class MenuNutritionService extends BaseService<MenuNutrition>{
	@Autowired
	MenuNutritionMapper menuNutritionMapper;
	@Autowired
	NutritionMapper nutritionMapper;

	/**
	 * 删除APP
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteMenuNutritionById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				menuNutritionMapper.delete(conditionMap);
			}
		} catch (Exception err) {
			err.printStackTrace();
		}
		return true;
	}
	 
	public void save(ConditionVO vo)throws Exception{
		for (String id : vo.getEntityIds().split(",")) {
			Nutrition nutrition = nutritionMapper.getById(Long.parseLong(id));
			
			MenuNutrition menuNutrition = new MenuNutrition();
			menuNutrition.setDishSn(vo.getEntityId());
			menuNutrition.setMaterialSn(id);
			menuNutrition.setP1(nutrition.getName());
			
			menuNutritionMapper.insert(menuNutrition);
		}
	}

	/**
	 * 根据Id得到APP信息
	 * 
	 * @param vo
	 * @return
	 */
	public MenuNutrition getMenuNutritionById(ConditionVO vo) throws Exception {
		return menuNutritionMapper.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增APP
	 * 
	 * @param entity
	 */
	public void saveOrUpdateMenuNutritionInfo(MenuNutrition entity) throws Exception {
		if (entity.getSn() == null || "".equals(entity.getSn())) {  
			menuNutritionMapper.insert(entity);
		} else {
			menuNutritionMapper.update(entity);
		}
	}

	/**
	 * 根据条件查询相关APP
	 * 
	 * @param vo
	 * @return
	 */
	public List<MenuNutrition> queryMenuNutritionsByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return menuNutritionMapper.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<MenuNutrition> queryMenuNutritionsForPage(ConditionVO vo,
			Page<MenuNutrition> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", vo.getOrgCode());
		conditionMap.put("dishSn", vo.getEntityId());
		return super.queryForPage(menuNutritionMapper, conditionMap, page);
	}

	/**
	 * 根据餐台查找菜品类型
	 * 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<MenuNutrition> queryMenuNutritionsByCant(String platNo) throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", platNo);
		return menuNutritionMapper.query(conditionMap);
	}

}
