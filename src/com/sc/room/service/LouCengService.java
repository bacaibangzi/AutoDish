package com.sc.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;
import com.sc.room.dao.LouCengDao;
import com.sc.room.pojo.LouCeng;

@Service
public class LouCengService extends BaseService<LouCeng> {
	@Autowired
	LouCengDao louCengDao;

	/**
	 * 删除银行账户
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteLouCengById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				louCengDao.delete(conditionMap);
			}
		} catch (Exception err) {
			err.printStackTrace();
		}
		return true;
	}

	/**
	 * 根据Id得到银行账户信息
	 * 
	 * @param vo
	 * @return
	 */
	public LouCeng getLouCengById(ConditionVO vo) throws Exception {
		return louCengDao.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增银行账户
	 * 
	 * @param entity
	 */
	public void saveOrUpdateLouCengInfo(LouCeng entity) throws Exception {
		if (entity.getSn() == null) {  
			louCengDao.insert(entity);
		} else {
			louCengDao.update(entity);
		}
	}

	/**
	 * 根据条件查询相关银行账户
	 * 
	 * @param vo
	 * @return
	 */
	public List<LouCeng> queryLouCengsByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return louCengDao.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<LouCeng> queryLouCengsForPage(ConditionVO vo,
			Page<LouCeng> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return super.queryForPage(louCengDao, conditionMap, page);
	}
}
