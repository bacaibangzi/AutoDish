<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String hotel = (String)request.getAttribute("hotel");

%>
<!DOCTYPE html>
<!-- saved from url=(0056)http://booking.meizhuyun.com/Home/BookPage/index?hotel=8 -->
<html lang="zh-cn" class="mdl-js"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
        <meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">
        <meta name="renderer" content="webkit">
        <meta name="format-detection" content="telephone=no">
    
    
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    
    
    <title class="navbar-title typo-text-white-deep">智能家居体验酒店</title>

    
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
    
    <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/index.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/toastr.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>wx/css/daterangepicker.mobile.min.css">
    <link rel="stylesheet" href="<%=basePath %>wx/css/bootstrap-datepicker3.min.css">

</head>

<body class="" style="height: 1076px;">
    
    <div id="doc" class="container" data-start="2017-11-10">
               
        <div id="doc-header" class="navbar navbar-fixed-top" "="">
            <a href="<%=basePath %>wx/myCenter-weixin" class="pull-right navbar-icon"><span class="individual-right"></span></a>
        </div>
        <div id="doc-body">
            <div id="hotel-panel-carousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#hotel-panel-carousel" data-slide-to="0" class="active"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <div class="inner-item" data-original="<%=basePath %>wx/images/1.jpg" style="display: block; background-image: url(<%=basePath %>wx/images/1.jpg);"></div>
                    </div>
                    <div class="item">
                        <div class="inner-item" data-original="<%=basePath %>wx/images/4.jpg" style="display: block; background-image: url(<%=basePath %>wx/images/4.jpg);"></div>
                    </div>
                </div>
                <div class="carousel-caption nowrap-content">智能家居体验酒店</div>
            </div>
            <div class="tabs ulite-js-tabs ulite-js-ripple-effect ulite-js-ripple-effect--ignore-events is-upgraded" data-upgraded=",MaterialTabs,MaterialRipple">
                <div class="tabs-tab-bar">
                    <a href="<%=basePath %>wx/index-weixin?hotel=hotel" class="col-xs-6 tabs-tab" id="hotel-show">酒店简介<span class="tabs-ripple-container ulite-js-ripple-effect" data-upgraded=",MaterialRipple"><span class="ripple is-animating" style="width: 509.007px; height: 509.007px; transform: translate(-50%, -50%) translate(154px, 21px);"></span></span></a>
                    <a href="<%=basePath %>wx/index-weixin?hotel=room" class="col-xs-6 tabs-tab" id="room-show">我要订房<span class="tabs-ripple-container ulite-js-ripple-effect" data-upgraded=",MaterialRipple"><span class="ripple is-animating" style="width: 509.007px; height: 509.007px; transform: translate(-50%, -50%) translate(60px, 16px);"></span></span></a>
                </div>
                <div class="tabs-panel" id="hotel-panel">
                    <div class="content-outside-title"><span class="title-before"></span>酒店信息</div>
                    <div class="content-panel">
                        <div class="content-panel-body clearfix">
                            <div class="hotel-more-info ">
                                <!-- 
                                <div class="vertical-margin nowrap-content">前台：<span class="hotel-panel-telephone">400-2233</span></div>
                                <div class="vertical-margin nowrap-content">微信：<span class="hotel-panel-wechat">2233</span></div>
                                <div class="vertical-margin nowrap-content complaint-hidden">投诉：<span class="hotel-panel-complaint">400-2233</span></div>
                                <div class="vertical-margin">简介：<span class="hotel-panel-desc">桐林酒店位于深圳市盐田区沙头角海山路99号(梧桐山公园门前),被风景秀丽的天然氧吧梧桐山公园紧紧的拥抱,处于深圳市盐田区行政、文化、商业区域的中心地带,与世界第二大港口之盐田港隔港相望, 与知名的中英街/大小梅沙渡假胜地近在眼前,酒店拥有98套独具特色的豪华花园套房,并附设有西餐厅大堂吧、商务中心、小会议厅</span></div>
                            	-->
                            </div>
                            <div class="vertical-margin nowrap-content">电话：<span class="hotel-panel-mobile">+86&nbsp;18100615525</span></div>
                            <div>
                                <div style="float: left;">地址：</div>
                                <div style="margin-left: 43px;padding-right: 0;" class="vertical-margin icon-line-right"><span class="hotel-panel-address">南京玄武区xxxxxx</span>
                                    <a class="text-primary hotel-panel-map" href="http://booking.meizhuyun.com/Home/BookPage/map.html?hotel=8&amp;name=%E6%B7%B1%E5%9C%B3%E5%B8%82%E6%A1%90%E6%9E%97%E9%85%92%E5%BA%97&amp;address=%E5%B9%BF%E4%B8%9C%20%E6%B7%B1%E5%9C%B3%20%E7%9B%90%E7%94%B0%E5%8C%BA%20%E6%B2%99%E5%A4%B4%E8%A7%92%E6%B5%B7%E5%B1%B1%E8%B7%AF%E6%A1%90%E6%9E%97%E8%8A%B1%E5%9B%AD1%E5%BA%A7&amp;longitude=114.241096&amp;latitude=22.566421"></a>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                            
                            <div class="hotel-more-info-trigger text-center">
                                <span class="iconfont"></span>
                            </div>
                        </div>
                    </div>
                    <div class="content-outside-title"><span class="title-before"></span>酒店简介</div>
                    <div class="content-panel">
                        <div class="content-panel-body clearfix" id="hotel-panel-special-container">
                            <div class="hotel-panel-special" style="text-indent: 30px;margin-bottom: 12px;">智能家居体验酒店是桐林投资旗下高端品牌酒店，位于南京玄武区xxxxxx，总建筑面积达7000多平方米。</div>
                            <div class="hotel-panel-special-img background-cover" data-original="<%=basePath %>wx/images/t9.jpg" style="display: block; background-image: url(<%=basePath %>wx/images/t9.jpg);"></div>
                            <!-- <div class="vertical-margin" style="overflow: hidden;margin-bottom: 4px;"><a class="more-zhangGui-info" href="http://booking.meizhuyun.com/Home/BookPage/shopkeeper?hotel=8">阅读全文</a></div> -->
                        </div>
                    </div>
                    <div class="content-outside-title"><span class="title-before"></span>酒店标签</div>
                    <div class="content-panel">
                        <div class="content-panel-body clearfix content-panel-body-full" style="padding: 0 16px;">
                            <div class="hotel-panel-tag-container" style="overflow: hidden;"><div class="hotel-panel-tag nowrap-content">优美</div><div class="hotel-panel-tag nowrap-content">风景区</div></div>
                        </div>
                    </div>
                    <div class="content-outside-title"><span class="title-before"></span>设施信息</div>
                    <div class="content-panel" style="border-bottom: 0;">
                        <div class="content-panel-body">
                            <div class="hotel-panel-tag-container" style="overflow: hidden;">
                            	<div class="hotel-panel-tag nowrap-content">早餐供应</div>
                            	<div class="hotel-panel-tag nowrap-content">免费Wifi</div>
                            	<div class="hotel-panel-tag nowrap-content">停车场</div>
                            	<div class="hotel-panel-tag nowrap-content">购物中心</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tabs-panel " id="room-panel">
                    <div style="height: 42px;margin-top: 6px;">
                        <div class="content-outside-title" style="float: left;padding-right: 0;"><span class="title-before"></span>预订时间</div>
                        <div id="choose-room-btn" class="btn-group dropdown">
                            <a data-toggle="dropdown" class="btn-sm typo-text-black-deep" href="javascript:void(0);" aria-expanded="false"><span class="text-value">间夜房</span>&nbsp;<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li id="jianyefang" class="button-click"><a href="javascript:void(0)">间夜房</a></li>
                                <!--  
                                <li id="zhongdianfang" class=""><a href="javascript:void(0)">钟点房</a></li>
                                <li id="changzufang" class=""><a href="javascript:void(0)">长租房</a></li>
                                -->
                            </ul>
                        </div>                            
                    </div>
                    <div class="normal-room">
                        <div class="content-panel room-panel-date-picker" style="border-bottom: none;">
                            <div class="content-panel-body clearfix">
                                <div class="vertical-margin nowrap-content has-icon-line"><span class="time-icon"></span> <span class="room-panel-date">11-10</span> 入住，住 <span class="room-panel-night">1</span> 晚</div>
                            </div>
                        </div>
                        <div class="content-outside-title"><span class="title-before"></span>房型信息</div>
                        <div class="room-panel-types"><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20170210/589d262b94c67.jpeg" style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20170210/589d262b94c67.jpeg&quot;);">
                            <!-- <div class="charityPrice">义卖</div> -->
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-prevent" class="room-panel-type-book btn-sm btn-accent btn-raised addstyle" data-value="35" onclick="javascript:location='<%=basePath %>wx/reserve-weixin'">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">单人间</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">10</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">0.02</span>
                                    <div class="text-before text-hide"><span>原价￥</span><span class="room-panel-type-shopprice text-price" style="font-size:12px ;">0.02</span></div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">我们一直坚持：开一家温暖的店，遇见温暖的人；让行走的人在这里找到像家一样的感觉。愿我们能有缘成为</div>
        </div><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20160621/5768e14f5a44e.jpeg" style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20160621/5768e14f5a44e.jpeg&quot;);">
                             <!-- <div class="charityPrice">义卖</div> -->
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-prevent" class="room-panel-type-book btn-sm btn-accent btn-raised addstyle" data-value="36" onclick="javascript:location='<%=basePath %>wx/reserve-weixin'">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">双人间</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">6</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">800.00</span>
                                    <div class="text-before text-hide"><span>原价￥</span><span class="room-panel-type-shopprice text-price" style="font-size:12px ;">1000.00</span></div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">我们一直坚持：开一家温暖的店，遇见温暖的人；让行走的人在这里找到像家一样的感觉。愿我们能有缘成</div>
        </div><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20160922/57e38e839dd8d.jpeg" style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20160922/57e38e839dd8d.jpeg&quot;);">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-prevent" class="room-panel-type-book btn-sm btn-accent btn-raised addstyle" data-value="291" onclick="javascript:location='<%=basePath %>wx/reserve-weixin'">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">主题房</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">3</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">224.00</span>
                                    <div class="text-before text-hide"><span>原价￥</span><span class="room-panel-type-shopprice text-price" style="font-size:12px ;">280.00</span></div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">把你客房独到之处告诉别人。。。    每晚250.00元</div>
        </div>
        
        <!--  
        <div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20161021/580985f50d40f.jpeg" style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20161021/580985f50d40f.jpeg&quot;);">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-prevent" class="room-panel-type-book btn-sm btn-accent btn-raised addstyle" data-value="320">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">蜜月房</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">3</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">264.00</span>
                                    <div class="text-before text-hide"><span>原价￥</span><span class="room-panel-type-shopprice text-price" style="font-size:12px ;">330.00</span></div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">把你客房独到之处告诉别人。。。    每晚250.00元</div>
        </div><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20170111/5875e2fd998e2.jpeg" style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20170111/5875e2fd998e2.jpeg&quot;);">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-prevent" class="room-panel-type-book btn-sm btn-accent btn-raised addstyle" data-value="358">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">亲子房</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">3</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">207.00</span>
                                    <div class="text-before text-hide"><span>原价￥</span><span class="room-panel-type-shopprice text-price" style="font-size:12px ;">230.00</span></div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">把你客房独到之处告诉别人。。。    每晚250.00元</div>
        </div><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomType/20170302/58b724d8364a4.jpg">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-prevent" class="room-panel-type-book btn-sm btn-accent btn-raised addstyle" data-value="359">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">日租房</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">3</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">158.40</span>
                                    <div class="text-before text-hide"><span>原价￥</span><span class="room-panel-type-shopprice text-price" style="font-size:12px ;">180.00</span></div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">每晚很好</div>
        </div><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20161102/58193531bca17.jpeg" style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20161102/58193531bca17.jpeg&quot;);">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-prevent" class="room-panel-type-book btn-sm btn-accent btn-raised addstyle" data-value="383">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">月租房</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">3</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">1000.00</span>
                                    <div class="text-before text-hide">&nbsp;</div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">每月2500.00元</div>
        </div><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20161102/5819353c88b27.jpeg">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-prevent" class="room-panel-type-book btn-sm btn-accent btn-raised addstyle" data-value="384">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">年租房</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">3</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">80.15</span>
                                    <div class="text-before text-hide">&nbsp;</div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">每年时30000.00元</div>
        </div><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20161102/581935ce84fcb.jpeg">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-prevent" class="room-panel-type-book btn-sm btn-accent btn-raised addstyle" data-value="385">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">钟点房</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">4</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">80.15</span>
                                    <div class="text-before text-hide">&nbsp;</div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">每小时80.00元</div>
        </div></div>
                    </div>
                    <div class="hour-room hidden">
                        <div class="content-panel room-panel-time-picker" style="border-bottom: none;">
                            <div class="content-panel-body clearfix">
                                <div class="vertical-margin nowrap-content has-icon-line"><span class="time-icon"></span> <span class="room-panel-time" data-hour="13">13:00</span> 入住，住 <span class="room-panel-hour">2</span> 小时</div>
                            </div>
                        </div>
                        <div class="content-outside-title"><span class="title-before"></span>房型信息</div>
                        <div class="hour-room-panel-types" style="margin-top: 6px;padding: 0 0 0 16px;"><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20170210/589d262b94c67.jpeg" style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20170210/589d262b94c67.jpeg&quot;);">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-hour-prevent" class="hour-room-book btn-sm btn-accent btn-raised addstyle" data-value="35">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">单人间</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">10</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">60.00</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">我们一直坚持：开一家温暖的店，遇见温暖的人；让行走的人在这里找到像家一样的感觉。愿我们能有缘成为</div>
        </div><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20160621/5768e14f5a44e.jpeg" style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20160621/5768e14f5a44e.jpeg&quot;);">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-hour-prevent" class="hour-room-book btn-sm btn-accent btn-raised addstyle" data-value="36">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">双人间</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">3</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">60.00</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">我们一直坚持：开一家温暖的店，遇见温暖的人；让行走的人在这里找到像家一样的感觉。愿我们能有缘成</div>
        </div><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20160922/57e38e839dd8d.jpeg" style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20160922/57e38e839dd8d.jpeg&quot;);">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-hour-prevent" class="hour-room-book btn-sm btn-accent btn-raised addstyle" data-value="291">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">主题房</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">1</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">1.00</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">把你客房独到之处告诉别人。。。    每晚250.00元</div>
        </div></div>
                    </div>
                    <div class="long-room hidden">
                        <div class="content-panel room-panel-long-picker" style="border-bottom: none;">
                            <div class="content-panel-body clearfix">
                                <div class="vertical-margin nowrap-content has-icon-line"><span class="time-icon"></span> <span class="room-panel-long" data-long="2017-11-10">2017-11-10</span> 入住，住 <span class="room-panel-month">1</span> 个月</div>
                            </div>
                        </div>
                        <div class="content-outside-title"><span class="title-before"></span>房型信息</div>
                        <div class="long-room-panel-types" style="margin-top: 6px;padding: 0 0 0 16px;"><div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomTypeCover/20170210/589d262b94c67.jpeg">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-long-prevent" class="long-room-book btn-sm btn-accent btn-raised addstyle" data-value="35">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content">单人间</div>
                            <div class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info">剩余： <span class="room-panel-type-surplus">10</span>间</div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;">1000.00</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc">我们一直坚持：开一家温暖的店，遇见温暖的人；让行走的人在这里找到像家一样的感觉。愿我们能有缘成为</div>
        </div></div>-->
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

    <div class="modal" id="calendarModal" style="padding: 0;">
        <div class="vertical-middle-block container">
            <div class="modal-dialog modal-sm vertical-middle-block-cell modal-relative">
                <div class="modal-content">
                    <div class="modal-header">
                        <div>选择入住、离店时间</div>
                    </div>
                    <div class="modal-body">
                        <table id="dateRangePickerHeader">
                            <tbody><tr>
                                <th>日</th>
                                <th>一</th>
                                <th>二</th>
                                <th>三</th>
                                <th>四</th>
                                <th>五</th>
                                <th>六</th>
                            </tr>
                        </tbody></table>
                    </div>
                    <div id="dateRangePicker"><div class="date-range-container"><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">十一月 2017年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">3</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">4</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-startdate date-range-calendar-option" data-value="2017-11-10"><div class="date-range-calender-day-content"><div class="date-range-selected-info">今天</div><div class="date-range-selected-tip">入住</div></div></td><td class="date-range-calendar-enddate date-range-calendar-option" data-value="2017-11-11"><div class="date-range-calender-day-content"><div class="date-range-selected-info">11</div><div class="date-range-selected-tip">离店</div></div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2017-11-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2017-11-13"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-option" data-value="2017-11-14"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-option" data-value="2017-11-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2017-11-16"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-option" data-value="2017-11-17"><div class="date-range-calender-day-content">17</div></td><td class="date-range-calendar-option" data-value="2017-11-18"><div class="date-range-calender-day-content">18</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2017-11-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2017-11-20"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-option" data-value="2017-11-21"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-option" data-value="2017-11-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2017-11-23"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-option" data-value="2017-11-24"><div class="date-range-calender-day-content">24</div></td><td class="date-range-calendar-option" data-value="2017-11-25"><div class="date-range-calender-day-content">25</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2017-11-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2017-11-27"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-option" data-value="2017-11-28"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-option" data-value="2017-11-29"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-option" data-value="2017-11-30"><div class="date-range-calender-day-content">30</div></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">十二月 2017年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-option" data-value="2017-12-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2017-12-02"><div class="date-range-calender-day-content">2</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2017-12-03"><div class="date-range-calender-day-content">3</div></td><td class="date-range-calendar-option" data-value="2017-12-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2017-12-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2017-12-06"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-option" data-value="2017-12-07"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-option" data-value="2017-12-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2017-12-09"><div class="date-range-calender-day-content">9</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2017-12-10"><div class="date-range-calender-day-content">10</div></td><td class="date-range-calendar-option" data-value="2017-12-11"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-option" data-value="2017-12-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2017-12-13"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-option" data-value="2017-12-14"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-option" data-value="2017-12-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2017-12-16"><div class="date-range-calender-day-content">16</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2017-12-17"><div class="date-range-calender-day-content">17</div></td><td class="date-range-calendar-option" data-value="2017-12-18"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-option" data-value="2017-12-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2017-12-20"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-option" data-value="2017-12-21"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-option" data-value="2017-12-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2017-12-23"><div class="date-range-calender-day-content">23</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2017-12-24"><div class="date-range-calender-day-content">24</div></td><td class="date-range-calendar-option" data-value="2017-12-25"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-option" data-value="2017-12-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2017-12-27"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-option" data-value="2017-12-28"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-option" data-value="2017-12-29"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-option" data-value="2017-12-30"><div class="date-range-calender-day-content">30</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2017-12-31"><div class="date-range-calender-day-content">31</div></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">一月 2018年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-option" data-value="2018-01-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2018-01-02"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-option" data-value="2018-01-03"><div class="date-range-calender-day-content">3</div></td><td class="date-range-calendar-option" data-value="2018-01-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2018-01-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2018-01-06"><div class="date-range-calender-day-content">6</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-01-07"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-option" data-value="2018-01-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2018-01-09"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-option" data-value="2018-01-10"><div class="date-range-calender-day-content">10</div></td><td class="date-range-calendar-option" data-value="2018-01-11"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-option" data-value="2018-01-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2018-01-13"><div class="date-range-calender-day-content">13</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-01-14"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-option" data-value="2018-01-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2018-01-16"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-option" data-value="2018-01-17"><div class="date-range-calender-day-content">17</div></td><td class="date-range-calendar-option" data-value="2018-01-18"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-option" data-value="2018-01-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2018-01-20"><div class="date-range-calender-day-content">20</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-01-21"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-option" data-value="2018-01-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2018-01-23"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-option" data-value="2018-01-24"><div class="date-range-calender-day-content">24</div></td><td class="date-range-calendar-option" data-value="2018-01-25"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-option" data-value="2018-01-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2018-01-27"><div class="date-range-calender-day-content">27</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-01-28"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-option" data-value="2018-01-29"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-option" data-value="2018-01-30"><div class="date-range-calender-day-content">30</div></td><td class="date-range-calendar-option" data-value="2018-01-31"><div class="date-range-calender-day-content">31</div></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">二月 2018年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-option" data-value="2018-02-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2018-02-02"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-option" data-value="2018-02-03"><div class="date-range-calender-day-content">3</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-02-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2018-02-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2018-02-06"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-option" data-value="2018-02-07"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-option" data-value="2018-02-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2018-02-09"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-option" data-value="2018-02-10"><div class="date-range-calender-day-content">10</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-02-11"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-option" data-value="2018-02-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2018-02-13"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-option" data-value="2018-02-14"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-option" data-value="2018-02-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2018-02-16"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-option" data-value="2018-02-17"><div class="date-range-calender-day-content">17</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-02-18"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-option" data-value="2018-02-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2018-02-20"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-option" data-value="2018-02-21"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-option" data-value="2018-02-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2018-02-23"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-option" data-value="2018-02-24"><div class="date-range-calender-day-content">24</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-02-25"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-option" data-value="2018-02-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2018-02-27"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-option" data-value="2018-02-28"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">三月 2018年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-option" data-value="2018-03-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2018-03-02"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-option" data-value="2018-03-03"><div class="date-range-calender-day-content">3</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-03-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2018-03-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2018-03-06"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-option" data-value="2018-03-07"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-option" data-value="2018-03-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2018-03-09"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-option" data-value="2018-03-10"><div class="date-range-calender-day-content">10</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-03-11"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-option" data-value="2018-03-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2018-03-13"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-option" data-value="2018-03-14"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-option" data-value="2018-03-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2018-03-16"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-option" data-value="2018-03-17"><div class="date-range-calender-day-content">17</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-03-18"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-option" data-value="2018-03-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2018-03-20"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-option" data-value="2018-03-21"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-option" data-value="2018-03-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2018-03-23"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-option" data-value="2018-03-24"><div class="date-range-calender-day-content">24</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-03-25"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-option" data-value="2018-03-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2018-03-27"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-option" data-value="2018-03-28"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-option" data-value="2018-03-29"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-option" data-value="2018-03-30"><div class="date-range-calender-day-content">30</div></td><td class="date-range-calendar-option" data-value="2018-03-31"><div class="date-range-calender-day-content">31</div></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">四月 2018年</td></tr><tr class="date-range-calendar-day"></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-04-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2018-04-02"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-option" data-value="2018-04-03"><div class="date-range-calender-day-content">3</div></td><td class="date-range-calendar-option" data-value="2018-04-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2018-04-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2018-04-06"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-option" data-value="2018-04-07"><div class="date-range-calender-day-content">7</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-04-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2018-04-09"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-option" data-value="2018-04-10"><div class="date-range-calender-day-content">10</div></td><td class="date-range-calendar-option" data-value="2018-04-11"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-option" data-value="2018-04-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2018-04-13"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-option" data-value="2018-04-14"><div class="date-range-calender-day-content">14</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-04-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2018-04-16"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-option" data-value="2018-04-17"><div class="date-range-calender-day-content">17</div></td><td class="date-range-calendar-option" data-value="2018-04-18"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-option" data-value="2018-04-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2018-04-20"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-option" data-value="2018-04-21"><div class="date-range-calender-day-content">21</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-04-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2018-04-23"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-option" data-value="2018-04-24"><div class="date-range-calender-day-content">24</div></td><td class="date-range-calendar-option" data-value="2018-04-25"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-option" data-value="2018-04-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2018-04-27"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-option" data-value="2018-04-28"><div class="date-range-calender-day-content">28</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-04-29"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-option" data-value="2018-04-30"><div class="date-range-calender-day-content">30</div></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">五月 2018年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-option" data-value="2018-05-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2018-05-02"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-option" data-value="2018-05-03"><div class="date-range-calender-day-content">3</div></td><td class="date-range-calendar-option" data-value="2018-05-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2018-05-05"><div class="date-range-calender-day-content">5</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-05-06"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-option" data-value="2018-05-07"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-option" data-value="2018-05-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2018-05-09"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-option" data-value="2018-05-10"><div class="date-range-calender-day-content">10</div></td><td class="date-range-calendar-option" data-value="2018-05-11"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-option" data-value="2018-05-12"><div class="date-range-calender-day-content">12</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-05-13"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-option" data-value="2018-05-14"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-option" data-value="2018-05-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2018-05-16"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-option" data-value="2018-05-17"><div class="date-range-calender-day-content">17</div></td><td class="date-range-calendar-option" data-value="2018-05-18"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-option" data-value="2018-05-19"><div class="date-range-calender-day-content">19</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-05-20"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-option" data-value="2018-05-21"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-option" data-value="2018-05-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2018-05-23"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-option" data-value="2018-05-24"><div class="date-range-calender-day-content">24</div></td><td class="date-range-calendar-option" data-value="2018-05-25"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-option" data-value="2018-05-26"><div class="date-range-calender-day-content">26</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-05-27"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-option" data-value="2018-05-28"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-option" data-value="2018-05-29"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-option" data-value="2018-05-30"><div class="date-range-calender-day-content">30</div></td><td class="date-range-calendar-option" data-value="2018-05-31"><div class="date-range-calender-day-content">31</div></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">六月 2018年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-option" data-value="2018-06-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2018-06-02"><div class="date-range-calender-day-content">2</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-06-03"><div class="date-range-calender-day-content">3</div></td><td class="date-range-calendar-option" data-value="2018-06-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2018-06-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2018-06-06"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-option" data-value="2018-06-07"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-option" data-value="2018-06-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2018-06-09"><div class="date-range-calender-day-content">9</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-06-10"><div class="date-range-calender-day-content">10</div></td><td class="date-range-calendar-option" data-value="2018-06-11"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-option" data-value="2018-06-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2018-06-13"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-option" data-value="2018-06-14"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-option" data-value="2018-06-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2018-06-16"><div class="date-range-calender-day-content">16</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-06-17"><div class="date-range-calender-day-content">17</div></td><td class="date-range-calendar-option" data-value="2018-06-18"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-option" data-value="2018-06-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2018-06-20"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-option" data-value="2018-06-21"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-option" data-value="2018-06-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2018-06-23"><div class="date-range-calender-day-content">23</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-06-24"><div class="date-range-calender-day-content">24</div></td><td class="date-range-calendar-option" data-value="2018-06-25"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-option" data-value="2018-06-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2018-06-27"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-option" data-value="2018-06-28"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-option" data-value="2018-06-29"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-option" data-value="2018-06-30"><div class="date-range-calender-day-content">30</div></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">七月 2018年</td></tr><tr class="date-range-calendar-day"></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-07-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2018-07-02"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-option" data-value="2018-07-03"><div class="date-range-calender-day-content">3</div></td><td class="date-range-calendar-option" data-value="2018-07-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2018-07-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2018-07-06"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-option" data-value="2018-07-07"><div class="date-range-calender-day-content">7</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-07-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2018-07-09"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-option" data-value="2018-07-10"><div class="date-range-calender-day-content">10</div></td><td class="date-range-calendar-option" data-value="2018-07-11"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-option" data-value="2018-07-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2018-07-13"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-option" data-value="2018-07-14"><div class="date-range-calender-day-content">14</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-07-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2018-07-16"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-option" data-value="2018-07-17"><div class="date-range-calender-day-content">17</div></td><td class="date-range-calendar-option" data-value="2018-07-18"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-option" data-value="2018-07-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2018-07-20"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-option" data-value="2018-07-21"><div class="date-range-calender-day-content">21</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-07-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2018-07-23"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-option" data-value="2018-07-24"><div class="date-range-calender-day-content">24</div></td><td class="date-range-calendar-option" data-value="2018-07-25"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-option" data-value="2018-07-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2018-07-27"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-option" data-value="2018-07-28"><div class="date-range-calender-day-content">28</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-07-29"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-option" data-value="2018-07-30"><div class="date-range-calender-day-content">30</div></td><td class="date-range-calendar-option" data-value="2018-07-31"><div class="date-range-calender-day-content">31</div></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">八月 2018年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-option" data-value="2018-08-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2018-08-02"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-option" data-value="2018-08-03"><div class="date-range-calender-day-content">3</div></td><td class="date-range-calendar-option" data-value="2018-08-04"><div class="date-range-calender-day-content">4</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-08-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2018-08-06"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-option" data-value="2018-08-07"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-option" data-value="2018-08-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2018-08-09"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-option" data-value="2018-08-10"><div class="date-range-calender-day-content">10</div></td><td class="date-range-calendar-option" data-value="2018-08-11"><div class="date-range-calender-day-content">11</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-08-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2018-08-13"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-option" data-value="2018-08-14"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-option" data-value="2018-08-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2018-08-16"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-option" data-value="2018-08-17"><div class="date-range-calender-day-content">17</div></td><td class="date-range-calendar-option" data-value="2018-08-18"><div class="date-range-calender-day-content">18</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-08-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2018-08-20"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-option" data-value="2018-08-21"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-option" data-value="2018-08-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2018-08-23"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-option" data-value="2018-08-24"><div class="date-range-calender-day-content">24</div></td><td class="date-range-calendar-option" data-value="2018-08-25"><div class="date-range-calender-day-content">25</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-08-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2018-08-27"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-option" data-value="2018-08-28"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-option" data-value="2018-08-29"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-option" data-value="2018-08-30"><div class="date-range-calender-day-content">30</div></td><td class="date-range-calendar-option" data-value="2018-08-31"><div class="date-range-calender-day-content">31</div></td><td class="date-range-calendar-empty"></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">九月 2018年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-option" data-value="2018-09-01"><div class="date-range-calender-day-content">1</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-09-02"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-option" data-value="2018-09-03"><div class="date-range-calender-day-content">3</div></td><td class="date-range-calendar-option" data-value="2018-09-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2018-09-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2018-09-06"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-option" data-value="2018-09-07"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-option" data-value="2018-09-08"><div class="date-range-calender-day-content">8</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-09-09"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-option" data-value="2018-09-10"><div class="date-range-calender-day-content">10</div></td><td class="date-range-calendar-option" data-value="2018-09-11"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-option" data-value="2018-09-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2018-09-13"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-option" data-value="2018-09-14"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-option" data-value="2018-09-15"><div class="date-range-calender-day-content">15</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-09-16"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-option" data-value="2018-09-17"><div class="date-range-calender-day-content">17</div></td><td class="date-range-calendar-option" data-value="2018-09-18"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-option" data-value="2018-09-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2018-09-20"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-option" data-value="2018-09-21"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-option" data-value="2018-09-22"><div class="date-range-calender-day-content">22</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-09-23"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-option" data-value="2018-09-24"><div class="date-range-calender-day-content">24</div></td><td class="date-range-calendar-option" data-value="2018-09-25"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-option" data-value="2018-09-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2018-09-27"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-option" data-value="2018-09-28"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-option" data-value="2018-09-29"><div class="date-range-calender-day-content">29</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-09-30"><div class="date-range-calender-day-content">30</div></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">十月 2018年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-option" data-value="2018-10-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2018-10-02"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-option" data-value="2018-10-03"><div class="date-range-calender-day-content">3</div></td><td class="date-range-calendar-option" data-value="2018-10-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2018-10-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2018-10-06"><div class="date-range-calender-day-content">6</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-10-07"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-option" data-value="2018-10-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2018-10-09"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-option" data-value="2018-10-10"><div class="date-range-calender-day-content">10</div></td><td class="date-range-calendar-option" data-value="2018-10-11"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-option" data-value="2018-10-12"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-option" data-value="2018-10-13"><div class="date-range-calender-day-content">13</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-10-14"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-option" data-value="2018-10-15"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-option" data-value="2018-10-16"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-option" data-value="2018-10-17"><div class="date-range-calender-day-content">17</div></td><td class="date-range-calendar-option" data-value="2018-10-18"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-option" data-value="2018-10-19"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-option" data-value="2018-10-20"><div class="date-range-calender-day-content">20</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-10-21"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-option" data-value="2018-10-22"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-option" data-value="2018-10-23"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-option" data-value="2018-10-24"><div class="date-range-calender-day-content">24</div></td><td class="date-range-calendar-option" data-value="2018-10-25"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-option" data-value="2018-10-26"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-option" data-value="2018-10-27"><div class="date-range-calender-day-content">27</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-10-28"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-option" data-value="2018-10-29"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-option" data-value="2018-10-30"><div class="date-range-calender-day-content">30</div></td><td class="date-range-calendar-option" data-value="2018-10-31"><div class="date-range-calender-day-content">31</div></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td></tr></tbody></table><table class="date-range-calendar"><tbody><tr class="date-range-calendar-title"><td colspan="7">十一月 2018年</td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-empty"></td><td class="date-range-calendar-option" data-value="2018-11-01"><div class="date-range-calender-day-content">1</div></td><td class="date-range-calendar-option" data-value="2018-11-02"><div class="date-range-calender-day-content">2</div></td><td class="date-range-calendar-option" data-value="2018-11-03"><div class="date-range-calender-day-content">3</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-option" data-value="2018-11-04"><div class="date-range-calender-day-content">4</div></td><td class="date-range-calendar-option" data-value="2018-11-05"><div class="date-range-calender-day-content">5</div></td><td class="date-range-calendar-option" data-value="2018-11-06"><div class="date-range-calender-day-content">6</div></td><td class="date-range-calendar-option" data-value="2018-11-07"><div class="date-range-calender-day-content">7</div></td><td class="date-range-calendar-option" data-value="2018-11-08"><div class="date-range-calender-day-content">8</div></td><td class="date-range-calendar-option" data-value="2018-11-09"><div class="date-range-calender-day-content">9</div></td><td class="date-range-calendar-option" data-value="2018-11-10"><div class="date-range-calender-day-content">10</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">11</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">12</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">13</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">14</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">15</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">16</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">17</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">18</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">19</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">20</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">21</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">22</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">23</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">24</div></td></tr><tr class="date-range-calendar-day"><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">25</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">26</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">27</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">28</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">29</div></td><td class="date-range-calendar-disabled"><div class="date-range-calender-day-content">30</div></td><td class="date-range-calendar-empty"></td></tr></tbody></table></div></div>
                </div>
            </div>
        </div>
    </div>
    <!--钟点房时间-->
    <div class="modal" id="hourRoomModal" style="padding: 0;">
        <div class="vertical-middle-block container">
            <div class="modal-dialog modal-sm vertical-middle-block-cell modal-relative">
                <div class="modal-content">
                    <div class="modal-header">
                        <div id="hour-room-title">可预订时间段4:00-23:00</div>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                        <div class="form-group">
                            <label for="select-hour-checkintime" class="col-xs-3 control-label">入住时间</label>
                            <div class="col-xs-4">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-left: 16px"><span class="select-text" id="select-hour-checkintime">13</span> <span class="caret"></span></button>
                                <ul class="dropdown-menu" id="hour-ul">
                                <li class="li-option" data-value="13"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">13</a></li><li class="li-option" data-value="14"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">14</a></li><li class="li-option" data-value="15"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">15</a></li><li class="li-option" data-value="16"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">16</a></li><li class="li-option" data-value="17"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">17</a></li><li class="li-option" data-value="18"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">18</a></li><li class="li-option" data-value="19"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">19</a></li><li class="li-option" data-value="20"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">20</a></li><li class="li-option" data-value="21"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">21</a></li><li class="li-option" data-value="22"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">22</a></li></ul>
                            </div>
                            <label class="col-xs-1 control-label">：</label>
                            <div class="col-xs-4">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-left: 16px"><span class="select-text" id="select-minute-checkintime">00</span> <span class="caret"></span></button>
                                <ul class="dropdown-menu" id="minute-ul" style="height: 200px;overflow-y: scroll;min-width: 120px;">
                                <li class="li-option" data-value="00"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">00</a></li><li class="li-option" data-value="01"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">01</a></li><li class="li-option" data-value="02"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">02</a></li><li class="li-option" data-value="03"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">03</a></li><li class="li-option" data-value="04"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">04</a></li><li class="li-option" data-value="05"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">05</a></li><li class="li-option" data-value="06"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">06</a></li><li class="li-option" data-value="07"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">07</a></li><li class="li-option" data-value="08"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">08</a></li><li class="li-option" data-value="09"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">09</a></li><li class="li-option" data-value="10"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">10</a></li><li class="li-option" data-value="11"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">11</a></li><li class="li-option" data-value="12"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">12</a></li><li class="li-option" data-value="13"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">13</a></li><li class="li-option" data-value="14"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">14</a></li><li class="li-option" data-value="15"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">15</a></li><li class="li-option" data-value="16"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">16</a></li><li class="li-option" data-value="17"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">17</a></li><li class="li-option" data-value="18"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">18</a></li><li class="li-option" data-value="19"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">19</a></li><li class="li-option" data-value="20"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">20</a></li><li class="li-option" data-value="21"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">21</a></li><li class="li-option" data-value="22"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">22</a></li><li class="li-option" data-value="23"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">23</a></li><li class="li-option" data-value="24"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">24</a></li><li class="li-option" data-value="25"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">25</a></li><li class="li-option" data-value="26"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">26</a></li><li class="li-option" data-value="27"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">27</a></li><li class="li-option" data-value="28"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">28</a></li><li class="li-option" data-value="29"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">29</a></li><li class="li-option" data-value="30"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">30</a></li><li class="li-option" data-value="31"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">31</a></li><li class="li-option" data-value="32"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">32</a></li><li class="li-option" data-value="33"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">33</a></li><li class="li-option" data-value="34"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">34</a></li><li class="li-option" data-value="35"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">35</a></li><li class="li-option" data-value="36"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">36</a></li><li class="li-option" data-value="37"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">37</a></li><li class="li-option" data-value="38"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">38</a></li><li class="li-option" data-value="39"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">39</a></li><li class="li-option" data-value="40"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">40</a></li><li class="li-option" data-value="41"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">41</a></li><li class="li-option" data-value="42"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">42</a></li><li class="li-option" data-value="43"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">43</a></li><li class="li-option" data-value="44"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">44</a></li><li class="li-option" data-value="45"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">45</a></li><li class="li-option" data-value="46"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">46</a></li><li class="li-option" data-value="47"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">47</a></li><li class="li-option" data-value="48"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">48</a></li><li class="li-option" data-value="49"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">49</a></li><li class="li-option" data-value="50"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">50</a></li><li class="li-option" data-value="51"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">51</a></li><li class="li-option" data-value="52"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">52</a></li><li class="li-option" data-value="53"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">53</a></li><li class="li-option" data-value="54"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">54</a></li><li class="li-option" data-value="55"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">55</a></li><li class="li-option" data-value="56"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">56</a></li><li class="li-option" data-value="57"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">57</a></li><li class="li-option" data-value="58"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">58</a></li><li class="li-option" data-value="59"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">59</a></li></ul>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 10px;">
                            <label for="select-hour" class="col-xs-3 control-label">住</label>
                            <div class="col-xs-9">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-left: 16px"><span class="select-text" id="select-hour" data-value="2">2小时</span> <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li class="li-option" data-value="2"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">2小时</a></li>
                                    <li class="li-option" data-value="4"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">4小时</a></li>
                                    <li class="li-option" data-value="6"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">6小时</a></li>
                                </ul>
                            </div>
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer" style="border: none">
                        <div class="form-group">
                            <div class="col-xs-12">
                                <button type="button" class="btn-primary btn-raised pull-left" data-dismiss="modal">取消</button>
                                <button type="button" class="btn-primary btn-raised pull-right" id="submitHour">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--长租房时间-->
    <div class="modal" id="longRoomModal" style="padding: 0;">
        <div class="vertical-middle-block container">
            <div class="modal-dialog modal-sm vertical-middle-block-cell modal-relative">
                <div class="modal-content">
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="datepicker" class="col-xs-3 control-label">入住时间</label>
                                <div class="col-xs-9">
                                    <input class="form-control" id="datepicker" value="2017-11-10" data-date-start-date="2017-11-10" data-date-end-date="2018-05-10">
                                </div>
                            </div>
                            <div class="form-group" style="margin-top: 10px;">
                                <label for="select-long" class="col-xs-3 control-label">住</label>
                                <div class="col-xs-9">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-left: 16px"><span class="select-text" id="select-long" data-value="1">1个月</span> <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li class="li-option" data-value="1"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">1个月</a></li>
                                    <li class="li-option" data-value="2"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">2个月</a></li>
                                    <li class="li-option" data-value="3"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">3个月</a></li>
                                    <li class="li-option" data-value="4"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">4个月</a></li>
                                    <li class="li-option" data-value="5"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">5个月</a></li>
                                    <li class="li-option" data-value="6"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">6个月</a></li>
                                    <li class="li-option" data-value="7"><a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#">7个月</a></li>
                                </ul>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer" style="border: none">
                        <div class="form-group">
                            <div class="col-xs-12">
                                <button type="button" class="btn-primary btn-raised pull-left" data-dismiss="modal">取消</button>
                                <button type="button" class="btn-primary btn-raised pull-right" id="submitLong">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--设施信息-->
    <div class="modal" id="facility-desc">
        <div class="vertical-middle-block container" style="padding: 0 16px;">
            <div class="modal-dialog modal-sm vertical-middle-block-cell">
                <div class="modal-content">
                    <div class="content-outside-title"><span class="title-before"></span>设施信息</div>
                    <div class="modal-body"><ul></ul></div>
                </div>
            </div>
        </div>
    </div>
    <!--js 使用的tag模板-->
    <script type="text/html" id="templateTag">
        <div class="hotel-panel-tag nowrap-content"></div>
    </script>
    <script type="text/html" id="templateCarouselItem">
        <div class="item">
            <div class="inner-item" data-original=""></div>
        </div>
    </script>
    <script type="text/html" id="templateCarouselIndicator">
        <li data-target="#hotel-panel-carousel" data-slide-to=""></li>
    </script>
    <script type="text/html" id="templateRoomType">
        <div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-prevent" class="room-panel-type-book btn-sm btn-accent btn-raised addstyle">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content"></div>
                            <div  class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info"><span class="room-panel-type-surplus"></span></div>
                                <span class="text-money" ><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;"></span>
                                    <div class="text-before text-hide">
                                        <span>原价￥</span><span class="room-panel-type-shopprice text-price" style="font-size:12px ;">100.00</span>
                                    </div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc"></div>
        </div>
    </script>
    <script type="text/html" id="templateHourRoomType">
        <div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-hour-prevent" class="hour-room-book btn-sm btn-accent btn-raised addstyle ">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content"></div>
                            <div  class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info"><span class="room-panel-type-surplus"></span></div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;"></span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc"></div>
        </div>
    </script>
    <script type="text/html" id="templateLongRoomType">
        <div class="content-panel room-panel-type">
            <div class="content-panel-body clearfix room-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <div class="room-panel-type-img background-cover" data-original="">
                            <div class="charityPrice hidden">义卖</div>
                        </div>
                    </div>
                    <div class="room-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="fixed-right">
                                <div class="line-down-pay hidden">线下付</div>
                                <div id="btn-long-prevent" class="long-room-book btn-sm btn-accent btn-raised addstyle ">预订</div>
                            </div>
                            <div class="room-panel-type-name nowrap-content"></div>
                            <div  class="room-panel-type-extra typo-text-black-light clearfix" id="room-panel-type-extra">
                                <div class="pull-right room-panel-type-surplus-info" id="room-panel-type-surplus-info"><span class="room-panel-type-surplus"></span></div>
                                <span class="text-money"><span style="float: left;">￥</span><span class="room-panel-type-price text-price" style="font-size: 18px;"></span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="text-desc"></div>
        </div>
    </script>
    <script type="text/html" id="templateShopType">
        <div class="content-panel shop-panel-type">
            <div class="clearfix shop-panel-type-container">
                <div class="fixed-left-container">
                    <div class="fixed-left">
                        <img src="/Public/src/Home/image/uclbrt.jpg" width="52px" class="img-circle">
                    </div>
                    <div class="shop-panel-type-detail">
                        <div class="fixed-right-container">
                            <div class="shop-fixed-right">
                                <div class="btn-sm shop-panel-type-book">进店</div>
                                <div class="shop-panel-collect">收藏<span class="collect-num"></span></div>
                            </div>
                            <div class="shop-panel-type-name nowrap-content"></div>
                            <div class="shop-panel-type-extra clearfix">
                                <div class="shop-panel-info row">
                                    <span class="shop-panel-sales">销量<span class="sales-num"></span>件 </span>
                                    <span class="shop-panel-goods">宝贝<span class="goods-num"></span>件</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="shop-panel-img">
                <div class="shop-panel-cover">
                    <div class="shop-panel-price"></div>
                    <div class="shop-panel-price-detail">￥<span class="shop-price"></span></div>
                </div>
            </div>
        </div>
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
    <script type="text/javascript" src="<%=basePath %>wx/js/daterangepicker.mobile.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/index.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/shop.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/bootstrap-datepicker.zh-CN.min.js"></script>


<script type="text/javascript">
	$("#<%=hotel%>-panel").addClass("is-active");
	$("#<%=hotel%>-show").addClass("is-active");

</script>

</body></html>