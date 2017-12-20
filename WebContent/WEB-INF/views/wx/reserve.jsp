<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<!-- saved from url=(0107)http://booking.meizhuyun.com/Home/BookPage/room?hotel=8&roomType=35&startDate=2017-12-05&endDate=2017-12-08 -->
<html lang="zh-cn" class="mdl-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">
<meta name="renderer" content="webkit">
<meta name="format-detection" content="telephone=no">


<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">


<title class="navbar-title typo-text-white-deep">智能家居体验酒店</title>


<!--Core CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>wx/css/ulite.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>wx/css/common.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>wx/css/iconfont.css">


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
        <script type="text/javascript" src="/Public/jslib/html5shiv/3.7.2/html5shiv.min.js" ></script>
        <script type="text/javascript" src="/Public/jslib/respond.js/1.4.2/respond.min.js" ></script>
        <![endif]-->

<link rel="apple-touch-icon"
	href="http://booking.meizhuyun.com/Public/uclbrt/image/favicon-apple.png?rev=2">
<link rel="shortcut icon"
	href="http://booking.meizhuyun.com/Public/uclbrt/image/favicon.ico?rev=2">

<link rel="stylesheet" type="text/css"
	href="<%=basePath %>wx/css/room.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>wx/css/toastr.min.css">
<style type="text/css">
@media ( max-width : 320px) {
	#scrollable-detail .room-booking-show:first-child {
		line-height: inherit;
	}
}
</style>

</head>

<body class="" style="height: 1076px;">

	<div id="doc" class="container">
		<div id="btn-language-pos" class="btn-language-pos">
		</div>
		<div id="header" class="navbar navbar-fixed-top""="">
			<a data-href="/Home/BookPage/index" class="pull-right navbar-icon"
				href="<%=basePath %>wx/index-weixin?hotel=hotel"><span
				class="gohome-right"></span></a>
		</div>
		<div id="doc-body">
			<div id="roomGallery" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#roomGallery" data-slide-to="0" class="active"></li>
					<li data-target="#roomGallery" data-slide-to="1" class=""></li>

				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item next left">
						<div class="inner-item"
							data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomType/20160624/576ce3545f189.jpeg"
							style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomType/20160624/576ce3545f189.jpeg&quot;);"></div>
					</div>
					<div class="item active left">
						<div class="inner-item"
							data-original="http://www.meizhuyun.com:80/Uploads/HotelBookRoomType/20160927/57e9d4c75b69d.jpeg"
							style="display: block; background-image: url(&quot;http://www.meizhuyun.com:80/Uploads/HotelBookRoomType/20160927/57e9d4c75b69d.jpeg&quot;);"></div>
					</div>
				</div>
				<div class="carousel-caption nowrap-content">单人间</div>
			</div>
			<div id="scrollable-detail" class="horizontal-padding">
				<div class="content-outside-title room-booking-show">
					实时房态<span class="charityPrice-content"></span>
				</div>
				<div class="checkbox-box-room">
					<li>可选</li>
					<li>已选</li>
					<li>已售</li>
				</div>
				<div class="content-panel room-booking-show">
					<div class="content-panel-body">
						<div class="vertical-padding">
							<div class="room-type-rooms clearfix">
								<div class="selectable-block col-xs-2" data-value="176">
									<div class="vertical-middle-block">
										<div class="vertical-middle-block-cell dot-ellipsis">401G</div>
										<div class="cardStyle">二维码</div>
									</div>
								</div>
								<div class="selectable-block col-xs-2" data-value="177">
									<div class="vertical-middle-block">
										<div class="vertical-middle-block-cell dot-ellipsis">402G</div>
										<div class="cardStyle">二维码</div>
									</div>
								</div>
								<div class="selectable-block col-xs-2" data-value="178">
									<div class="vertical-middle-block">
										<div class="vertical-middle-block-cell dot-ellipsis">403G</div>
										<div class="cardStyle">二维码</div>
									</div>
								</div>
								<div class="selectable-block col-xs-2" data-value="1358">
									<div class="vertical-middle-block">
										<div class="vertical-middle-block-cell dot-ellipsis">R10</div>
										<div class="cardStyle">二维码</div>
									</div>
								</div>
								<div class="selectable-block col-xs-2" data-value="1359">
									<div class="vertical-middle-block">
										<div class="vertical-middle-block-cell dot-ellipsis">R15</div>
										<div class="cardStyle">二维码</div>
									</div>
								</div>
								<div class="selectable-block col-xs-2" data-value="1360">
									<div class="vertical-middle-block">
										<div class="vertical-middle-block-cell dot-ellipsis">R14</div>
										<div class="cardStyle">二维码</div>
									</div>
								</div>
								<div class="selectable-block col-xs-2" data-value="1361">
									<div class="vertical-middle-block">
										<div class="vertical-middle-block-cell dot-ellipsis">R13</div>
										<div class="cardStyle">二维码</div>
									</div>
								</div>
								<div class="selectable-block col-xs-2" data-value="1362">
									<div class="vertical-middle-block">
										<div class="vertical-middle-block-cell dot-ellipsis">R2</div>
										<div class="cardStyle">二维码</div>
									</div>
								</div>
								<div class="selectable-block col-xs-2" data-value="1363">
									<div class="vertical-middle-block">
										<div class="vertical-middle-block-cell dot-ellipsis">R19</div>
										<div class="cardStyle">二维码</div>
									</div>
								</div>
								<div class="selectable-block col-xs-2" data-value="3073">
									<div class="vertical-middle-block">
										<div class="vertical-middle-block-cell dot-ellipsis">332</div>
										<div class="cardStyle"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="room-booking-style"
					style="background: rgb(255, 255, 255); padding-bottom: 60px; padding-top: 16px;">我们一直坚持：开一家温暖的店，遇见温暖的人；让行走的人在这里找到像家一样的感觉。愿我们能有缘成为</div>
				<div id="doc-header" class="navbar navbar-fixed-top"
					style="top: auto; background: rgb(246, 246, 246); opacity: 1; bottom: 0px;">
					<div class="row">
						<div id="roomBook" class="col-xs-12 btn-raised btn-primary"
							disabled=""
							style="color: #fff; height: 39px; line-height: 39px; margin-top: 10px;">预订</div>
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

	<!--js 使用的tag模板-->
	<script type="text/html" id="templateRoom">
        <div class="selectable-block col-xs-2">
            <div class="vertical-middle-block">
                <div class="vertical-middle-block-cell dot-ellipsis"></div>
                <div class="cardStyle"></div>
            </div>
        </div>
    </script>
	<script type="text/html" id="templateCarouselItem">
        <div class="item">
            <div class="inner-item" data-original=""></div>
        </div>
    </script>
	<script type="text/html" id="templateCarouselIndicator">
        <li data-target="#roomGallery" data-slide-to=""></li>
    </script>


	<script type="text/javascript" src="<%=basePath %>wx/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>wx/js/jquery.cookie.js"></script>
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
	<script type="text/javascript"
		src="<%=basePath %>wx/js/common_zh_cn.js"></script>


	<script type="text/javascript"
		src="<%=basePath %>wx/js/jquery.lazyload.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>wx/js/toastr.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>wx/js/room.js"></script>



</body>
</html>