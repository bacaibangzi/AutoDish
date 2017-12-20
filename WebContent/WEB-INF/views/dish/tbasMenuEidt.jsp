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
<title>菜品修改</title>
</head>
	<body>
		<div  class="form-mod">
			<form:form commandName="form" id="form" action="../tbasMenu/save.htm" method="post">
				<input type="hidden" name="sn" value="${form.sn }" />
				<input type="hidden" name="operator" value="${form.operator }" />
				<input type="hidden" name="orgCode" id="orgCode" value="${form.orgCode }" />
				<table class="form-table" width="100%" border="0" cellspa3cing="0" cellpadding="0">
				<colspan>
					<col class="w_30per" />
					<col class="w_60per" />
				</colspan>
				<thead>
					<tr>
						<th colspan="2" class="form-hd">
							菜品信息
						</th>
						<tr>
					</tr>
				</thead>
				<tbody>
					<tr>	
						<td class="hd" >
							菜品编号
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="foodNo"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							菜品名称
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="foodName"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							所属餐台
							<span class="field-tips">*</span>
						</td>
						<td >
							<input type="text" class="filter-text" id="platName" name="platName" readonly="readonly" value="${form.platName}"/>
							<!-- <button onclick="showOrgTree()">.</button> -->
							<input type="button" onclick="showOrgTree()"  value="." />
							<input type="hidden" id="platNo" name="platNo" value="${form.platNo}" />
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							菜品类别
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:select path="foodType" id="foodType"  items="${foodTypeMap}"  cssClass="input-select {required: true}"/> 
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							菜品单位
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:select path="weightUnit" id="weightUnit"  items="${weightUnitMap}" cssClass="input-select {required: true}"/> 
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							单价
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="priceUnit"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							最小销售重量
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="startWeight"  cssClass="input-text {required: true, maxlength: 20}"/>
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							启用标识
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:select path="useFlag"  items="${useFlagMap}"  cssClass="input-select {required: true}"/> 
						</td>
					</tr>
					<tr>	
						<td class="hd" >
							起售日期
							<span class="field-tips">*</span>
						</td>
						<td >
							<form:input path="startDate" cssClass="input-text {required: true, maxlength: 20}" 
								readonly="readonly"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" 
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
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
	        	//history.go(-1); 
	        	window.location.href = "<%=basePath %>tbasMenu/main.htm";
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
					
					// 设置类型和单位
					$.ajax({
						type: "POST",
						url: "<%=basePath%>tbasMenu/ajaxFoodType.htm",
						data: 
						{ 
							code:platNo
				        },
						dataType: 'json',
						success: function(data) 
						{
				             $("#foodType option").remove();//清空原来的选项
		
				             //$("#foodType").append("<option value='0'>选择城市</option>") ;
						     $.each(data,function(key,value)
							 { 
						    	 $("#foodType").append("<option value='"+key+"'> "+value+"</option>") ;
							 }); 
				        }
				  	})
					$.ajax({
						type: "POST",
						url: "<%=basePath%>tbasMenu/ajaxWeightUnit.htm",
						data: 
						{ 
							code:platNo
				        },
						dataType: 'json',
						success: function(data) 
						{
				             $("#weightUnit option").remove();//清空原来的选项
		
				             //$("#foodType").append("<option value='0'>选择城市</option>") ;
						     $.each(data,function(key,value)
							 { 
						    	 $("#weightUnit").append("<option value='"+key+"'> "+value+"</option>") ;
							 }); 
				        }
				  	})
					
					
					commonDialog.cancel();
				});
			}		    
		</script>
</body>
</html>