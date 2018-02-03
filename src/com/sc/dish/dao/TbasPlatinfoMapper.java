package com.sc.dish.dao;

import java.util.Map;

import com.sc.dish.pojo.TbasPlatinfo;
import com.sc.framework.base.dao.BaseDao;

public interface TbasPlatinfoMapper extends BaseDao<TbasPlatinfo>{
	
	public TbasPlatinfo getByNoOrgCode(Map<String, Object> conditionMap)
			throws Exception;
	
	public TbasPlatinfo getByNo(Map<String, Object> conditionMap)
			throws Exception;	
	
	
}
