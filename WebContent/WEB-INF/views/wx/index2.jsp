<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0056)http://booking.meizhuyun.com/Home/BookPage/index?hotel=8 -->
<html lang="zh-cn" class="mdl-js"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
        <meta name="renderer" content="webkit">
        <meta name="format-detection" content="telephone=no">
    
    
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    
    
    <title class="navbar-title typo-text-white-deep">智能家居体验</title>

    
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

<body class="" >
    
    <div id="doc" class="container" data-start="2017-11-07">
    	<!--  
        <div id="btn-language-pos" class="btn-language-pos">
            <a data-toggle="dropdown" class="btn-sm typo-text-black-deep" href="javascript:void(0);">
                	语言&nbsp;<span class="caret"></span>
            </a>
            <ul class="languageSwitch dropdown-menu">
                <li><a href="javascript:void(0)" data-language="zh_cn">简体</a></li>
                <li><a href="javascript:void(0)" data-language="zh_tw">繁体</a></li>
                <li><a href="javascript:void(0)" data-language="en_us">English</a></li>
            </ul>
        </div>  
        -->     
        <div id="doc-header" class="navbar navbar-fixed-top" "="">
            <a href="<%=basePath %>wx/myCenter-weixin" class="pull-right navbar-icon"><span class="individual-right"></span></a>
        </div>
        <div id="doc-body">
            <div id="hotel-panel-carousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#hotel-panel-carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#hotel-panel-carousel" data-slide-to="1" ></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <div class="inner-item" data-original="<%=basePath %>wx/images/1.jpg" style="display: block; background-image: url(<%=basePath %>wx/images/1.jpg);"></div>
                    </div>
                    <div class="item">
                        <div class="inner-item" data-original="<%=basePath %>wx/images/4.jpg" style="display: block; background-image: url(<%=basePath %>wx/images/4.jpg);"></div>
                    </div>
                </div>
                <div class="carousel-caption nowrap-content">智能家居体验</div>
            </div>
            <div class="tabs ulite-js-tabs ulite-js-ripple-effect ulite-js-ripple-effect--ignore-events is-upgraded" data-upgraded=",MaterialTabs,MaterialRipple">
                <div class="tabs-tab-bar">
					<!-- <a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#hotel-panel" class="col-xs-6 tabs-tab is-active">客栈印象<span class="tabs-ripple-container ulite-js-ripple-effect" data-upgraded=",MaterialRipple"><span class="ripple"></span></span></a> -->
                    <a href="<%=basePath %>wx/myCenter-weixin" class="col-xs-6 tabs-tab">我要订房<span class="tabs-ripple-container ulite-js-ripple-effect" data-upgraded=",MaterialRipple"><span class="ripple"></span></span></a>
                    <!-- <a href="http://booking.meizhuyun.com/Home/BookPage/index?hotel=8#shop-panel" class="col-xs-6 tabs-tab" id="shop-show">掌柜优品<span class="tabs-ripple-container ulite-js-ripple-effect" data-upgraded=",MaterialRipple"><span class="ripple"></span></span></a> -->
                </div>
                <div class="tabs-panel is-active" id="hotel-panel">
                    
                    <div class="content-outside-title"><span class="title-before"></span>联系方式</div>
                    <div class="content-panel">
                        <div class="content-panel-body clearfix">
                            <div class="hotel-more-info ">
                                <div class="vertical-margin nowrap-content">前台：<span class="hotel-panel-telephone">400-2233</span></div>
                                <div class="vertical-margin nowrap-content">微信：<span class="hotel-panel-wechat">2233</span></div>
                                <div class="vertical-margin nowrap-content complaint-hidden">投诉：<span class="hotel-panel-complaint">400-2233</span></div>
                                <!-- 
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
                
                <div class="tabs-panel" id="shop-panel">
                    <div class="shop-panel-types">
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
                    <div id="dateRangePicker">
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
        <!--  
        <script type="text/javascript" src="<%=basePath %>wx/js/common.js"></script>
        <script type="text/javascript" src="<%=basePath %>wx/js/common_zh_cn.js"></script>
    -->
    
    <script type="text/javascript" src="<%=basePath %>wx/js/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/toastr.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/daterangepicker.mobile.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/index.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/shop.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>wx/js/bootstrap-datepicker.zh-CN.min.js"></script>



</body></html>