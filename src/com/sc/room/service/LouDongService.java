package com.sc.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;
import com.sc.room.dao.LouDongDao;
import com.sc.room.pojo.LouDong;

@Service
public class LouDongService extends BaseService<LouDong> {
	@Autowired
	LouDongDao louDongDao;

	/**
	 * 删除银行账户
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteLouDongById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				louDongDao.delete(conditionMap);
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
	public LouDong getLouDongById(ConditionVO vo) throws Exception {
		return louDongDao.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增银行账户
	 * 
	 * @param entity
	 */
	public void saveOrUpdateLouDongInfo(LouDong entity) throws Exception {
		if (entity.getSn() == null) {  
			louDongDao.insert(entity);
		} else {
			louDongDao.update(entity);
		}
	}

	/**
	 * 根据条件查询相关银行账户
	 * 
	 * @param vo
	 * @return
	 */
	public List<LouDong> queryLouDongsByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return louDongDao.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<LouDong> queryLouDongsForPage(ConditionVO vo,
			Page<LouDong> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return super.queryForPage(louDongDao, conditionMap, page);
	}
}
