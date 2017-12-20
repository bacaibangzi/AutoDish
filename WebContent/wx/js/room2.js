$(function() {
    toggleLoading(!0);
    var o = getArgs(),
    e = o.hotel,
    t = o.roomType,
    a = o.startDate,
    r = o.endDate;
    
    /*
    if ($("#roomGallery").carousel({
        interval: 2e3
    }), $("#roomGallery").on("slid.bs.carousel",
    function() {
        $("html,body").trigger("scroll")
    }), toastr.options = {
        newestOnTop: !1,
        timeOut: 1500,
        extendedTimeOut: 0,
        escapeHtml: !0,
        positionClass: "toast-bottom-center"
    },
    
    
    void 0 === e || "" === e) return void toastr.error(lang("toastr.grogshop"));
    if (void 0 === t || "" === t) return void toastr.error(lang("toastr.charmber"));
    if (void 0 === a || "" === a) return void toastr.error(lang("toastr.liveDate"));
    if (void 0 === r || "" === r) return void toastr.error(lang("toastr.leaveDate"));
    */
    
    var i = $("#header a").attr("data-href");
    $("#header a").attr("href", i + "?hotel=" + e),
    ajaxRequest("/Home/Room/roomTypeDetail", {
        hotel: e,
        roomType: t,
        startDate: a,
        endDate: r
    },
    "post",
    function(o) {
        var i = o.data;
        $(document).attr("title", i.hotelName),
        $("#doc-header .navbar-title").html(i.hotelName);
        var l = $("#roomGallery").data("gallrry", i.gallery);
        l.find(".inner-item").attr("data-original", i.gallery[0]).lazyload(),
        l.find(".carousel-caption").html(i.roomTypeName);
        var n = "",
        d = "",
        s = $($("#templateCarouselItem").clone().html()),
        c = $($("#templateCarouselIndicator").clone().html());
        $.each(i.gallery,
        function(o, e) {
            return 0 === o || (s.find(".inner-item").attr("data-original", e), c.attr("data-slide-to", o), n += s.prop("outerHTML"), void(d += c.prop("outerHTML")))
        }),
        l.find(".carousel-inner").append(n),
        $(".carousel .inner-item").lazyload({
            skip_invisible: !0
        }),
        l.find(".carousel-indicators").append(d),
        $("#roomGallery").on("click", ".inner-item",
        function() {
            var o = $(this).data("original"),
            t = [];
            $.each(i.gallery,
            function(e, a) {
                a == o ? t.unshift(a) : t.push(a)
            }),
            window.location.href = "/Home/BookPage/indexpic?hotel=" + e + "&pic=" + t.join(",")
        }),
        $("#doc-body .room-booking-style").html("" === i.description ? lang("noDesc") : i.description),
        0 == parseFloat(i.charityPrice) ? $("#doc-body .charityPrice-content").addClass("hidden") : ($("#doc-body .rummage").html(i.charityPrice), $("#doc-body .charityPrice-content").removeClass("hidden"));
        var m = 0 === parseInt(i.bookMode);
        if (!m) return $("#roomBook").on("click",
        function(o) {
            var i = $(this);
            return void 0 === i.attr("disabled") && void(window.location.href = "/Home/BookPage/book?hotel=" + e + "&roomType=" + t + "&startDate=" + a + "&endDate=" + r)
        }),
        $("#roomBook").removeAttr("disabled"),
        void toggleLoading(!1);
        $(".room-booking-show").removeClass("hidden"),
        $(".checkbox-box-room").removeClass("hidden"),
        $("#doc-header").css("bottom", "0"),
        $(".room-booking-style").css({
            "padding-bottom": "60px",
            "padding-top": "16px"
        });
        var h = ["", lang("qrcode"), "", lang("qrcode"), ""],
        p = "",
        g = $($("#templateRoom").clone().html());
        $.each(i.rooms,
        function(o, e) {
            0 === parseInt(e.enable) ? g.addClass("disabled") : g.removeClass("disabled"),
            g.attr("data-value", e.id).find(".dot-ellipsis").html(e.name);
            var t = parseInt(e.cardType);
            g.find(".cardStyle").html(h[t]),
            p += g.prop("outerHTML")
        }),
        $("#doc-body .room-type-rooms").html(p).on("click", ".selectable-block .vertical-middle-block",
        function() {
            var o = $(this).parents(".selectable-block"),
            e = $("#doc-body .selected").length;
            return o.hasClass("disabled") ? void toastr.warning(lang("noway")) : void(o.hasClass("selected") ? (o.removeClass("selected"), 1 == e && $("#roomBook").attr("disabled", !0)) : e < 3 ? (o.addClass("selected"), $("#roomBook").removeAttr("disabled")) : toastr.warning(lang("max3")))
        }),
        $("#roomBook").on("click",
        function(o) {
            var i = $(this);
            if (void 0 !== i.attr("disabled")) return ! 1;
            var l = [],
            n = "";
            $("#doc-body .selectable-block").each(function() {
                var o = $(this);
                o.hasClass("selected") && (n = o.data("value"), l.push(n))
            }),
            window.location.href = "/Home/BookPage/book?hotel=" + e + "&roomType=" + t + "&startDate=" + a + "&endDate=" + r + "&room=" + l
        }),
        toggleLoading(!1)
    },
    function(o) {
        toggleLoading(!1),
        toastr.error("undefined" == typeof o.responseJSON ? lang("tip.system") : o.responseJSON.info)
    })
});