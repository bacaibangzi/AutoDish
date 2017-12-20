<%@ page language="java" import="java.util.*,com.sc.room.pojo.Customer" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Customer customer = (Customer)request.getAttribute("customer");
%>
<!DOCTYPE html>
<html class="mdl-js" lang="zh-cn"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
        <meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">
        <meta name="renderer" content="webkit">
        <meta name="format-detection" content="telephone=no">
    
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    
    
    <title>个人中心</title>

    
        <!--Core CSS -->
        <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/ulite.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/common.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/iconfont.css">
    
    
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script type="text/javascript" src="/Public/jslib/html5shiv/3.7.2/html5shiv.min.js" ></script>
        <script type="text/javascript" src="/Public/jslib/respond.js/1.4.2/respond.min.js" ></script>
        <![endif]-->
    
    <link rel="apple-touch-icon" href="http://booking.meizhuyun.com/Public/uclbrt/image/favicon-apple.png?rev=2">
    <link rel="shortcut icon" href="http://booking.meizhuyun.com/Public/uclbrt/image/favicon.ico?rev=2">
    
    <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/toastr.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/mycenter.css">
    <style type="text/css">
    	.user-header{
    	    height: 78px;
    	    padding-top: 40px;
    	}
    	.header-top{
    	    text-align: center;
    	    font-size: 20px;
    	    height: 22px;
    	    line-height: 22px;
    	}
    	.header-bottom{
    	    color: #cb8600;
    	    text-align: center;
    	    margin-top: 10px;
    	    font-size:13px ;
    	}
    </style>

</head>

<body style="height: 731px;">
    
    <div id="doc" class="container">
        <!--<div id="doc-header" class="navbar">
            <a href="/Home/BookPage/index?hotel=8" class="pull-left navbar-icon"><span class="iconfont icon-chevronleft"></span></a>
            <div class="navbar-title typo-text-white-deep">个人中心</div>
        </div>-->
        <div id="doc-body">    
            <div class="user-header">
            	<div class="header-top">
            		<span>个人中心</span>
            	</div>
                <div class="header-bottom">
                    <span>
                    <%
                    	if("-1".equals(customer.getState())){
                    		out.println("请先绑定身份信息");
                    	}else if("0".equals(customer.getState())){
                    		out.println("正在审核身份信息");
                    	}else if("1".equals(customer.getState())){
                    		out.println("身份信息审核通过");
                    	}
                    %>
                    </span><span class="totalCharity"></span>
                </div>
            </div>
            <div class="horizontal-padding-sm bottom-divider top-divider vertical-padding">
                <div class="vertical-padding has-icon-line">
                    <span class="photo-one-icon1"></span>
                    <div class="typo-text-black-deep">姓名</div>
                    <%
	                    if("-1".equals(customer.getState())){
	                		out.println("<div class='unBindIdCard hidden'>点击绑定</div>");
	                	}else{
	                		out.println("<div class='user-num' style='position: absolute;right: 8px;top: 50%;margin-top: -12px;'>"+customer.getName()+"</div>");
	                	}
                    %>
                    
                    
                </div>
            </div>
            <div class="horizontal-padding-sm bottom-divider top-divider vertical-padding">
                <div class="vertical-padding has-icon-line">
                    <span class="photo-one-icon"></span>
                    <div class="typo-text-black-deep">手机号</div>
