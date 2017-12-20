<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0055)http://booking.meizhuyun.com/Home/OrderPage/list?hotel= -->
<html lang="zh-cn" class="mdl-js"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
        <meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">
        <meta name="description" content="酒店和企业门禁管理系统，支持酒店员工管理,支持在线分配房卡，支持手机端操作，支持同时间对多家酒店或企业进行管理，让酒店和企业门禁管理快捷，安全，酒店管理更高效。">
        <meta name="keywords" content="锁掌柜，畅联科技，云钥匙，二维码锁，酒店门锁，门禁管理">
        <meta name="author" content="畅联科技 &lt;admin@hotelbrt.com&gt;">
        <meta name="renderer" content="webkit">
        <meta name="format-detection" content="telephone=no">
    
    
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    
    
    <title>我的订单</title>
    

    
        <!--Core CSS -->
        <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/ulite.min.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/common.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/iconfont.css">
    
    
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script type="text/javascript" src="/Public/jslib/html5shiv/3.7.2/html5shiv.min.js" ></script>
        <script type="text/javascript" src="/Public/jslib/respond.js/1.4.2/respond.min.js" ></script>
        <![endif]-->
    
    <link rel="apple-touch-icon" href="http://booking.meizhuyun.com/Public/uclbrt/image/favicon-apple.png?rev=2">
    <link rel="shortcut icon" href="http://booking.meizhuyun.com/Public/uclbrt/image/favicon.ico?rev=2">
    
    <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/list.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/toastr.min.css">

</head>

<body class="" style="height: 1076px;">
    
    <div id="doc" class="container">
        <div id="doc-header" class="navbar navbar-fixed-top" style="background: #F5F5F5;">
            <div class="tabs-tab-order">
                <div class="col-xs-6 tabs-order active" data="valid">当前</div>
                <div class="col-xs-6 tabs-order before" data="invalid">历史</div>
            </div>
            <!--<a href="/Home/UserPage/index" class="pull-left navbar-icon"><span class="iconfont icon-chevronleft"></span></a>
            <a id="order-list-toggle" class="pull-right navbar-icon"><span class="iconfont history-icon"></span></a>-->
        </div>
        <div id="doc-body">
            <div id="order-valid" class=""><a class="horizontal-card horizontal-padding-sm bottom-divider" href="http://booking.meizhuyun.com/Home/OrderPage/index?hotel=&amp;no=MZ162859">
            <div class="fixed-left-container vertical-padding">
                <div class="fixed-left">
                    <div class="order-cover background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20170210/589d262b94c67.jpeg" style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20170210/589d262b94c67.jpeg&quot;);"></div>
                    <div class="order-status text-sm typo-text-white-deep">已支付</div>
                </div>
                <div class="horizontal-padding-sm">
                    <div class="nowrap-content typo-text-black-deep order-hotel-name">深圳市桐林酒店</div>
                    <div class="nowrap-content text-sm typo-text-white-light"><span class="order-room-type">单人间</span> - <span class="order-room-name">403G</span></div>
                    <div class="nowrap-content text-sm typo-text-white-light">订单号：<span class="order-number">MZ162859</span></div>
                    <div class="nowrap-content text-sm typo-text-black-light"><span class="order-checkin-date">2017-11-07</span><span class="to" style="margin: 0 4px;">至</span><span class="order-checkout-date">2017-11-08</span><span class="order-night" style="margin-left: 4px;">(1晚)</span></div>
                    <div class="nowrap-content text-sm typo-text-black-light">订单金额：<span class="text-money">￥<span class="order-price">0.02</span></span>
                    </div>
                </div>
            </div>
        </a></div>
            <div id="order-invalid" class="hidden">
        <div class="centeral-container vertical-middle-block">
            <div class="centeral-content vertical-middle-block-cell">
                <div class="col-xs-12 text-center typo-text-black-light" style="color: #333333;">没有查询到订单</div>
                <div class="col-xs-12 text-center">
                    <div class="order-refresh btn-sm btn-link">刷新</div>
                </div>
            </div>
        </div>
    </div>
        </div>
        <div id="doc-content" class="hidden">
    <div class="row vertical-margin">
        <div class="col-xs-12 nowrap-content text-sm text-center typo-text-black-light">您还未登录</div>
    </div>
    <div class="row vertical-margin">
        <a href="http://booking.meizhuyun.com/Home/PublicPage/login?hotel=" class="col-xs-8 col-xs-offset-2 btn-primary btn-raised">登录</a>
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

    <!--js 使用的tag模板-->
    <script type="text/html" id="templateOrderEmpty">
        <div class="centeral-container vertical-middle-block">
            <div class="centeral-content vertical-middle-block-cell">
                <div class="col-xs-12 text-center typo-text-black-light" style="color: #333333;">没有查询到订单</div>
                <div class="col-xs-12 text-center">
                    <div class="order-refresh btn-sm btn-link" >刷新</div>
                </div>
            </div>
        </div>
    </script>
    <script type="text/html" id="templateOrder">
        <a class="horizontal-card horizontal-padding-sm bottom-divider">
            <div class="fixed-left-container vertical-padding">
                <div class="fixed-left">
                    <div class="order-cover background-cover"></div>
                    <div class="order-status text-sm typo-text-white-deep"></div>
                </div>
                <div class="horizontal-padding-sm">
                    <div class="nowrap-content typo-text-black-deep order-hotel-name"></div>
                    <div class="nowrap-content text-sm typo-text-white-light"><span class="order-room-type"></span> - <span class="order-room-name"></span></div>
                    <div class="nowrap-content text-sm typo-text-white-light">订单号：<span class="order-number"></span></div>
                    <div class="nowrap-content text-sm typo-text-black-light"><span class="order-checkin-date"></span><span class="to" style="margin: 0 4px;">至</span><span class="order-checkout-date"></span><span class="order-night" style="margin-left: 4px;"></span></div>
                    <div class="nowrap-content text-sm typo-text-black-light">订单金额：<span class="text-money">￥<span class="order-price"></span></span>
                    </div>
                </div>
            </div>
        </a>
    </script>
    <script type="text/html" id="templateOrderInvalid">
        <a class="horizontal-card horizontal-padding-sm bottom-divider">
            <div class="fixed-left-container vertical-padding">
                <div class="fixed-left">
                    <div class="order-cover background-cover"></div>
                    <div class="order-status text-sm typo-text-black-light"></div>
                </div>
                <div class="horizontal-padding-sm">
                    <div class="nowrap-content typo-text-black-deep order-hotel-name"></div>
                    <div class="nowrap-content text-sm typo-text-white-light"><span class="order-room-type"></span> - <span class="order-room-name"></span></div>
                    <div class="nowrap-content text-sm typo-text-white-light">订单号：<span class="order-number"></span></div>
                    <div class="nowrap-content text-sm typo-text-black-light"><span class="order-checkin-date"></span><span class="to"style="margin: 0 4px;">至</span><span class="order-checkout-date"></span><span class="order-night" style="margin-left: 4px;"></span></div>
                    <div class="nowrap-content text-sm typo-text-black-light">订单金额：<span class="text-money">￥<span class="order-price"></span></span>
                    </div>
                </div>
            </div>
        </a>
    </script>

    
        <script type="text/javascript" src="<%=basePath %>wx/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>wx/js/jquery.cookie.js"></script>
        <script type="text/javascript" src="<%=basePath %>wx/js/ulite.min.js"></script>
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
    
    
    <script type="text/javascript" src="<%=basePath %>wx/js/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/toastr.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/list.js"></script>



</body></html>