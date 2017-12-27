package com.sc.dish.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sc.dish.dao.NutritionMapper;
import com.sc.dish.pojo.Nutrition;
import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

public class NutritionService extends BaseService<Nutrition>{
	@Autowired
	NutritionMapper NutritionMapper;

	/**
	 * 删除APP
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteNutritionById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				NutritionMapper.delete(conditionMap);
			}
		} catch (Exception err) {
			err.printStackTrace();
		}
		return true;
	}
	 

	/**
	 * 根据Id得到APP信息
	 * 
	 * @param vo
	 * @return
	 */
	public Nutrition getNutritionById(ConditionVO vo) throws Exception {
		return NutritionMapper.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增APP
	 * 
	 * @param entity
	 */
	public void saveOrUpdateNutritionInfo(Nutrition entity) throws Exception {
		if (entity.getSn() == null || "".equals(entity.getSn())) {  
			NutritionMapper.insert(entity);
		} else {
			NutritionMapper.update(entity);
		}
	}

	/**
	 * 根据条件查询相关APP
	 * 
	 * @param vo
	 * @return
	 */
	public List<Nutrition> queryNutritionsByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return NutritionMapper.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<Nutrition> queryNutritionsForPage(ConditionVO vo,
			Page<Nutrition> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", vo.getOrgCode());
		return super.queryForPage(NutritionMapper, conditionMap, page);
	}

	/**
	 * 根据餐台查找菜品类型
	 * 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<Nutrition> queryNutritionsByCant(String platNo) throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", platNo);
		return NutritionMapper.query(conditionMap);
	}

}