<!--                    <div class="user-name" style="display: inline-block;">崔斌</div>-->
                    <div class="user-num" style="position: absolute;right: 8px;top: 50%;margin-top: -12px;">+86 <%=customer.getTel() %></div>
                </div>
            </div>
            <div class="horizontal-padding-sm bottom-divider vertical-padding parent-idCard-one-icon">
                <div class="vertical-padding has-icon-line icon-line-both idCard-one-icon">
                    <span></span>
                    <div class="typo-text-black-deep">身份证信息</div>
                    
                    <%
	                    if("-1".equals(customer.getState())){
	                		//out.println("<div class='bangDingCard '>未绑定</div>");
	                	}else{
	                		out.println("<div class='bangDingCard '>已绑定</div>");
	                	}
                    %>
                </div>
            </div>
            <!--  
            <a href="#" class="horizontal-padding-sm bottom-divider vertical-padding">
                <div class="vertical-padding has-icon-line icon-line-both ">
                    <span class="order-one-icon"></span>
                    <div class="typo-text-black-deep">我的订单</div>
                    <div class="enter"></div> -->
                    <!--<span class="iconfont icon-chevronright icon-line-right typo-text-black-light"></span>-->
            <!--     </div>
            </a>
            -->
            <a href="#" onclick="gotoKey('<%=customer.getSn() %>')" class="horizontal-padding-sm  vertical-padding">
                <div class="vertical-padding has-icon-line icon-line-both">
                    <span class="key-one-icon"></span>
                    <div class="typo-text-black-deep">我的钥匙</div>
                    <div class="enter"></div>
                    <!--<span class="iconfont icon-chevronright icon-line-right typo-text-black-light"></span>-->
                </div>
            </a>
        </div>
        <div class="top-divider" style="height: 1px;width: 100%; "></div>
        <div class="align-parent-bottom">
            <a class="btn-link" href="javascript:tuichu();" >退出</a>
        </div>
    </div>
    <div class="modal" id="idCardModal">
    <div class="vertical-middle-block container">
        <div class="modal-dialog modal-sm vertical-middle-block-cell modal-relative">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="header-title">身份证信息</div>
                    <div class="header-reset">重新提交</div>
                </div>
                <div class="modal-body">
                    <div class="vertical-padding horizontal-padding bottom-divider clearfix">
                        <div class="col-xs-3 col-without-padding">姓名</div>
                        <div class="col-xs-6 nowrap-content"></div>
                        <div class="col-xs-3 nowrap-content padding-content"><span class="idCard-name">李敏</span></div>
                    </div>  
                    <div class="vertical-padding horizontal-padding bottom-divider clearfix">
                        <div class="col-xs-3 col-without-padding">性别</div>
                        <div class="col-xs-6 nowrap-content"></div>
                        <div class="col-xs-3 nowrap-content padding-content"><span class="idCard-sex">男</span></div>
                    </div> 
                    <div class="vertical-padding horizontal-padding bottom-divider clearfix">
                        <div class="col-xs-3 col-without-padding">民族</div>
                        <div class="col-xs-6 nowrap-content"></div>
                        <div class="col-xs-3 nowrap-content padding-content"><span class="idCard-nation">汉族</span></div>
                    </div> 
                    <div class="vertical-padding horizontal-padding bottom-divider clearfix">
                        <div class="col-xs-3 col-without-padding">身份证号</div>
                        <div class="col-xs-2 nowrap-content"></div>
                        <div class="col-xs-7 nowrap-content padding-content"><span class="idCard-num">320981198209010789</span></div>
                    </div> 
                    <div class="vertical-padding horizontal-padding bottom-divider clearfix">
                        <div class="col-xs-2 col-without-padding">住址</div>
                        <div class="col-xs-10 nowrap-content padding-content"><span class="idCard-address">南京玄武区xxxxxx</span></div>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="idCardChangeModal">
    <div class="vertical-middle-block container">
        <div class="modal-dialog modal-sm vertical-middle-block-cell modal-relative">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="header-title">身份证信息</div>
                    <div class="header-cancel">取消</div>
                </div>
                <div class="modal-body">
                    <form id="uploadForm"> 
                        <div class="camera-container" data-value="1">
                            <div class="add-photo hidden"></div>  
                            <div class="get-photo">
                                <div class="camera-border"></div>
                                <div class="camera-tip">身份证人像面</div>
                                <input node-type="qr-btn" name="face" value="" accept="image/*" style="height: 100%;width: 100%;opacity: 0;" type="file">                        	
                            </div>                      
                        </div>
                        <div class="camera-container" data-value="2">
                            <div class="add-photo hidden"></div> 
                            <div class="get-photo">
                                <div class="camera-border"></div>
                                <div class="camera-tip">身份证国徽面</div>
                                <input node-type="qr-btn" name="back" id="" value="" accept="image/*" style="height: 100%;width: 100%;opacity: 0;" type="file">
                            </div>
                        </div>
                        <div class="tip-container">请保持拍照时环境光亮度，身份证照片尽可能清晰且铺面全屏。目前仅支持中华人民共和国身份证。</div>
                        <div class="edit-box"> 
                            <input class="edit-container" id="submitEditIdCard" value="提交" type="button">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>  
