package com.sc.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;
import com.sc.room.dao.CustomerDao;
import com.sc.room.pojo.Customer;

@Service
public class CustomerService extends BaseService<Customer> {
	@Autowired
	CustomerDao customerDao;

	/**
	 * 删除银行账户
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteCustomerById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				customerDao.sh(id);
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
	public Customer getCustomerById(ConditionVO vo) throws Exception {
		return customerDao.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增银行账户
	 * 
	 * @param entity
	 */
	public void saveOrUpdateCustomerInfo(Customer entity) throws Exception {
		if (entity.getSn() == null) {  
			customerDao.insert(entity);
		} else {
			customerDao.update(entity);
		}
	}

	/**
	 * 根据条件查询相关银行账户
	 * 
	 * @param vo
	 * @return
	 */
	public List<Customer> queryCustomersByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return customerDao.findPage(conditionMap);
	}
	
	public List<Customer> queryCustomersBySfz(String sfz)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("sfz", sfz);
		return customerDao.findPage(conditionMap);
	}
	public List<Customer> queryCustomersByTel(String tel)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("tel", tel);
		return customerDao.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<Customer> queryCustomersForPage(ConditionVO vo,
			Page<Customer> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return super.queryForPage(customerDao, conditionMap, page);
	}
	
	public Customer getByOpenid(String openid){
		return customerDao.getByOpenid(openid);
	}
}
