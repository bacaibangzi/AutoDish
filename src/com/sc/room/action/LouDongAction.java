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
import com.sc.room.pojo.LouDong;
import com.sc.room.service.LouDongService;

@Controller
@RequestMapping("/louDong")
public class LouDongAction  extends BaseAction{
	@Autowired
	LouDongService louDongService;

	/**
	 * 类型页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "room/louDongMain";
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
			@ModelAttribute Page<LouDong> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<LouDong> list = louDongService.queryLouDongsForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * LouDong编辑页面queryLouDongsPublishForPage
	 * @param vo
	 * @param LouDong
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") LouDong LouDong,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(louDongService.getLouDongById(vo),LouDong);
		}else{ 
		}
		return "room/louDongEidt";
	}
	
	/**
	 * LouDong详细信息页面
	 * @param vo
	 * @param LouDong
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") LouDong LouDong,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(louDongService.getLouDongById(vo),LouDong);
		return "room/louDongDetail";
	}
	
	/**
	 * 保存LouDong信息
	 * @param vo
	 * @param LouDong
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute LouDong LouDong,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo); 
		louDongService.saveOrUpdateLouDongInfo(LouDong);
		return "room/louDongMain";
	}
	
	/**
	 * 删除LouDong信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		louDongService.deleteLouDongById(vo);
		return "room/louDongMain";
	}

}
