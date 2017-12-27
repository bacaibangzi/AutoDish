package com.sc.dish.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sc.dish.dao.CookMapper;
import com.sc.dish.pojo.Cook;
import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

public class CookService extends BaseService<Cook>{
	@Autowired
	CookMapper cookMapper;

	/**
	 * 删除APP
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteCookById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				cookMapper.delete(conditionMap);
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
	public Cook getCookById(ConditionVO vo) throws Exception {
		return cookMapper.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增APP
	 * 
	 * @param entity
	 */
	public void saveOrUpdateCookInfo(Cook entity) throws Exception {
		if (entity.getSn() == null || "".equals(entity.getSn())) {  
			cookMapper.insert(entity);
		} else {
			cookMapper.update(entity);
		}
	}

	/**
	 * 根据条件查询相关APP
	 * 
	 * @param vo
	 * @return
	 */
	public List<Cook> queryCooksByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return cookMapper.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<Cook> queryCooksForPage(ConditionVO vo,
			Page<Cook> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", vo.getOrgCode());
		return super.queryForPage(cookMapper, conditionMap, page);
	}

	/**
	 * 根据餐台查找菜品类型
	 * 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<Cook> queryCooksByCant(String platNo) throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", platNo);
		return cookMapper.query(conditionMap);
	}

}
