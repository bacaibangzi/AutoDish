package com.sc.dish.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.dish.dao.TbasPlatinfoMapper;
import com.sc.dish.pojo.TbasPlatinfo;
import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Service
public class TbasPlatinfoService extends BaseService<TbasPlatinfo>{
	@Autowired
	TbasPlatinfoMapper tbasPlatinfoMapper;

	/**
	 * 删除APP
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteTbasPlatinfoById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				tbasPlatinfoMapper.delete(conditionMap);
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
	public TbasPlatinfo getTbasPlatinfoById(ConditionVO vo) throws Exception {
		return tbasPlatinfoMapper.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增APP
	 * 
	 * @param entity
	 */
	public void saveOrUpdateTbasPlatinfoInfo(TbasPlatinfo entity) throws Exception {
		System.out.println("=========> sn:"+entity.getSn());
		if (entity.getSn() == null||"".equals(entity.getSn())) {  
			tbasPlatinfoMapper.insert(entity);
		} else {
			tbasPlatinfoMapper.update(entity);
		}
	}

	/**
	 * 根据条件查询相关APP
	 * 
	 * @param vo
	 * @return
	 */
	public List<TbasPlatinfo> queryTbasPlatinfosByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return tbasPlatinfoMapper.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<TbasPlatinfo> queryTbasPlatinfosForPage(ConditionVO vo,
			Page<TbasPlatinfo> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", vo.getOrgCode());
		return super.queryForPage(tbasPlatinfoMapper, conditionMap, page);
	}
	 
	public TbasPlatinfo getByNoOrgCode(String platNo,String orgCode)
			throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", orgCode);
		conditionMap.put("platNo", platNo);
		return tbasPlatinfoMapper.getByNoOrgCode(conditionMap);
	}
			
	public TbasPlatinfo getByNo(String platNo)
			throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", platNo);
		return tbasPlatinfoMapper.getByNo(conditionMap);
	}
}
