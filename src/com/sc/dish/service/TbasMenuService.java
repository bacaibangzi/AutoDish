package com.sc.dish.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.developer.dao.AppsMapper;
import com.sc.developer.pojo.Apps;
import com.sc.dish.dao.TbasMenuMapper;
import com.sc.dish.pojo.TbasMenu;
import com.sc.dish.pojo.TbasMenu;
import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Service
public class TbasMenuService extends BaseService<TbasMenu>{
	@Autowired
	TbasMenuMapper tbasMenuMapper;

	/**
	 * 删除APP
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteTbasMenuById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				tbasMenuMapper.delete(conditionMap);
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
	public TbasMenu getTbasMenuById(ConditionVO vo) throws Exception {
		return tbasMenuMapper.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增APP
	 * 
	 * @param entity
	 */
	public void saveOrUpdateTbasMenuInfo(TbasMenu entity) throws Exception {
		if (entity.getSn() == null || "".equals(entity.getSn())) {  
			tbasMenuMapper.insert(entity);
		} else {
			tbasMenuMapper.update(entity);
		}
	}

	/**
	 * 根据条件查询相关APP
	 * 
	 * @param vo
	 * @return
	 */
	public List<TbasMenu> queryTbasMenusByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return tbasMenuMapper.findPage(conditionMap);
	}
	
	public List<TbasMenu> queryTbasMenusByCant(String platNo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", platNo);
		return tbasMenuMapper.query(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<TbasMenu> queryTbasMenusForPage(ConditionVO vo,
			Page<TbasMenu> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", vo.getOrgCode());
		return super.queryForPage(tbasMenuMapper, conditionMap, page);
	}
}
