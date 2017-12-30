package com.sc.dish.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.dish.pojo.MenuMaterial;
import com.sc.dish.service.MenuMaterialService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Controller
@RequestMapping("/menuMaterial")
public class MenuMaterialAction extends BaseAction {
	@Autowired
	MenuMaterialService menuMaterialService;

	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "dish/menuMaterialMain";
	}

	/**
	 * 加载产品服务信息
	 * @param vo
	 * @param page
	 * @param response
	 */
	@RequestMapping(value = "/list.htm", method = RequestMethod.POST)
	@ResponseBody
	public void list(@ModelAttribute ConditionVO vo,
			@ModelAttribute Page<MenuMaterial> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<MenuMaterial> list = menuMaterialService.queryMenuMaterialsForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * MenuMaterial编辑页面queryMenuMaterialsPublishForPage
	 * @param vo
	 * @param MenuMaterial
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") MenuMaterial MenuMaterial,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(menuMaterialService.getMenuMaterialById(vo),MenuMaterial);
		} 
		return "dish/menuMaterialEidt";
	}
	
	/**
	 * MenuMaterial详细信息页面
	 * @param vo
	 * @param MenuMaterial
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") MenuMaterial MenuMaterial,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(menuMaterialService.getMenuMaterialById(vo),MenuMaterial);
		return "dish/menuMaterialDetail";
	}
	
	/**
	 * 保存MenuMaterial信息
	 * @param vo
	 * @param MenuMaterial
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute MenuMaterial MenuMaterial,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		
		//menuMaterialService.saveOrUpdateMenuMaterialInfo(MenuMaterial);
		menuMaterialService.save(vo);
		
		return "dish/menuMaterialMain";
	}
	
	/**
	 * 删除MenuMaterial信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		menuMaterialService.deleteMenuMaterialById(vo);
		return "dish/menuMaterialMain";
	}

}
