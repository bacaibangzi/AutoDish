<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/common/include/includeform.jsp" />
<html>
<head>
<title>组织机构修改</title>
</head>
	<body>
		<div  class="form-mod">
			<form:form commandName="form" id="form" action="../agOrg/save.htm" method="post">
				<input type="hidden" name="oiId" value="${form.oiId }" />
				<input type="hidden" name="oiCode" value="${form.oiCode }" />
				<input type="hidden" name="oiType" value="2" />
				<table class="form-table" width="100%" border="0" cellspa3cing="0" cellpadding="0">
				<colspan>
					<col class="w_30per" />
					<col class="w_60per" />
				</colspan>
				<thead>
					<tr>
						<th colspan="2" class="form-hd">
							摊位信息
						</th>
						<tr>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="hd" >
							摊位编码
							<span class="field-tips"></span>
						</td>
						<td >
							${form.oiCode}
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							摊位名称
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="oiName"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<!--  
					-->
					<tr>	
						<td class="hd" >
							所属食堂
							<span class="field-tips">*</span>
						</td>
						<td >
							<input type="text" class="filter-text" id="orgName" name="orgName" readonly="readonly" value="${name}"/>
							<!-- <button onclick="showOrgTree()">.</button> -->
							<input type="button" onclick="showOrgTree()"  value="." />
							<input type="hidden" id="orgCode" name="orgCode" value="${code}" />
						</td>
					</tr>
					<tr>
						<td class="hd" >
							备注
							<span class="field-tips"></span>
						</td>
						<td >
							<form:textarea  path="oiMemo" rows="5" cols="26" cssClass="input-area {required: true, maxlength: 20}" />
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

			// 返回
	        function returnUrl(){
	        	history.go(-1);
			}
			<%-- 内容保存 --%>
		    function submitCheck(){
		    	var orgType = $("#orgCode");
			    if(orgType==""){
				    fh.alert("请先选择食堂！");
				    return false;
			    }
		    	var validate = $("#form").validate({meta:"validate"});
				if(validate.form()){
		    		$("#form").submit();  
		   		}
		   	}
		    
			var orgCode = "";
			var orgName = "";
			function showOrgTree()
			{

				var commonDialog = commonOpenDialog("readDetail",'选择食堂',700,450, '<%=basePath%>org/orgTree.htm?orgCode=${sessionScope.accountInfo.orgCode}');
				commonDialog.addBtn("cancel",'取消', commonDialog.cancel);
				commonDialog.addBtn("ok",'确定', function()
				{
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