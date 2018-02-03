package com.sc.dish.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.dish.dao.MaterialMapper;
import com.sc.dish.dao.MenuMaterialMapper;
import com.sc.dish.pojo.Material;
import com.sc.dish.pojo.MenuMaterial;
import com.sc.dish.pojo.MenuNutrition;
import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Service
public class MenuMaterialService extends BaseService<MenuMaterial>{
	@Autowired
	MenuMaterialMapper menuMaterialMapper;
	@Autowired
	MaterialMapper materialMapper;

	/**
	 * 删除APP
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteMenuMaterialById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				menuMaterialMapper.delete(conditionMap);
			}
		} catch (Exception err) {
			err.printStackTrace();
		}
		return true;
	}
	 
	
	public void save(ConditionVO vo)throws Exception{
		for (String id : vo.getEntityIds().split(",")) {
			Material material = materialMapper.getById(Long.parseLong(id));
			
			MenuMaterial menuMaterial = new MenuMaterial();
			menuMaterial.setDishSn(vo.getEntityId());
			menuMaterial.setMaterialSn(id);
			menuMaterial.setP1(material.getName());
			
			menuMaterialMapper.insert(menuMaterial);
		}
	}

	/**
	 * 根据Id得到APP信息
	 * 
	 * @param vo
	 * @return
	 */
	public MenuMaterial getMenuMaterialById(ConditionVO vo) throws Exception {
		return menuMaterialMapper.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增APP
	 * 
	 * @param entity
	 */
	public void saveOrUpdateMenuMaterialInfo(MenuMaterial entity) throws Exception {
		if (entity.getSn() == null || "".equals(entity.getSn())) {  
			menuMaterialMapper.insert(entity);
		} else {
			menuMaterialMapper.update(entity);
		}
	}

	/**
	 * 根据条件查询相关APP
	 * 
	 * @param vo
	 * @return
	 */
	public List<MenuMaterial> queryMenuMaterialsByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return menuMaterialMapper.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<MenuMaterial> queryMenuMaterialsForPage(ConditionVO vo,
			Page<MenuMaterial> page)  throws Exception{
		System.out.println("==================> id:"+vo.getEntityId());
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", vo.getOrgCode());
		conditionMap.put("dishSn", vo.getEntityId());
		return super.queryForPage(menuMaterialMapper, conditionMap, page);
	}

	/**
	 * 根据餐台查找菜品类型
	 * 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<MenuMaterial> queryMenuMaterialsByCant(String platNo) throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", platNo);
		return menuMaterialMapper.query(conditionMap);
	}

}
