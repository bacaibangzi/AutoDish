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
import com.sc.room.pojo.LouCeng;
import com.sc.room.service.LouCengService;

@Controller
@RequestMapping("/louCeng")
public class LouCengAction  extends BaseAction{
	@Autowired
	LouCengService louCengService;

	/**
	 * 类型页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "room/louCengMain";
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
			@ModelAttribute Page<LouCeng> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<LouCeng> list = louCengService.queryLouCengsForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * LouCeng编辑页面queryLouCengsPublishForPage
	 * @param vo
	 * @param LouCeng
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") LouCeng LouCeng,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(louCengService.getLouCengById(vo),LouCeng);
		}else{ 
		}
		return "room/louCengEidt";
	}
	
	/**
	 * LouCeng详细信息页面
	 * @param vo
	 * @param LouCeng
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") LouCeng LouCeng,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(louCengService.getLouCengById(vo),LouCeng);
		return "room/louCengDetail";
	}
	
	/**
	 * 保存LouCeng信息
	 * @param vo
	 * @param LouCeng
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute LouCeng LouCeng,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo); 
		louCengService.saveOrUpdateLouCengInfo(LouCeng);
		return "room/louCengMain";
	}
	
	/**
	 * 删除LouCeng信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		louCengService.deleteLouCengById(vo);
		return "room/louCengMain";
	}

}
