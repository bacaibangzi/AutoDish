<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">		
	<title>智慧餐饮平台 -登录</title>	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>dev/idx/css/style.css" />
	<script type="text/javascript" src="<%=basePath%>dev/idx/js/jquery-1.9.1.js"></script>
</head>
<body>
<div class="authcenter-head">
        <div class="container fn-clear">
            <ul class="container-left">
                <li class="container-left-item container-left-first">
                    <a href="<%=basePath%>index.htm" class="on" seed="authcenter-mobile">智慧餐饮平台</a>
                </li>
            </ul>
            <ul class="container-right">
            	<!-- 
                <li class="container-right-item"><a href="<%=basePath%>index.htm" title="返回首页">返回首页</a></li>
                <li class="container-seperator"></li>
                <li class="container-right-item"><a href="<%=basePath%>ext.htm" title="扩展应用商城">扩展应用商城</a></li>
                <li class="container-seperator"></li>
                --> 
                <li class="container-right-item container-right-last"><a href="<%=basePath%>toLogin.htm" title="智慧餐饮平台">帮助</a></li>
            </ul>
        </div>
    </div>
<div id="header">
	<div class="wrap">
		<div class="logo">
			<a href="<%=basePath%>index.htm">
				<img src="<%=basePath%>dev/idx/images/new_logo.png" alt="智慧餐饮平台" title="智慧餐饮平台">
			</a>
		</div>
	</div>
</div>
<div class="login-wrap">
	<div class="wrap clearfix">
		<div class="form-box fr loginV2"  style="display:block;">
			<ul class="form-tab clearfix">
				<li class="tab-li cur"><a href="javascript:;">账号登录</a></li>
			</ul>
			<div class="form-con">
				<div class="login-normal" style="display:block;">
					<form id="nameLoginForm" method="post" onsubmit="return nameLoginCheck();">
						<div class="form-error" style=""><i></i><label class="text"></label></div>
						<dl class="clearfix">
							<dt>账户名：</dt>
							<dd><input type="text" name="loginName" id="normalUser" class="input-text"/><span class="placeholder">用户名/邮箱/手机号</span></dd>
						</dl>
						<dl class="top1 clearfix">
							<dt>密<em></em>码：</dt>
							<dd><input type="password" name="password" id="normalPassword" class="input-text"><span class="placeholder">请输入密码</span></dd>
						</dl>
						<!--  
						<dl class="top2 clearfix">
							<dt>验证码：</dt>
							<dd>
								<input name="smsCaptcha" type="text" id="partnerYzm" class="input-yzm" onblur="captchCheck(this);" maxlength="4" autocomplete="off"/>
								<span class="span-yzm">
									<img id="smsCaptchaImage" src="<%=basePath%>dev/idx/images/code.jpg" title="点击图片刷新校验码" alt="点击图片刷新校验码" onclick="changeCode('smsCaptchaImage','partnerYzm');"/>
									<a href="javascript:changeCode('smsCaptchaImage','partnerYzm');" class="forget-pass">换一张</a>
								</span>
							</dd>
						</dl>
						-->
						<div class="form-remember">							
							<input name="rememberName" type="checkbox" id="remUser" class="rem-check" style="display:none;" checked="checked">
							<span class="rem-box rem-box-r memCheck"><input name="rememberMe" type="checkbox" id="remLogin" class="rem-check">记住用户名密码</span> 
						</div>
						<div class="btn-box clearfix">
							<input id="normalSubmit" class="btn-settlement" type="button" onclick="login()" value="登    录">						
						</div>
						<!-- 
						<div class="link-box clearfix">
                            <a href="javascript:;" class="register">新用户注册</a>
                            <a href="<%=basePath %>customerReg.htm" class="forget-pass">新用户注册</a>
                        </div>
                         -->
					</form>
				</div>
			</div>
		</div>
			
	</div>
</div>
<div id="footer">
    <div class="footer_info">        
        <p>
            	智慧餐饮平台 版权所有Copyright 2017 All rights reserved
        </p>
    </div>
</div>
</body>
</html>
	<script type="text/javascript" src="<%=basePath %>common/layer/layer.js"></script>
<script type="text/javascript">



function nameLoginCheck(){
	var loginName = $("#nameLoginForm").find("#normalUser").eq(0).val();
	var password = $("#nameLoginForm").find("#normalPassword").eq(0).val();
	if($(".tips ").is(":visible")){
		return false;
	}
	if(loginName == null  || loginName == ""){
		showError("请输入用户名");
		return false;
	}
	if(password == null  || password == ""){
		showError("请输入密码");
		return false;
	}
	if($("#normalYzm")  && $("#nameLoginForm").find("#normalYzm").length > 0 ){
		if($("#normalYzm").val() == "" || $("#normalYzm").val() == null){
			showError("请输入验证码");
			return false;
		}
	}
	return true;
}

$(function(){
	$(".form-tab li").on("click",function(){
		var index = $(this).index();
		$(this).addClass("cur").siblings().removeClass("cur");
		$(".form-con>div").hide().eq(index).show();
		if(index == 0){
            $(".form-foot").hide();
            initQrCodeComponent();
        }else{
            $(".form-foot").show();
            clearInterval(getQrCodeStatusTimer);
            getQrCodeStatusTimer = null;
            clearInterval(getQrCodeTimer);
            getQrCodeTimer = null;
        }
		$(".form-error").hide();
	});
	$(".input-text").focus(function(){
		$(this).siblings(".placeholder").hide();
	}).blur(function(){
		if(this.value=="")
		$(this).siblings(".placeholder").show();
	});
	$(".placeholder").on("click",function(){
		$(this).siblings(".input-text").focus();
	});
	$(".rem-check").each(function(){
		if(this.checked){
			$(this).parent().addClass("memCheck");
		}else{
			$(this).parent().removeClass("memCheck");
		}
	});
	$(".rem-box").on("click",function(){
		var val = $(this).children(".rem-check").attr("checked");
		if(val){
			$(this).children(".rem-check").attr("checked",false);
			$(this).removeClass("memCheck");
		}else{
			$(this).children(".rem-check").attr("checked",true);
			$(this).addClass("memCheck");
		}
	});
});

//开启错误提示
function showError(error){
	$(".form-error").find("label").html(error);
	$(".form-error").show();
}

function login(){
	var dlmc = $("#normalUser").val();
	var mm1 = $("#normalPassword").val();
	
	if(dlmc == null  || dlmc == ""){
		showError("请输入用户名");
		return false;
	}
	if(mm1 == null  || mm1 == ""){
		showError("请输入密码");
		return false;
	}

	layer.load();
	jQuery.ajax({
		url:'<%=basePath %>j_spring_security_check',
		type:'post',
		async: false,
		//data:'dlmc='+dlmc+"&mm="+mm1,
		data: "ajaxTag=ajaxTag&j_username=" + dlmc + "&j_password=" + mm1 + "&r=1",
		success:function(data){
			//alert(data.success);
			if (data.success=='true'){
				layer.msg('登录成功', {icon: 6});
				window.location = "<%=basePath %>main.htm"; 
			}else{
				layer.msg('用户密码错误', {icon: 6});
			}
			
			layer.closeAll('loading');
		}
	});
}

</script>
