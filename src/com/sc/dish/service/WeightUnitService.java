package com.sc.dish.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.dish.dao.WeightUnitMapper;
import com.sc.dish.pojo.WeightUnit;
import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Service
public class WeightUnitService extends BaseService<WeightUnit>{
	@Autowired
	WeightUnitMapper weightUnitMapper;

	/**
	 * 删除APP
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteWeightUnitById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				weightUnitMapper.delete(conditionMap);
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
	public WeightUnit getWeightUnitById(ConditionVO vo) throws Exception {
		return weightUnitMapper.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增APP
	 * 
	 * @param entity
	 */
	public void saveOrUpdateWeightUnitInfo(WeightUnit entity) throws Exception {
		if (entity.getSn() == null || "".equals(entity.getSn())) {  
			weightUnitMapper.insert(entity);
		} else {
			weightUnitMapper.update(entity);
		}
	}

	/**
	 * 根据条件查询相关APP
	 * 
	 * @param vo
	 * @return
	 */
	public List<WeightUnit> queryWeightUnitsByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return weightUnitMapper.findPage(conditionMap);
	}
	
	/**
	 * queryWeightUnitsByCant
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<WeightUnit> queryWeightUnitsByCant(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", vo.getValue());
		return weightUnitMapper.query(conditionMap);
	}
	
	public List<WeightUnit> queryWeightUnitsByCant(String platNo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", platNo);
		return weightUnitMapper.query(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<WeightUnit> queryWeightUnitsForPage(ConditionVO vo,
			Page<WeightUnit> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", vo.getOrgCode());
		return super.queryForPage(weightUnitMapper, conditionMap, page);
	}
	
	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<WeightUnit> queryWeightUnitsPublishForPage(ConditionVO vo,
			Page<WeightUnit> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("state", vo.getValue());
		conditionMap.put("name", vo.getNameFilter());
		return super.queryForPage(weightUnitMapper, conditionMap, page);
	}

}
