<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>

<head>
	<link type="text/css" href="<%=basePath %>common/css/all.css" rel="stylesheet" />
	<!-- jquery plugin -->	
	<script type="text/javascript" src="<%=basePath %>common/js/jquery-1.7.2.min.js"></script>
	<!-- dialog 相关js -->
	<script type="text/javascript" src="<%=basePath %>common/js/lhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>common/js/fh.dialog.js"></script>			
	<script type="text/javascript" src="<%=basePath %>common/js/common.js"></script>
	<!-- 操作相关js -->
	<script type="text/javascript" src="<%=basePath %>common/js/commonoperate.js"></script>

		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<link href="<%=basePath %>common/js/tree/js/tree.css" type="text/css" rel="stylesheet"/>
		<link href="<%=basePath %>common/js/tree/js/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
</head>
<body oncontextmenu="return false;">
	<div class="contenbox">
    	<div class="grid_summay_opts" id="btns">
				<div class="left_opts">
					选择食堂
				</div>
			</div>
    		<div style="background:#AAAAAA;height:1px;margin-top:5px;margin-bottom:5px"></div>
    		<div id="bigTreeDiv"  ></div>
    </div>
	<div id="bigTreeDiv"></div>
	<input type="hidden" id="areaCode" name="orgCode" />
	<input type="hidden" id="areaName" name="orgName" />
	<script type="text/javascript" src="<%=basePath %>common/js/ln.cookies.config.js"></script>
	<script type="text/javascript" src="<%=basePath %>common/js/tree/js/tree.js"></script>
	<script type="text/javascript" src="<%=basePath %>common/js/tree/js/jquery.contextMenu.js"></script>
    <script language="javascript" type="text/javascript">
    	document.body.style.backgroundColor="white";
		var orgData = ${nodeList};
		$(document).ready(function(){
				var o = {
					cbiconpath: '<%=path%>/common/js/tree/images/tree/',
					title:'组织机构信息',	
					showcheckbox : true,
					showcheck : true,
					cascadecheck : true,
					oncheckboxclick : false,
					theme : "bbit-tree-lines",
					isShowBase:false,
					contextMenu:false,
					cookieName:"bigTree",
					onnodeclick:function(org){
						//document.getElementById('orgCode').value = org.code;
						//document.getElementById('orgName').value = org.text;
					},
					onaftercheckboxclick:function(org){
						/*
						var code = document.getElementById('orgCode').value;
						var name = document.getElementById('orgName').value;
						if(org.checkstate==1){
							document.getElementById('orgCode').value = code+org.code+",";
							document.getElementById('orgName').value = name+org.name+",";
						}else{
							document.getElementById('orgCode').value = code.replace(org.code+",","");
							document.getElementById('orgName').value = name.replace(org.name+",","");
						}*/ 
						
						selectedIds ="";
						selectedNames = "";
						getAll($("#bigTreeDiv")[0].t.getAllTreeNodes());
						
						document.getElementById('orgCode').value = selectedIds;
						document.getElementById('orgName').value = selectedNames;
						 
						//alert(selectedIds+"---"+selectedNames);
						
						//alert(window.parent["group_info"].location);
						window.parent["group_info"].location = "<%=basePath%>caipxfmx/terminalTree.htm?orgCode=${sessionScope.accountInfo.orgCode}&code="+selectedIds+"&code1=${vo.code1}";
					},
					data: orgData
				}; 
				init(o);
				$("#bigTreeDiv").treeview(o);	//alert($("#bigTreeDiv").treeview(o));
				
				
				var selectedIds ="";
				var selectedNames = "";
				function getAll(selectedIdArray){
					for(var i=0;i<selectedIdArray.length;i++){
						try{
							if(selectedIdArray[i].checkstate==1){
								selectedIds+=selectedIdArray[i].code+",";
								selectedNames+=selectedIdArray[i].text+",";
							}
							getAll(selectedIdArray[i].ChildNodes);
						}catch(e){
							alert(e);
						}
					}
				}
				
			//bindTree();
			});

		
    </script>
</body>
</html>


