$(function(){toggleLoading(!0);var e=getArgs(),r=e.hotel,t=$("#doc-header a").attr("href");$("#doc-header a").attr("href",t+"?hotel="+r),t=$("#doc-content a").attr("href"),$("#doc-content a").attr("href",t+"?hotel="+r),toggleLoading(!1),toastr.options={newestOnTop:!1,timeOut:1500,extendedTimeOut:0,escapeHtml:!0,positionClass:"toast-bottom-center"},void 0!==r&&""!==r||toastr.error(lang("toastr.grogshop"));var d=function(e){return toggleLoading(!1),"undefined"==typeof e.responseJSON?void toastr.error(lang("tip.system")):304===e.responseJSON.status?($("#order-list-toggle").addClass("hidden"),$("#doc-body").addClass("hidden"),void $("#doc-content").removeClass("hidden")):void toastr.error(e.responseJSON.info)},o=function(){toggleLoading(!0),ajaxRequest("/Home/Order/userItem",{status:0},"post",function(e){toggleLoading(!1);var t=e.data.order;t.reverse();var d="";if(0===t.length)d=$("#templateOrderEmpty").clone().html();else{var o=$($("#templateOrder").clone().html());$.each(t,function(e,t){o.attr("href","/Home/OrderPage/index?hotel="+r+"&no="+t.orderNumber),o.find(".order-cover").attr("data-original",t.roomTypeCoverImageUrl);for(var a=t.user[0].userLoginId,n=t.orderRoom,i=0;i<n.length;i++){var l=n[i].userLoginId;if(l==a)var s=n[i].statusName}var h=parseInt(t.refundStatus);1===h&&(s+=" -"+lang("applyRefund")),3===h&&(s+=" -"+lang("rejectRefund")),o.find(".order-status").html(s),o.find(".order-hotel-name").html(t.hotelName),o.find(".order-room-type").html(t.roomTypeName),o.find(".order-room-name").html(t.roomName),o.find(".order-number").html(t.orderNumber),o.find(".order-price").html(t.price),o.find(".order-checkin-date").html(t.startDate),o.find(".order-checkout-date").html(t.endDate),t.hour>0?(o.find(".order-checkin-date").html(t.startdate),o.find(".order-checkout-date").addClass("hidden"),o.find(".to").addClass("hidden"),o.find(".order-night").html("("+t.hour+lang("hour")+")")):t.month>0?(o.find(".order-checkin-date").html(t.startDate),o.find(".to").removeClass("hidden"),o.find(".order-checkout-date").removeClass("hidden").html(t.endDate),o.find(".order-night").html("("+t.month+lang("month")+")")):(o.find(".order-checkin-date").html(t.startDate),o.find(".to").removeClass("hidden"),o.find(".order-checkout-date").removeClass("hidden").html(t.endDate),o.find(".order-night").html("("+t.night+lang("nights")+")")),d+=o.prop("outerHTML")})}$("#order-valid").html(d),$(".order-cover").lazyload({skip_invisible:!0})},d)},a=function(){toggleLoading(!0),ajaxRequest("/Home/Order/userItem",{status:1},"post",function(e){toggleLoading(!1);var t=e.data.order;t.reverse();var d="";if(0===t.length)d=$("#templateOrderEmpty").clone().html();else{var o=$($("#templateOrderInvalid").clone().html());$.each(t,function(e,t){o.attr("href","/Home/OrderPage/index?hotel="+r+"&no="+t.orderNumber),o.find(".order-cover").attr("data-original",t.roomTypeCoverImageUrl);for(var a=t.user[0].userLoginId,n=t.orderRoom,i=0;i<n.length;i++){var l=n[i].userLoginId;if(l==a)var s=n[i].statusName}o.find(".order-status").html(s),o.find(".order-hotel-name").html(t.hotelName),o.find(".order-room-type").html(t.roomTypeName),o.find(".order-room-name").html(t.roomName),o.find(".order-number").html(t.orderNumber),o.find(".order-price").html(t.price),t.hour>0?(o.find(".order-checkin-date").html(t.startdate),o.find(".order-checkout-date").addClass("hidden"),o.find(".to").addClass("hidden"),o.find(".order-night").html("("+t.hour+lang("hour")+")")):t.month>0?(o.find(".order-checkin-date").html(t.startDate),o.find(".to").removeClass("hidden"),o.find(".order-checkout-date").removeClass("hidden").html(t.endDate),o.find(".order-night").html("("+t.month+lang("month")+")")):(o.find(".order-checkin-date").html(t.startDate),o.find(".to").removeClass("hidden"),o.find(".order-checkout-date").removeClass("hidden").html(t.endDate),o.find(".order-night").html("("+t.night+lang("nights")+")")),d+=o.prop("outerHTML")})}$("#order-invalid").html(d),$(".order-cover").lazyload({skip_invisible:!0})},d)};o(),$("#doc-header").on("click",".tabs-order",function(e){e.preventDefault();var r=$(this);r.removeClass("before").addClass("active"),r.siblings().removeClass("active").addClass("before");var t=r.attr("data");"valid"===t?($("#order-invalid").addClass("hidden"),$("#order-valid").removeClass("hidden"),o()):($("#order-invalid").removeClass("hidden"),$("#order-valid").addClass("hidden"),a())}),$("#order-valid").on("click",".order-refresh",function(e){e.preventDefault(),o()}),$("#order-invalid").on("click",".order-refresh",function(e){e.preventDefault(),a()})});