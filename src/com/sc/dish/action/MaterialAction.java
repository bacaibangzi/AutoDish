package com.sc.dish.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.dish.pojo.Material;
import com.sc.dish.service.MaterialService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;

@Controller
@RequestMapping("/material")
public class MaterialAction extends BaseAction {
	@Autowired
	MaterialService materialService;

	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		System.out.println("--> main");
		return "dish/materialMain";
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
			@ModelAttribute Page<Material> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<Material> list = materialService.queryMaterialsForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * Material编辑页面queryMaterialsPublishForPage
	 * @param vo
	 * @param Material
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Material Material,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		if(vo.getEntityId()!=null){
			BeanUtils.copyProperties(materialService.getMaterialById(vo),Material);
		} 
		return "dish/materialEidt";
	}
	
	/**
	 * Material详细信息页面
	 * @param vo
	 * @param Material
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") Material Material,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(materialService.getMaterialById(vo),Material);
		return "dish/materialDetail";
	}
	
	/**
	 * 保存Material信息
	 * @param vo
	 * @param Material
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute("form")  Material Material,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		try{
			materialService.saveOrUpdateMaterialInfo(Material);
		}catch(Exception err){
			err.printStackTrace();
			if( err instanceof DuplicateKeyException){
				vo.setErrMsg("编码重复");
				return "dish/materialEidt";
			}
		}
		return "dish/materialMain";
	}
	
	/**
	 * 删除Material信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		materialService.deleteMaterialById(vo);
		return "dish/materialMain";
	}

}
