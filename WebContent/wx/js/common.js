var lang = function(e) {
    return window.languageResource[e] || ""
};
$(function() {
    $("body").inputAction({
        global: !0
    }).height($(window).height()),
    window.commonRegexp = {
        mobile: {
            regexp: /^.{1,}$/,
            message: lang("tip.mobile"),
            emptyMessage: lang("tip.mobileWrite")
        },
        password: {
            regexp: /^(?=.*?[a-zA-Z])(?=.*?[0-9])[a-zA-Z0-9]{6,20}$/,
            message: lang("tip.password"),
            emptyMessage: lang("tip.passwordNull")
        },
        imageCode: {
            regexp: /^[0-9a-zA-Z]{4}$/,
            message: lang("common.verification"),
            emptyMessage: lang("common.verificationNull")
        },
        address: /^.{1,255}$/,
        vcode: {
            regexp: /^\d{4}$/,
            message: lang("tip.message"),
            emptyMessage: lang("tip.messageWrite")
        },
        smsvcode: /^\w{6}$/
    },
    void 0 !== $.fn.lazyload && $(".lazyload").lazyload({
        effect: "fadeIn"
    });
    var e;
    "undefined" != $.cookie("area_book_cookie") && (e = $.cookie("area_book_cookie"), void 0 != e ? $(".areaCode").find(".areaCodeValue").text(e) : $(".areaCode").find(".areaCodeValue").text("86")),
    $(".areaCode").on("click", ".dropdown-menu a",
    function() {
        var e = $(this),
        a = e.data("value");
        e.parents(".areaCode").find(".areaCodeValue").text(a),
        "undefined" != $.cookie("area_book_cookie") && $.cookie("area_book_cookie", a, {
            expires: 7,
            path: "/"
        })
    }),
    $(".languageSwitch").find("a").click(function() {
        $.cookie("mz_think_language", $(this).attr("data-language"), {
            expires: 7,
            path: "/"
        });
        var e = Date.parse(new Date);
        window.location.href = window.location.href.split("&rev")[0] + "&rev=" + e
    })
});
var toggleLoading = function(e) {
    e ? ($("#loadingContainer").removeClass("hidden"), $("body").addClass("modal-open")) : ($("#loadingContainer").addClass("hidden"), $("body").removeClass("modal-open"))
},
getArgs = function() {
    for (var e = {},
    a = location.search.substring(1), o = a.split("&"), n = 0; n < o.length; n++) {
        var i = o[n].indexOf("=");
        if (i != -1) {
            var r = o[n].substring(0, i),
            t = o[n].substring(i + 1);
            t = decodeURIComponent(t),
            e[r] = t
        }
    }
    return e
},
ajaxRequest = function(e, a, o, n, i, r) {
    if (null !== o && "" !== o || (o = "get"), void 0 !== r) {
        if (void 0 !== r.attr("disabled")) return ! 1;
        r.attr("disabled", !0)
    }
    $.ajax({
        url: e,
        data: a,
        type: o,
        cache: !1,
        dataType: "json",
        success: function(e) {
            void 0 !== r && r.removeAttr("disabled"),
            "function" == typeof n ? n(e, r) : window.location.reload()
        },
        error: function(e) {
            void 0 !== r && r.removeAttr("disabled"),
            "function" == typeof i ? i(e, r, defaultErrorHandler) : defaultErrorHandler(e, r)
        }
    })
},
defaultErrorHandler = function(e, a) {
    if ("undefined" == typeof e.responseJSON) formInlineTip(a, lang("ServerInternalError"));
    else if (303 === e.responseJSON.status) {
        var o = getArgs();
        window.location.href = "/Home/BookPage/index?hotel=" + o.hotel
    } else formInlineTip(a, e.responseJSON.info)
},
timeoutForward = function(e, a) {
    void 0 !== e && "" !== e || (e = window.location.href),
    void 0 === a && (a = 1500),
    window.setTimeout(function() {
        window.location.href = e
    },
    a)
},
timeDisplay = function(e, a) {
    e.addClass("disabled"),
    e.attr("disabled", !0);
    var o = a,
    n = window.setInterval(function() {
        o -= 1,
        e.find(".displayTime").text("(" + o + ")"),
        0 === o && (window.clearInterval(n), e.find(".displayTime").text(""), e.html('<span class="displayTime"></span>' + lang("timeDisplay") + "</div>"), e.removeClass("disabled"), e.removeAttr("disabled"))
    },
    1e3)
},
refreshVcode = function() {
    var e = $("#imgcode"),
    a = e.attr("src"),
    o = a.indexOf("?");
    o !== -1 && (a = a.substr(0, o));
    var n = (new Date).getTime();
    e.attr("src", a + "?" + n)
},
formInlineTip = function(e, a, o) {
    formInlineRight(e),
    void 0 === o && (o = 0);
    var n = $(e).data("tip-object"),
    i = $(n),
    r = 0 !== i.length;
    r || (i = e);
    var t = i.parents(".form-group"),
    s = t.find(".help-block");
    s.html(a);
    var d = "";
    switch (o) {
    case 2:
        d = "has-warning";
        break;
    case 1:
        d = "has-success";
        break;
    case 0:
        d = "has-error"
    }
    t.addClass(d),
    r && e.parent().addClass(d)
},
formInlineRight = function(e) {
    var a = $(e).parents(".form-group");
    a.removeClass("has-error"),
    a.removeClass("has-warning"),
    a.removeClass("has-success");
    var o = $(e).data("tip-object"),
    n = $(o),
    i = 0 !== n.length;
    i && (a = n.parents(".form-group"), a.removeClass("has-error"), a.removeClass("has-warning"), a.removeClass("has-success"))
},
getDate = function(e) {
    if ("" === e) return new Date;
    var a = e.split("-");
    return new Date(a[1] + "/" + a[2] + "/" + a[0])
};