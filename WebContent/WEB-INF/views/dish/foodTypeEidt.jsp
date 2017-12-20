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
<title>菜品类型</title>
</head>
	<body>
		<div  class="form-mod">
			<form:form commandName="form" id="form" action="../foodType/save.htm" method="post">
				<input type="hidden" name="sn" value="${form.sn }" />
				<input type="hidden" id ="orgCode" name="orgCode" value="${form.orgCode }" />
				<table class="form-table" width="100%" border="0" cellspa3cing="0" cellpadding="0">
				<colspan>
					<col class="w_30per" />
					<col class="w_60per" />
				</colspan>
				<thead>
					<tr>
						<th colspan="2" class="form-hd">
							菜品类型
						</th>
						<tr>
					</tr>
				</thead>
				<tbody>
					<tr>	
						<td class="hd" >
							类型编码
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="typeId"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							类型名称
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="typeName"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							所属餐台
							<span class="field-tips">*</span>
						</td>
						<td >
							<input type="text" class="filter-text" id="platName" name="platName" readonly="readonly" value="${name}"/>
							<!-- <button onclick="showOrgTree()">.</button> -->
							<input type="button" onclick="showOrgTree()"  value="." />
							<input type="hidden" id="platNo" name="platNo" value="${form.platNo}" />
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

			//$("#fHeader").css({"background-image":"url(http://noi.qianzhi8.com/common/images/up.png)","background-size":"110px 185px"});

			
			// 返回
	        function returnUrl(){
	        	//history.go(-1); 
	        	window.location.href = "<%=basePath %>foodType/main.htm";
			}
			<%-- 内容保存 --%>
		    function submitCheck(){
		    	var validate = $("#form").validate({meta:"validate"});
				if(validate.form()){
		    		$("#form").submit();  
		   		}
		   	}
		   
			var orgCode = "";
			var orgName = "";
			var platNo  = "";
			function showOrgTree()
			{

				var commonDialog = commonOpenDialog("readDetail",'选择餐台',400,320, '<%=basePath%>tbasPlatinfo/cant.htm?orgCode=${sessionScope.accountInfo.orgCode}');
				commonDialog.addBtn("cancel",'取消', commonDialog.cancel);
				commonDialog.addBtn("ok",'确定', function()
				{
					orgCode = $("#orgCode", commonDialog.dgDoc).val();
					orgName = $("#orgName", commonDialog.dgDoc).val();
					platNo = $("#platNo", commonDialog.dgDoc).val();
					
					document.getElementById('platNo').value = platNo;
					document.getElementById('platName').value = orgName;
					document.getElementById('orgCode').value = orgCode;
					
					commonDialog.cancel();
				});
			}
		</script>
</body>
</html>