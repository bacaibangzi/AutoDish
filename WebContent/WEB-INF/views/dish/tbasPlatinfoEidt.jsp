<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath %>common/js/jqueryByImg.js"></script>
<script type="text/javascript" src="<%=basePath %>common/js/ajaxupload.js"></script>
<jsp:include page="/common/include/includeform.jsp" />
<html>
<head>
<title>角色修改</title>
</head>
	<body>
		<div  class="form-mod">
			<form:form commandName="form" id="form" action="../tbasPlatinfo/save.htm" method="post">
				<input type="hidden" name="sn" value="${form.sn }" />
				<input type="hidden" name="departCode" value="${form.departCode }" />
				<input type="hidden" name="stationCode" value="${form.stationCode }" />
				<input type="hidden" name="p1" value="${form.p1 }" />
				<input type="hidden" name="p2" value="${form.p2 }" />
				<input type="hidden" name="userid" value="${sessionScope.accountInfo.userId}" />
				<div style="color:#F00;font-size:22px;">${vo.errMsg}</div><br>
				<table class="form-table" width="100%" border="0" cellspa3cing="0" cellpadding="0">
				<colspan>
					<col class="w_30per" />
					<col class="w_60per" />
				</colspan>
				<thead>
					<tr>
						<th colspan="2" class="form-hd">
							餐台信息
						</th>
						<tr>
					</tr>
				</thead>
				<tbody> 
					<tr>	
						<td class="hd" >
							餐台编号
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="platNo"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>
						<td class="hd" >
							餐台名称
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="platName"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>
						<td class="hd" >
							负责人
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="bossname"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>
						<td class="hd" >
							联系电话
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="phone"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>
						<td class="hd" >
							位置
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="location"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							所属商户
							<span class="field-tips">*</span>
						</td>
						<td >
							<input type="text" class="filter-text" id="orgName" name="orgName" readonly="readonly" value="${name}"/>
							<!-- <button onclick="showOrgTree()">.</button> -->
							<input type="button" onclick="showOrgTree()"  value="." />
							<input type="hidden" id="orgCode" name="orgCode" value="${form.orgCode}" />
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" class="form-btn" value="保存" onclick="submitCheck()" id="saveNotesSub" />
							<input type="button" class="form-btn" value="返回" onclick="returnUrl();" />
						</td>
					</tr>
				</tfoot>
				</table>
			</form:form>
		</div>
		
		<!-- 弹出框控件 -->
		<script type="text/javascript" src="../common/js/tree/js/tree.js"></script>
		<!-- 日期控件 -->
		<script type="text/javascript" src="../common/js/datapicker/WdatePicker.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#form").validate();
			});

			//	$("#fHeader").css({"background-image":"url(http://noi.qianzhi8.com/common/images/up.png)","background-size":"110px 185px"});

			
			// 返回
	        function returnUrl(){
	        	history.go(-1); 
	        	//window.location.href = "<%=basePath %>apps/main.htm";
			}
			<%-- 内容保存 --%>
		    function submitCheck(){
		    	var validate = $("#form").validate({meta:"validate"});
		    	
		    	
				if(validate.form()){
			    	// 判断是否选择摊位
					var orgName = $("#orgName").val();
					if(orgName==''){
						fh.alert("请选择摊位!");
						return;
					}
					
		    		$("#form").submit();  
		   		}
		   	}
		   

		    
			var orgCode = "";
			var orgName = "";
			function showOrgTree()
			{

				var commonDialog = commonOpenDialog("readDetail",'选择摊位',700,450, '<%=basePath%>org/orgTree1.htm?orgCode=${sessionScope.accountInfo.orgCode}');
				commonDialog.addBtn("cancel",'取消', commonDialog.cancel);
				commonDialog.addBtn("ok",'确定', function()
				{
					orgType = $("#orgType", commonDialog.dgDoc).val();
					if(orgType!='2'){
						fh.alert("请先选择商户！");
						return;
					}
					
					orgCode = $("#orgCode", commonDialog.dgDoc).val();
					orgName = $("#orgName", commonDialog.dgDoc).val();
					
					document.getElementById('orgCode').value = orgCode;
					document.getElementById('orgName').value = orgName;
					
					commonDialog.cancel();
				});
			}		    
		</script>
</body>
</html>