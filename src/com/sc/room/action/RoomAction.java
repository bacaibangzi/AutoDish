package com.sc.room.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;
import com.sc.room.pojo.Room;
import com.sc.room.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomAction  extends BaseAction{
	@Autowired
	RoomService roomService;

	/**
	 * 类型页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "room/roomMain";
	}

	/**
	 * 加载类型信息
	 * @param vo
	 * @param page
	 * @param response
	 */
	@RequestMapping(value = "/list.htm", method = RequestMethod.POST)
	@ResponseBody
	public void list(@ModelAttribute ConditionVO vo,
			@ModelAttribute Page<Room> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<Room> list = roomService.queryRoomsForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * Room编辑页面queryRoomsPublishForPage
	 * @param vo
	 * @param Room
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Room Room,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(roomService.getRoomById(vo),Room);
		}else{ 
		}
		return "room/roomEidt";
	}
	
	/**
	 * Room详细信息页面
	 * @param vo
	 * @param Room
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Room Room,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(roomService.getRoomById(vo),Room);
		return "room/roomDetail";
	}
	
	/**
	 * 保存Room信息
	 * @param vo
	 * @param Room
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute Room Room,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo); 
		roomService.saveOrUpdateRoomInfo(Room);
		return "room/roomMain";
	}
	
	/**
	 * 删除Room信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		roomService.deleteRoomById(vo);
		return "room/roomMain";
	}

}
