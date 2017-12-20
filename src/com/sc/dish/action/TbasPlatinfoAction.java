package com.sc.dish.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sc.dish.pojo.TbasPlatinfo;
import com.sc.dish.service.TbasPlatinfoService;
import com.sc.framework.base.action.BaseAction;
import com.sc.framework.vo.ConditionVO;
import com.sc.framework.vo.Page;
import com.sc.system.pojo.OrgInfo;
import com.sc.system.service.OrgInfoService;


@Controller
@RequestMapping("/tbasPlatinfo")
public class TbasPlatinfoAction extends BaseAction {
	@Autowired
	TbasPlatinfoService tbasPlatinfoService;
	@Autowired
	OrgInfoService orgInfoService;

	/**
	 * 产品服务页面
	 * @return
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String toMain() {
		return "dish/tbasPlatinfoMain";
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
			@ModelAttribute Page<TbasPlatinfo> page, HttpServletResponse response) throws Exception {
		super.setPageInfo(page);
		Page<TbasPlatinfo> list = tbasPlatinfoService.queryTbasPlatinfosForPage(vo, page);
		super.readerPage2Json(list, response);

	}

	/**
	 * TbasPlatinfo编辑页面queryTbasPlatinfosPublishForPage
	 * @param vo
	 * @param TbasPlatinfo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/eidt.htm", method = RequestMethod.GET)
	public String eidt(@ModelAttribute ConditionVO vo,@ModelAttribute("form") TbasPlatinfo TbasPlatinfo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		
		if(vo.getEntityId()!=null){
			
			TbasPlatinfo tpi = tbasPlatinfoService.getTbasPlatinfoById(vo);
			
			if(tpi.getOrgCode()!=null){
				//System.out.println("id : "+of.getIdStr());
				vo.setOrgCode(tpi.getOrgCode());
				OrgInfo oi = orgInfoService.queryOrgInfosByCondition(vo).get(0);
		
				request.setAttribute("code", oi.getOiCode());
				request.setAttribute("name", oi.getOiName());
			}
			BeanUtils.copyProperties(tpi,TbasPlatinfo);
		} 
		return "dish/tbasPlatinfoEidt";
	}
	
	/**
	 * TbasPlatinfo详细信息页面
	 * @param vo
	 * @param TbasPlatinfo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/detail.htm", method = RequestMethod.GET)
	public String detail(@ModelAttribute ConditionVO vo,@ModelAttribute("form") TbasPlatinfo TbasPlatinfo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		BeanUtils.copyProperties(tbasPlatinfoService.getTbasPlatinfoById(vo),TbasPlatinfo);
		return "dish/tbasPlatinfoDetail";
	}
	
	/**
	 * 保存TbasPlatinfo信息
	 * @param vo
	 * @param TbasPlatinfo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save.htm", method = RequestMethod.POST)
	public String save(@ModelAttribute ConditionVO vo,@ModelAttribute TbasPlatinfo TbasPlatinfo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		
		tbasPlatinfoService.saveOrUpdateTbasPlatinfoInfo(TbasPlatinfo);
		return "dish/tbasPlatinfoMain";
	}
	
	/**
	 * 删除TbasPlatinfo信息
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete.htm", method = RequestMethod.GET)
	public String delete(@ModelAttribute ConditionVO vo,HttpServletRequest request) throws Exception{
		request.setAttribute("vo", vo);
		tbasPlatinfoService.deleteTbasPlatinfoById(vo);
		return "dish/tbasPlatinfoMain";
	}

	
	/**
	 * 组织机构树状Tree结构
	 * 
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/cant.htm", method = RequestMethod.GET)
	public String orgTree(@ModelAttribute ConditionVO vo,
			HttpServletRequest request) throws Exception {
		request.setAttribute("vo", vo);

		// 加载组织机构tree 图片路径
		String path = "../application/images/icon/org_start.png";
		List<TbasPlatinfo> list = tbasPlatinfoService.queryTbasPlatinfosByCondition(vo);
		List<Map<String, Object>> nodeList = getOrgTreeNode1(list, path, vo
				.getOrgCode());
		request.setAttribute("nodeList", new Gson().toJson(nodeList));

		return "dish/selectCantTree";
	}
	


	public List<Map<String, Object>> getOrgTreeNode1(List<TbasPlatinfo> orgList,
			String path, String org) {
		List<TbasPlatinfo> list = orgList;
		List<Map<String, Object>> nodeList = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (TbasPlatinfo area : list) {
			map = new HashMap<String, Object>();
			map.put("id", area.getPlatNo());
			map.put("checkAble", "false");
			map.put("text", area.getPlatName());
			map.put("value", area.getOrgCode());
			map.put("showcheck", "");
			map.put("complete", true);
			map.put("isexpand", false);
			map.put("checkstate", "0");
			map.put("hasChildren", false);
			// map.put("pid", area.getOiCode());// 父节点，取前4位
			map.put("ChildNodes", new ArrayList());
			map.put("code", area.getPlatNo()); 
			//map.put("imgPath", path);
			map.put("imgPath", "../application/images/org/ag.png");
			
			map.put("pid", "-1");
			
			nodeList.add(map);
		}
		return nodeList;
	}
	
}
