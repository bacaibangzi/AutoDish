package com.sc.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.framework.base.service.BaseService;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;
import com.sc.room.dao.RoomDao;
import com.sc.room.pojo.Room;

@Service
public class RoomService extends BaseService<Room> {
	@Autowired
	RoomDao roomDao;

	/**
	 * 删除银行账户
	 * 
	 * @param vo
	 * @return
	 */
	public boolean deleteRoomById(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			for (String id : vo.getEntityIds().split(",")) {
				conditionMap.put("sn", id);
				roomDao.delete(conditionMap);
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
	public Room getRoomById(ConditionVO vo) throws Exception {
		return roomDao.getById(Long.parseLong(vo.getEntityId()));
	}

	/**
	 * 保存或新增银行账户
	 * 
	 * @param entity
	 */
	public void saveOrUpdateRoomInfo(Room entity) throws Exception {
		if (entity.getSn() == null) {  
			roomDao.insert(entity);
		} else {
			roomDao.update(entity);
		}
	}

	/**
	 * 根据条件查询相关银行账户
	 * 
	 * @param vo
	 * @return
	 */
	public List<Room> queryRoomsByCondition(ConditionVO vo)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return roomDao.findPage(conditionMap);
	}

	/**
	 * 根据条件分页查询
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public Page<Room> queryRoomsForPage(ConditionVO vo,
			Page<Room> page)  throws Exception{
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		return super.queryForPage(roomDao, conditionMap, page);
	}
}
