$(function() {
    toastr.options = {
        newestOnTop: !1,
        timeOut: 1500,
        extendedTimeOut: 0,
        escapeHtml: !0,
        positionClass: "toast-bottom-center"
    },
    $("#hotel-panel-carousel").carousel({
        interval: 2e3
    }),
    $("#hotel-panel-carousel").on("slid.bs.carousel",
    function() {
        $("html,body").trigger("scroll")
    }),
    $("#hotel-panel").on("click", ".hotel-more-info-trigger",
    function(e) {
        e.preventDefault();
        var o = $(this);
        o.hasClass("revert") ? $("#hotel-panel .hotel-more-info").addClass("hidden") : $("#hotel-panel .hotel-more-info").removeClass("hidden"),
        o.toggleClass("revert")
    });
    var e = getArgs();
    if (window.currentHotel = e.hotel, void 0 === window.currentHotel || "" === window.currentHotel) toastr.error(lang("toastr.grogshop"));
    else {
        toggleLoading(!0),
        ajaxRequest("/Home/Hotel/info", {
            hotel: window.currentHotel
        },
        "post",
        function(e) {
            toggleLoading(!1);
            var o = e.data;
            $("#hotel-panel .main-pic").css("background-image", "url(" + o.logoImageUrl + ")"),
            1 != o.hotelIcon.hotelIcon && 1 != o.hotelIcon.hotelSafeguardIcon && 1 != o.hotelIcon.hotelCreditIcon && 1 != o.hotelIcon.hotelBrandIcon || $("#hotel-icon-content").removeClass("hidden"),
            1 == o.hotelIcon.hotelIcon && $("#hotelvicon").removeClass("hidden"),
            1 == o.hotelIcon.hotelSafeguardIcon && $("#hotelsafeicon").removeClass("hidden"),
            1 == o.hotelIcon.hotelCreditIcon && $("#hotelcrediticon").removeClass("hidden"),
            1 == o.hotelIcon.hotelBrandIcon && $("#hotelbrandicon").removeClass("hidden"),
            $(document).attr("title", o.hotelName),
            $("#doc-header .navbar-title").html(o.hotelName),
            $("#hotel-cover .inner-item").attr("data-original", o.coverImageUrl).lazyload(),
            $("#hotel-panel-carousel .carousel-caption").html(o.hotelName);
            var t = $("#hotel-panel");
            t.find(".hotel-panel-contact").html(o.contact),
            t.find(".hotel-panel-mobile").html("+" + o.areaCode + "&nbsp;" + o.mobile),
            t.find(".hotel-panel-address").html(o.address),
            0 !== parseInt(o.longitude) && 0 !== parseInt(o.latitude) && (t.find(".hotel-panel-map").removeClass("hidden"), t.find(".hotel-panel-map").attr("href", "/Home/BookPage/map.html?hotel=" + window.currentHotel + "&name=" + encodeURIComponent(o.hotelName) + "&address=" + encodeURIComponent(o.address) + "&longitude=" + o.longtitude + "&latitude=" + o.latitude)),
            t.find(".hotel-panel-telephone").html(o.telephone),
            t.find(".hotel-panel-wechat").html(o.wechat),
            "" == o.hotline ? t.find(".complaint-hidden").hide() : (t.find(".complaint-hidden").show(), t.find(".hotel-panel-complaint").html(o.hotline)),
            t.find(".hotel-panel-desc").html(o.description);
            var a = $("#hotel-panel-special-container");
            a.find(".hotel-panel-special").html(o.special),
            a.find(".hotel-panel-special-img").attr("data-original", o.specialImageUrl).lazyload();
            var n = "",
            l = $($("#templateTag").clone().html()),
            i = $(".hotel-panel-tag-container");
            o.specialTag.length > 0 && (i.closest(".content-panel").removeClass("hidden"), i.closest(".content-panel").prev(".content-outside-title").removeClass("hidden"), $.each(o.specialTag,
            function(e, o) {
                l.html(o),
                n += l.prop("outerHTML")
            }), i.html(n));
            var r = $("#hotel-panel-carousel");
            r.find(".inner-item").attr("data-original", o.gallery[0]).lazyload();
            var s = "",
            d = "",
            p = $($("#templateCarouselItem").clone().html()),
            c = $($("#templateCarouselIndicator").clone().html());
            $("#hotel-panel-carousel").on("click", ".inner-item",
            function() {
                var e = $(this).data("original"),
                t = [];
                $.each(o.gallery,
                function(o, a) {
                    a == e ? t.unshift(a) : t.push(a)
                }),
                window.location.href = "/Home/BookPage/indexpic?hotel=" + window.currentHotel + "&pic=" + t.join(",")
            }),
            $.each(o.gallery,
            function(e, o) {
                return 0 === e || (p.find(".inner-item").attr("data-original", o), c.attr("data-slide-to", e), s += p.prop("outerHTML"), void(d += c.prop("outerHTML")))
            }),
            r.find(".carousel-inner").append(s),
            $(".carousel .inner-item").lazyload({
                skip_invisible: !0
            }),
            r.find(".carousel-indicators").append(d);
            var m = "";
            if ($("#hotel-panel-facility").attr("data-value", o.facility), $.each(o.facility,
            function(e, o) {
                l.html("&nbsp;"),
                o == lang("wirelessNetworks") && l.removeClass().addClass("facility-wireless-networks hotel-panel-tag nowrap-content"),
                o == lang("park") && l.removeClass().addClass("facility-park hotel-panel-tag nowrap-content"),
                o == lang("breakfast") && l.removeClass().addClass("facility-breakfast hotel-panel-tag nowrap-content"),
                o == lang("midding") && l.removeClass().addClass("facility-midding hotel-panel-tag nowrap-content"),
                o == lang("westernFood") && l.removeClass().addClass("facility-western-food hotel-panel-tag nowrap-content"),
                o == lang("cafe") && l.removeClass().addClass("facility-cafe hotel-panel-tag nowrap-content"),
                o == lang("gym") && l.removeClass().addClass("facility-gym hotel-panel-tag nowrap-content"),
                o == lang("swimming") && l.removeClass().addClass("facility-swimming hotel-panel-tag nowrap-content"),
                o == lang("bar") && l.removeClass().addClass("facility-bar hotel-panel-tag nowrap-content"),
                o == lang("chirapsia") && l.removeClass().addClass("facility-chirapsia hotel-panel-tag nowrap-content"),
                o == lang("hotWater") && l.removeClass().addClass("facility-hot-water hotel-panel-tag nowrap-content"),
                m += l.prop("outerHTML")
            }), $("#hotel-panel-facility").html(m), o.hourroom && Object.keys(o.hourroom).length > 0) {
                var h = o.hourroom,
                u = $(".room-panel-time").data("hour");
                if ($("#hour-room-title").text(lang("booktime") + h.checkintime + ":00-" + h.checkouttime + ":00"), u < h.checkouttime) {
                    u < h.checkintime && (u = h.checkintime);
                    for (var f = u; f < parseInt(h.checkouttime); f++) $("#hour-ul").append("<li class='li-option' data-value='" + f + "'><a href='#'>" + f + "</a></li>");
                    for (var f = 0; f <= 9; f++) {
                        var g = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09"];
                        $("#minute-ul").append("<li class='li-option' data-value='" + g[f] + "'><a href='#'>" + g[f] + "</a></li>")
                    }
                    for (var f = 10; f <= 59; f++) $("#minute-ul").append("<li class='li-option' data-value='" + f + "'><a href='#'>" + f + "</a></li>");
                    $("#select-hour-checkintime").text(u),
                    $("#select-hour-checkintime").data("value", u),
                    $("#select-minute-checkintime").data("value", "00"),
                    $(".room-panel-time").text(u + ":00"),
                    $("#zhongdianfang").removeClass("hidden"),
                    $("#choose-room-btn").removeClass("hidden")
                }
            }
            o.longroom && Object.keys(o.longroom).length > 0 && ($("#changzufang").removeClass("hidden"), $("#choose-room-btn").removeClass("hidden"))
        },
        function(e) {
            toggleLoading(!1),
            toastr.error("undefined" == typeof e.responseJSON ? lang("tip.system") : e.responseJSON.info)
        });
        var o = $("#doc").data("start");
        $('#doc-body .tabs-tab[href="#room-panel"]').on("tabSelected.ulite.tabs",
        function(e) {
            var t = $("#room-panel");
            void 0 === t.data("has-init") && (n(o), t.data("has-init", 1))
        })
    }
    $("#hotel-panel-facility").click(function() {
        $("#facility-desc").modal("show");
        var e = $(this).attr("data-value"),
        o = $("#facility-desc ul");
        o.find("li").remove();
        for (var t = e.split(","), a = [], n = 0; n < t.length; n++) {
            var l = $("#hotel-panel-facility").children(".hotel-panel-tag").eq(n).attr("class").split(" ")[0];
            a.push(l)
        }
        for (var n = 0; n < t.length; n++) {
            var i = $("<li/>").text(t[n]).addClass(a[n]);
            o.append(i)
        }
    });
    var t = $("#choose-room-btn .text-value");
    $("#jianyefang").click(function() {
        $(this).addClass("button-click").siblings().removeClass("button-click"),
        $(".normal-room").removeClass("hidden"),
        $(".long-room").addClass("hidden"),
        $(".hour-room").addClass("hidden"),
        t.text($(this).find("a").text())
    }),
    $("#zhongdianfang").click(function() {
        $(this).addClass("button-click").siblings().removeClass("button-click"),
        $(".room-panel-type-img").trigger("click"),
        $(".normal-room").addClass("hidden"),
        $(".long-room").addClass("hidden"),
        $(".hour-room").removeClass("hidden"),
        t.text($(this).find("a").text())
    }),
    $("#changzufang").click(function() {
        $(this).addClass("button-click").siblings().removeClass("button-click"),
        $(".room-panel-type-img").trigger("click"),
        $(".normal-room").addClass("hidden"),
        $(".hour-room").addClass("hidden"),
        $(".long-room").removeClass("hidden"),
        t.text($(this).find("a").text())
    }),
    $(document).on("click", ".li-option",
    function() {
        var e = $(this).parent().siblings().find(".select-text");
        e.text($(this).text()),
        e.data("value", $(this).data("value"))
    });
    var a = function(e, o, t) {
        toggleLoading(!0),
        window.checkInDate = o,
        window.checkOutDate = t,
        ajaxRequest("/Home/Room/roomTypes", {
            hotel: e,
            startDate: o,
            endDate: t
        },
        "post",
        function(e) {
            var o = e.data,
            t = 0 === parseInt(o.bookMode),
            a = 1 === parseInt(o.bookMode),
            n = "",
            l = $($("#templateRoomType").clone().html());
            $.each(o.roomTypes,
            function(e, o) {
                l.find(".room-panel-type-img").attr("data-original", o.coverImageUrl),
                l.find(".room-panel-type-name").html(o.name),
                l.find(".room-panel-type-shopprice").html(parseFloat(o.shopPrice).toFixed(2)),
                0 == parseFloat(o.charityPrice) ? l.find(".charityPrice").addClass("hidden") : l.find(".charityPrice").removeClass("hidden"),
                "" == o.shopPrice ? l.find(".text-hide").html("&nbsp;") : l.find(".text-hide").html("<span>" + lang("originalPrice") + '￥</span><span class="room-panel-type-shopprice text-price" style="font-size:12px ;">' + parseFloat(o.shopPrice).toFixed(2) + "</span>"),
                l.find(".room-panel-type-price").html(parseFloat(o.price).toFixed(2)),
                1 == o.isOffline ? (l.find(".line-down-pay").removeClass("hidden"), l.find(".room-panel-type-book").removeClass("addstyle")) : (l.find(".line-down-pay").addClass("hidden"), l.find(".room-panel-type-book").addClass("addstyle"));
                var i = parseInt(o.rest);
                0 === i ? (l.find(".room-panel-type-book").addClass("hidden"), a && l.find(".room-panel-type-surplus-info").html(lang("fullHouse")), t && l.find(".room-panel-type-surplus-info").html(lang("fullHouse"))) : (l.find(".room-panel-type-book").removeClass("hidden").attr("data-value", o.id), t && l.find(".room-panel-type-surplus-info").html(lang("left") + '<span class="room-panel-type-surplus">' + i + "</span>" + lang("rooms")), a && l.find(".room-panel-type-surplus-info").html("")),
                1 == o.lastRoom && (o.description = '<div class="book-panel-tag nowrap-content">' + lang("cuxiao") + "</div>" + o.description),
                l.find("#text-desc").html(o.description),
                n += l.prop("outerHTML")
            }),
            $("#room-panel .room-panel-types").html(n),
            $("#room-panel .room-panel-type-img").lazyload({
                skip_invisible: !0
            }),
            toggleLoading(!1)
        },
        function(e) {
            toggleLoading(!1),
            toastr.error("undefined" == typeof e.responseJSON ? lang("tip.system") : e.responseJSON.info)
        })
    },
    n = function(e) {
        $("#room-panel .room-panel-date").html(e.substr(5));
        var o = getDate(e),
        t = o.customDays(1).customFormat();
        $("#dateRangePicker").dateRangePickerMobile({
            dateLimit: 7,
            showWeek: !1,
            minDate: e,
            maxDate: o.customDays(365).customFormat(),
            startDate: e,
            endDate: t,
            locale: {
                startDateLabel: lang("intake"),
                endDateLabel: lang("Departure")
            }
        }),
        $("#dateRangePicker").on("end.amos.drpm",
        function(e) {
            var o = e.startDate,
            t = e.endDate,
            n = getDate(t).getDays(getDate(o));
            $("#room-panel .room-panel-date").html(o.substr(5)),
            $("#room-panel .room-panel-night").html(n),
            $("#calendarModal").modal("hide"),
            a(window.currentHotel, o, t)
        }),
        $("#room-panel .room-panel-date-picker").on("click",
        function(e) {alert('jbm');
            e.preventDefault(),
            e.stopPropagation(),
            $("#calendarModal").modal("show")
        }),
        $("#room-panel").on("click", ".room-panel-type-book",
        function(e) {
            e.preventDefault(),
            e.stopPropagation();
            var o = $(this).data("value");
            window.location.href = "/Home/BookPage/room?hotel=" + window.currentHotel + "&roomType=" + o + "&startDate=" + window.checkInDate + "&endDate=" + window.checkOutDate
        }),
        a(window.currentHotel, e, t);
        var n = function(e, o, t, a) {
            window.checkInDate = o,
            window.checkOutDate = t,
            ajaxRequest("/Home/Room/hourRoomTypes", {
                hotel: e,
                startDate: o,
                endDate: t,
                hour: a
            },
            "post",
            function(e) {
                var o = e.data,
                t = 0 === parseInt(o.bookMode),
                a = 1 === parseInt(o.bookMode),
                n = "",
                l = $($("#templateHourRoomType").clone().html());
                $.each(o.roomTypes,
                function(e, o) {
                    l.find(".room-panel-type-img").attr("data-original", o.coverImageUrl),
                    l.find(".room-panel-type-name").html(o.name),
                    l.find(".room-panel-type-price").html(parseFloat(o.price).toFixed(2)),
                    0 == parseFloat(o.charityPrice) ? l.find(".charityPrice").addClass("hidden") : l.find(".charityPrice").removeClass("hidden"),
                    1 == o.isOffline ? (l.find(".line-down-pay").removeClass("hidden"), l.find(".hour-room-book").removeClass("addstyle")) : (l.find(".line-down-pay").addClass("hidden"), l.find(".hour-room-book").addClass("addstyle"));
                    var i = parseInt(o.rest);
                    0 === i ? (l.find(".hour-room-book").addClass("hidden"), a && l.find(".room-panel-type-surplus-info").html("满房"), t && l.find(".room-panel-type-surplus-info").html("满房")) : (l.find(".hour-room-book").removeClass("hidden").attr("data-value", o.id), t && l.find(".room-panel-type-surplus-info").html(lang("left") + '<span class="room-panel-type-surplus">' + i + "</span>" + lang("rooms")), a && l.find(".room-panel-type-surplus-info").html("")),
                    l.find("#text-desc").html(o.description),
                    n += l.prop("outerHTML")
                }),
                $("#room-panel .hour-room-panel-types").html(n),
                $("#room-panel .room-panel-type-img").lazyload({
                    event: "click",
                    skip_invisible: !0
                })
            },
            function(e) {
                toastr.error("undefined" == typeof e.responseJSON ? lang("tip.system") : e.responseJSON.info)
            })
        };
        $("#room-panel .room-panel-time-picker").on("click",
        function(e) {
            e.preventDefault(),
            e.stopPropagation(),
            $("#hourRoomModal").modal("show")
        }),
        n(window.currentHotel, e, t, $(".room-panel-hour").text()),
        $("#submitHour").click(function() {
            var o = $("#select-hour").data("value");
            $(".room-panel-hour").text(o);
            var a = $("#select-hour-checkintime").data("value"),
            l = $("#select-minute-checkintime").data("value");
            $(".room-panel-time").text(a + ":" + l),
            n(window.currentHotel, e, t, o),
            $("#hourRoomModal").modal("hide")
        }),
        $("#room-panel").on("click", ".hour-room-book",
        function(e) {
            e.preventDefault(),
            e.stopPropagation();
            var o = $(this).data("value"),
            t = $(".room-panel-time").text(),
            a = $(".room-panel-hour").text();
            window.location.href = "/Home/BookPage/hourroom?hotel=" + window.currentHotel + "&roomType=" + o + "&startTime=" + t + "&hour=" + a
        });
        var l = function(e, o, t) {
            toggleLoading(!0),
            ajaxRequest("/Home/Room/longRoomTypes", {
                hotel: e,
                startDate: o,
                month: t
            },
            "post",
            function(e) {
                var o = e.data,
                t = 0 === parseInt(o.bookMode),
                a = 1 === parseInt(o.bookMode),
                n = "",
                l = $($("#templateLongRoomType").clone().html());
                $.each(o.roomTypes,
                function(e, o) {
                    l.find(".room-panel-type-img").attr("data-original", o.coverImageUrl),
                    l.find(".room-panel-type-name").html(o.name),
                    l.find(".room-panel-type-price").html(parseFloat(o.price).toFixed(2)),
                    0 == parseFloat(o.charityPrice) ? l.find(".charityPrice").addClass("hidden") : l.find(".charityPrice").removeClass("hidden"),
                    1 == o.isOffline ? (l.find(".line-down-pay").removeClass("hidden"), l.find(".long-room-book").removeClass("addstyle")) : (l.find(".line-down-pay").addClass("hidden"), l.find(".long-room-book").addClass("addstyle"));
                    var i = parseInt(o.rest);
                    0 === i ? (l.find(".long-room-book").addClass("hidden"), a && l.find(".room-panel-type-surplus-info").html("满房"), t && l.find(".room-panel-type-surplus-info").html("满房")) : (l.find(".long-room-book").removeClass("hidden").attr("data-value", o.id), t && l.find(".room-panel-type-surplus-info").html(lang("left") + '<span class="room-panel-type-surplus">' + i + "</span>" + lang("rooms")), a && l.find(".room-panel-type-surplus-info").html("")),
                    l.find("#text-desc").html(o.description),
                    n += l.prop("outerHTML")
                }),
                $("#room-panel .long-room-panel-types").html(n),
                $("#room-panel .room-panel-type-img").lazyload({
                    skip_invisible: !0
                }),
                toggleLoading(!1)
            },
            function(e) {
                toggleLoading(!1),
                toastr.error("undefined" == typeof e.responseJSON ? lang("tip.system") : e.responseJSON.info)
            })
        };
        l(window.currentHotel, e, 1),
        $("#room-panel").on("click", ".long-room-book",
        function(e) {
            e.preventDefault(),
            e.stopPropagation();
            var o = $(this).data("value"),
            t = $(".room-panel-long").text(),
            a = $(".room-panel-month").text();
            window.location.href = "/Home/BookPage/longroom?hotel=" + window.currentHotel + "&roomType=" + o + "&startDate=" + t + "&month=" + a
        }),
        $("#room-panel .room-panel-long-picker").on("click",
        function(e) {
            e.preventDefault(),
            e.stopPropagation(),
            $("#longRoomModal").modal("show")
        }),
        $("#datepicker").datepicker({
            format: "yyyy-mm-dd",
            language: lang("language"),
            autoclose: !0
        }),
        $("#submitLong").click(function() {
            var e = $("#select-long").data("value");
            $(".room-panel-month").text(e);
            var o = $("#datepicker").val();
            $(".room-panel-long").text(o),
            l(window.currentHotel, o, e),
            $("#longRoomModal").modal("hide")
        })
    },
    l = function() {
        var e = navigator.userAgent.toLowerCase();
        return "micromessenger" == e.match(/MicroMessenger/i)
    };
    l() && ajaxRequest("/Home/User/info", {},
    "post",
    function(e) {},
    function(e) {
        window.location.href = "http://cz.uclbrt.com/Wechat/WechatLoginPage/auth.html?type=mz&hotel=" + window.currentHotel
    });
    var e = getArgs(),
    i = e.name,
    r = $("#doc-body .tabs-tab-bar a");
    i && (r.eq(0).removeClass("is-active"), r.eq(1).addClass("is-active"), $("#hotel-panel").removeClass("is-active"), $("#room-panel").addClass("is-active"), $('#doc-body .tabs-tab[href="#room-panel"]').trigger("tabSelected.ulite.tabs"))
});