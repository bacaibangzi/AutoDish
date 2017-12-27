package com.sc.dish.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sc.dish.dao.MaterialMapper;
import com.sc.dish.pojo.Material;
import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

public class MaterialService extends BaseService<Material>{
	@Autowired
	MaterialMapper materialMapper;

	/**
	 * 删除APP
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteMaterialById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				materialMapper.delete(conditionMap);
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
	public Material getMaterialById(ConditionVO vo) throws Exception {
		return materialMapper.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增APP
	 * 
	 * @param entity
	 */
	public void saveOrUpdateMaterialInfo(Material entity) throws Exception {
		if (entity.getSn() == null || "".equals(entity.getSn())) {  
			materialMapper.insert(entity);
		} else {
			materialMapper.update(entity);
		}
	}

	/**
	 * 根据条件查询相关APP
	 * 
	 * @param vo
	 * @return
	 */
	public List<Material> queryMaterialsByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return materialMapper.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<Material> queryMaterialsForPage(ConditionVO vo,
			Page<Material> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", vo.getOrgCode());
		return super.queryForPage(materialMapper, conditionMap, page);
	}

	/**
	 * 根据餐台查找菜品类型
	 * 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<Material> queryMaterialsByCant(String platNo) throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", platNo);
		return materialMapper.query(conditionMap);
	}

}