<div class="modal" id="confirmationModal">
    <div class="vertical-middle-block container">
        <div class="modal-dialog modal-sm vertical-middle-block-cell modal-relative">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="confirmation-back">上一步</div>
                    <div class="header-title">身份证信息</div>
                    <div class="confirmation-cancel">取消</div>
                </div>
                <div class="modal-body">
                    <div class="vertical-padding horizontal-padding bottom-divider clearfix">
                        <div class="col-xs-3 col-without-padding">姓名</div>
                        <div class="col-xs-6 nowrap-content"></div>
                        <div class="col-xs-3 nowrap-content padding-content"><span class="idCard-name"></span></div>
                    </div>  
                    <div class="vertical-padding horizontal-padding bottom-divider clearfix">
                        <div class="col-xs-3 col-without-padding">性别</div>
                        <div class="col-xs-6 nowrap-content"></div>
                        <div class="col-xs-3 nowrap-content padding-content"><span class="idCard-sex"></span></div>
                    </div> 
                    <div class="vertical-padding horizontal-padding bottom-divider clearfix">
                        <div class="col-xs-3 col-without-padding">民族</div>
                        <div class="col-xs-6 nowrap-content"></div>
                        <div class="col-xs-3 nowrap-content padding-content"><span class="idCard-nation"></span></div>
                    </div> 
                    <div class="vertical-padding horizontal-padding bottom-divider clearfix">
                        <div class="col-xs-3 col-without-padding">身份证号</div>
                        <div class="col-xs-2 nowrap-content"></div>
                        <div class="col-xs-7 nowrap-content padding-content"><span class="idCard-num"></span></div>
                    </div> 
                    <div class="vertical-padding horizontal-padding bottom-divider clearfix">
                        <div class="col-xs-2 col-without-padding">住址</div>
                        <div class="col-xs-10 nowrap-content padding-content"><span class="idCard-address"></span></div>
                    </div>           
                    <div class="submitConfir-box"> 
                        <div class="edit-container" id="submitConfirmation">提交</div>
                    </div>              
                </div>
            </div>
        </div>
    </div>
</div>  
<div class="modal" id="bindMobileModal">
    <div class="vertical-middle-block container">
        <div class="modal-dialog modal-sm vertical-middle-block-cell modal-relative">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="header-title">绑定用户</div>
                </div>
                <div class="modal-body">
                    <form onkeydown="if(event.keyCode==13){return false;}" id="login-container" class="form-horizontal form-sm horizontal-padding vertical-margin">
                    	<div class="form-group">
                            <label class="col-xs-1 control-label"><span class="icon-name"></span></label>
                            <div class="col-xs-11 has-action">
                                <input id="requestName" data-tip-object="#login-tip" maxlength="11" class="form-control input-action-clear" placeholder="请输入姓名" type="text">
                            </div>
                        </div>
                    	<div class="form-group">
                            <label class="col-xs-1 control-label"><span class="icon-sfz"></span></label>
                            <div class="col-xs-11 has-action">
                                <input id="requestSfCode" data-tip-object="#login-tip" maxlength="18" class="form-control input-action-clear" placeholder="身份证号码" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-1 control-label"><span class="icon-phones"></span></label>
                            <div class="col-xs-11 has-action">
                                
                               	<!-- <span class="input-action-trigger input-trigger-clear iconfont icon-close hidden"></span>-->
                                <input id="requestMobile" data-tip-object="#login-tip" maxlength="11" class="form-control input-action-clear" placeholder="请输入手机号" type="text">
                            </div>
                        </div>
                        <div class="form-group" style="margin-bottom: 24px;">
                            <label class="col-xs-1 control-label"><span class="icon-yanzheng"></span></label>
                            <div class="col-xs-5 input-btn-group has-action">
                                <!-- <span class="input-action-trigger input-trigger-clear iconfont icon-close hidden"></span>-->
                                <input id="requestMobileCode" data-tip-object="#login-tip" maxlength="4" autocomplete="off" class="form-control input-action-clear" placeholder="短信验证码" type="text">
                            </div>
                            <div class="col-xs-6 input-group-right text-right" style="padding: 0;">
                                <div id="sendAgain" data-tip-object="#login-tip" class="btn btn-accent btn-raised ulite-js-btn ulite-js-ripple-effect input-btn-group-btn" data-upgraded=",MaterialButton,MaterialRipple"><span class="displayTime"></span>获取验证码<span class="btn-ripple-container"><span class="ripple"></span></span></div>
                            </div>
                        </div>
                        <div class="form-group form-group-tip" style="height: auto;">
                            <div id="login-tip" class="help-block text-center">
                            </div>
                        </div>
                        <div class="row vertical-margin group-submit">
                            <button id="requestSubmit" type="button" data-tip-object="#login-tip" class="col-xs-12  btn-primary btn-raised " disabled="disabled" style="color: #fff;">确认</button>
                        </div>
                    </form>             
                </div>
            </div>
        </div>
    </div>
</div>  
    <div id="loadingContainer" class="hidden">
    <div id="loading">
        <div class="cssload-loader">
            <div class="cssload-inner cssload-one"></div>
            <div class="cssload-inner cssload-two"></div>
            <div class="cssload-inner cssload-three"></div>
        </div>
    </div>
