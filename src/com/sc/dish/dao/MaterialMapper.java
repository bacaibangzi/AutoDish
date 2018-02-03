package com.sc.dish.dao;

import java.util.List;
import java.util.Map;

import com.sc.dish.pojo.Material;
import com.sc.dish.pojo.MenuMaterial;
import com.sc.framework.base.dao.BaseDao;

public interface MaterialMapper extends BaseDao<Material>{

	public List<Material> queryByDishSn(Map<String, Object> conditionMap)
			throws Exception;	
}
