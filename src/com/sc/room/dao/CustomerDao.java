package com.sc.room.dao;

import com.sc.framework.base.dao.BaseDao;
import com.sc.room.pojo.Customer;

public interface CustomerDao extends BaseDao<Customer>{

	Customer getByOpenid(String openid);
	
	void sh(String sn);
}