</div>

    <canvas class="hidden">

    
        <script type="text/javascript" src="<%=basePath %>wx/js/jquery_002.js"></script>
        <script type="text/javascript" src="<%=basePath %>wx/js/jquery.js"></script>
        <script type="text/javascript" src="<%=basePath %>wx/js/ulite.js"></script>
        <!--[if lt IE 10]>
        <script type="text/javascript" src="/Public/jslib/placeholder/2.3.1/jquery.placeholder.min.js" ></script>
        <script type="text/javascript" >
            $(function(){
                $('input, textarea').placeholder();
            });
        </script>
        <![endif]-->
        <script type="text/javascript" src="<%=basePath %>wx/js/common.js"></script>
        <script type="text/javascript" src="<%=basePath %>wx/js/common_zh_cn.js"></script>
        <!--    
  		-->
    
    <script type="text/javascript" src="<%=basePath %>wx/js/toastr.js"></script>
    
    <!--  
    <script type="text/javascript" src="<%=basePath %>wx/js/index2.js"></script>
	-->
	
	<script>
		$(".unBindIdCard").removeClass("hidden");
		$(".bindIdCardNum").addClass("hidden");
		
		$(".unBindIdCard").on("click",function(){
			 $("#idCardModal").modal("hide"),
		        i.modal("show");
		})
	
		var i = $("#bindMobileModal");
		$("#idCardModal").on("click", ".header-reset",
			function() {alert();
		        $("#idCardModal").modal("hide"),
		        i.modal("show");
		})
	
	 	$("#bindMobileModal").bind("input propertychange",
	    function() {
	        var e = $("#requestMobile").val(),
	        d = $("#requestMobileCode").val();
	        e && d ? $("#requestSubmit").attr("disabled", !1) : $("#requestSubmit").attr("disabled", !0)
	    })		
		
	    
	    function tuichu(){
			WeixinJSBridge.call('closeWindow');
		}
	    //toastr.error("test");
		
		function gotoKey(sn){
			if(sn=='null'){
				toastr.error("请先绑定身份信息");
			}else{

				$.ajax({
					type: "POST", 
					url: "<%=basePath %>wx/getSn-weixin",
					data: "entityId="+sn,
					beforeSend: function(){
		               //window.parent.showInfo(); 
		            },
					success: function(state){
						if(state=='1'){
							location = "<%=basePath %>wx/rqCode-weixin";
						}else if(state=='0'){
							toastr.info("请等待身份信息审核");
						}else{
							toastr.error("请先绑定身份信息");
						}
					}
				});
				
			}
			
			
		}
		
		
		$("#sendAgain").on("click",function(){
			var telephone = $("#requestMobile").val();
			if ($("#requestMobile").val() == "") { 
				toastr.error("请输入正确手机号码");
				return;
			}
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
			if (!myreg.test($("#requestMobile").val())) { 
				toastr.error("请输入正确手机号码");
				return;
			}
			$.ajax({
				type: "POST", 
				url: "<%=basePath %>wx/sendSms-weixin",
				data: "telephone="+telephone,
				beforeSend: function(){
	               //window.parent.showInfo(); 
	            },
				success: function(msg){
					toastr.success("已发送验证码");
				}
			});			
		});
		
		
		$("#requestSubmit").on("click",function(){
			var requestName = $("#requestName").val();
			var requestSfCode = $("#requestSfCode").val();
			var requestMobile = $("#requestMobile").val();
			var requestMobileCode = $("#requestMobileCode").val();
			if(requestName==""){
				toastr.error("请输入姓名");
				return;
			}
			if(requestSfCode==""){
				toastr.error("请输入身份证号码");
				return;
			}
			if(requestMobile==""){
				toastr.error("请输入手机号码");
				return;
			}
			$.ajax({
				type: "POST", 
				url: "<%=basePath %>wx/save-weixin",
				data: "name="+requestName+"&sfz="+requestSfCode+"&tel="+requestMobile+"&openid=${vo.openid}&code="+requestMobileCode,
				beforeSend: function(){
	               //window.parent.showInfo(); 
	            },
				success: function(msg){
					//alert(msg);
					//alert(msg=='sfz');
					//toastr.success("申请成功");
					if(msg=='yzm'){
						toastr.error("验证码错误");
						return;
					}if(msg=='sfz'){
						toastr.error("该身份证已经被注册");
						return;
					}if(msg=='tel'){
						toastr.error("该手机号码已经被注册");
						return;
					}else{
						toastr.success("申请成功");
						 location.reload() ;
					}
				}
			});
			
		});
		
	</script>


</canvas></body></html>