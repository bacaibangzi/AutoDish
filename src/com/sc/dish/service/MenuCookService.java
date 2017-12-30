package com.sc.dish.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.dish.dao.CookMapper;
import com.sc.dish.dao.MenuCookMapper;
import com.sc.dish.pojo.Cook;
import com.sc.dish.pojo.MenuCook;
import com.sc.dish.pojo.MenuNutrition;
import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Service
public class MenuCookService extends BaseService<MenuCook>{
	@Autowired
	MenuCookMapper menuCookMapper;
	@Autowired
	CookMapper cookMapper;

	/**
	 * 删除APP
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteMenuCookById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				menuCookMapper.delete(conditionMap);
			}
		} catch (Exception err) {
			err.printStackTrace();
		}
		return true;
	}
	 


	public void save(ConditionVO vo)throws Exception{
		for (String id : vo.getEntityIds().split(",")) {
			Cook cook = cookMapper.getById(Long.parseLong(id));
			
			MenuCook menuCook = new MenuCook();
			menuCook.setDishSn(vo.getEntityId());
			menuCook.setCookSn(id);
			menuCook.setP1(cook.getName());
			
			menuCookMapper.insert(menuCook);
		}
	}
	
	/**
	 * 根据Id得到APP信息
	 * 
	 * @param vo
	 * @return
	 */
	public MenuCook getMenuCookById(ConditionVO vo) throws Exception {
		return menuCookMapper.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增APP
	 * 
	 * @param entity
	 */
	public void saveOrUpdateMenuCookInfo(MenuCook entity) throws Exception {
		if (entity.getSn() == null || "".equals(entity.getSn())) {  
			menuCookMapper.insert(entity);
		} else {
			menuCookMapper.update(entity);
		}
	}

	/**
	 * 根据条件查询相关APP
	 * 
	 * @param vo
	 * @return
	 */
	public List<MenuCook> queryMenuCooksByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return menuCookMapper.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<MenuCook> queryMenuCooksForPage(ConditionVO vo,
			Page<MenuCook> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("orgCode", vo.getOrgCode());
		return super.queryForPage(menuCookMapper, conditionMap, page);
	}

	/**
	 * 根据餐台查找菜品类型
	 * 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<MenuCook> queryMenuCooksByCant(String platNo) throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("platNo", platNo);
		return menuCookMapper.query(conditionMap);
	}

}
