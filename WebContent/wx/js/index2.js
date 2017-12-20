$(function() {
    function e(e, d) {
        var a = new FileReader,
        t = d.closest(".camera-container"),
        i = t.data("value"),
        n = t.width(),
        o = t.height();
        a.onload = function(e) {
            var d = e.target.result,
            a = document.querySelector("canvas"),
            s = (a.getContext("2d"), new Image);
            s.onload = function() {
                var e = 320;
                a.width = e,
                a.height = e;
                var d = a.getContext("2d");
                d.clearRect(0, 0, e, e);
                var r, l, m = 0,
                u = 0;
                this.width > this.height ? (r = Math.round(e * this.width / this.height), l = e, m = -Math.round((r - e) / 2)) : (l = Math.round(e * this.height / this.width), r = e, u = -Math.round((l - e) / 2)),
                d.drawImage(this, m, u, r, l);
                var c = a.toDataURL("image/jpeg", .7);
                1 == parseInt(i) ? window.face = c: window.back = c,
                t.find(".get-photo").addClass("hidden"),
                t.find(".add-photo").removeClass("hidden").append(s),
                t.find("img").css({
                    width: n,
                    height: o
                })
            },
            s.src = d
        },
        a.readAsDataURL(e)
    }
    var d = getArgs(),
    a = d.hotel;
    window.face = "",
    window.back = "",
    toastr.options = {
        newestOnTop: !1,
        timeOut: 1500,
        extendedTimeOut: 0,
        escapeHtml: !0,
        positionClass: "toast-bottom-center"
    },
    ajaxRequest("/Home/Order/getTotalCharity", {},
    "post",
    function(e) {
        $(".totalCharity").text(e.data.totalCharity)
    },
    function(e) {});
    
    
    var t = $("#confirmationModal"),
    i = $("#idCardChangeModal"),
    n = $("#idCardModal"),
    o = $("#bindMobileModal");
    
    
    /*
    ajaxRequest("/Home/User/getPersonIdInfo", {},
    "post",
    function(e) {
        var d = e.data;
        d.WechatAndBind ? $(".unBindIdCard").attr("data-isWechat", !0) : $(".unBindIdCard").removeAttr("data-isWechat"),
        d.isBind ? ($(".bindIdCardNum").removeClass("hidden"), $(".unBindIdCard").addClass("hidden"), n.find(".idCard-name").text(d.idname), 1 == d.idsex ? n.find(".idCard-sex").text(lang("male")) : n.find(".idCard-sex").text(lang("female")), n.find(".idCard-nation").text(d.idnation), n.find(".idCard-num").text(d.ididentity), n.find(".idCard-address").text(d.idaddress), $(".bindIdCardNum").removeClass("hidden").text(d.ididentity.substr(0, 4) + "****" + d.ididentity.substr( - 4))) : ($(".unBindIdCard").removeClass("hidden"), $(".bindIdCardNum").addClass("hidden"))
    },
    function(e) {
        toastr.error("undefined" == typeof e.responseJSON ? lang("tip.server") : e.responseJSON.info)
    }),
    */
    
    
    
    $("#doc-body").on("click", ".idCard-one-icon",
    function(e) {
        e.preventDefault(),
        e.stopPropagation(),
        $(this).find(".unBindIdCard").hasClass("hidden") && $("#idCardModal").modal("show")
    }).on("click", ".unBindIdCard",
    function(e) {
        e.preventDefault(),
        e.stopPropagation(),
        $(this).attr("data-isWechat") ? o.modal("show") : i.modal("show"),
        $(".get-photo").removeClass("hidden"),
        $(".add-photo").addClass("hidden").html("")
    }),
    $("#submitEditIdCard").on("click",
    function(e) {
        return "" == window.face ? (toastr.error(lang("select.pic")), !1) : (e.preventDefault(), e.stopPropagation(), toggleLoading(!0), Parmas = {},
        Parmas.baseface = window.face, "" != window.back && (Parmas.baseback = window.back), void ajaxRequest("/Home/User/getIdInformation", Parmas, "post",
        function(e) {
            var d = e.data;
            toggleLoading(!1),
            $("#submitConfirmation").data("info", d),
            t.find(".idCard-name").text(d.name),
            t.find(".idCard-sex").text(d.sex),
            t.find(".idCard-nation").text(d.nationality),
            t.find(".idCard-num").text(d.num),
            t.find(".idCard-address").text(d.address),
            i.modal("hide"),
            t.modal("show")
        },
        function(e) {
            toggleLoading(!1),
            toastr.error("undefined" == typeof e.responseJSON ? lang("tip.server") : e.responseJSON.info)
        }))
    }),
    $("#bindMobileModal").inputValidate({
        submit: {
            query: "#sendAgain"
        },
        inputs: [{
            query: "#requestMobile",
            regexp: window.commonRegexp.mobile.regexp,
            message: window.commonRegexp.mobile.message,
            emptyMessage: window.commonRegexp.mobile.emptyMessage
        }]
    }),
    $("#sendAgain").on("successSubmit.amos.inputValidate",
    function(e) {
        var d = $(this),
        a = {};
        a.mobile = $("#requestMobile").val(),
        a.areaCode = $(".areaCodeValue").text().trim(),
        toggleLoading(!0),
        ajaxRequest("/Home/User/wechatBookVcode", a, "post",
        function(e) {
            toggleLoading(!1),
            timeDisplay($("#sendAgain"), 60)
        },
        function(e, d, a) {
            toggleLoading(!1),
            a(e, d)
        },
        d)
    }),
    $("#login-container").inputValidate({
        submit: {
            query: "#requestSubmit"
        },
        inputs: [{
            query: "#requestMobile",
            regexp: window.commonRegexp.mobile.regexp,
            message: window.commonRegexp.mobile.message,
            emptyMessage: window.commonRegexp.mobile.emptyMessage
        },
        {
            query: "#requestMobileCode",
            regexp: window.commonRegexp.vcode.regexp,
            message: window.commonRegexp.vcode.message,
            emptyMessage: window.commonRegexp.vcode.emptyMessage
        }]
    }),
    $("#requestSubmit").on("successSubmit.amos.inputValidate",
    function(e) {
        var d = $(this),
        t = {};
        t.mobile = $("#requestMobile").val(),
        t.vcode = $("#requestMobileCode").val(),
        t.areaCode = $(".areaCodeValue").text().trim(),
        t.hotel = a,
        toggleLoading(!0),
        ajaxRequest("/Home/User/wechatBindBook", t, "post",
        function(e) {
            var d = e.data;
            $(".unBindIdCard").removeAttr("data-isWechat"),
            o.modal("hide"),
            toggleLoading(!1),
            d.isBind ? ($(".bindIdCardNum").removeClass("hidden"), $(".unBindIdCard").addClass("hidden"), n.find(".idCard-name").text(d.idname), 1 == d.idsex ? n.find(".idCard-sex").text(lang("male")) : n.find(".idCard-sex").text(lang("female")), n.find(".idCard-nation").text(d.idnation), n.find(".idCard-num").text(d.ididentity), n.find(".idCard-address").text(d.idaddress), $(".user-num").text("+" + d.areacode + " " + d.mobile), $(".bindIdCardNum").removeClass("hidden").text(d.ididentity.substr(0, 4) + "****" + d.ididentity.substr( - 4)), $("#idCardModal").modal("show")) : ($(".unBindIdCard").removeClass("hidden"), $(".bindIdCardNum").addClass("hidden"), i.modal("show"))
        },
        function(e, d, a) {
            toggleLoading(!1),
            a(e, d)
        },
        d)
    }),
    $("#bindMobileModal").bind("input propertychange",
    function() {
        var e = $("#requestMobile").val(),
        d = $("#requestMobileCode").val();
        e && d ? $("#requestSubmit").attr("disabled", !1) : $("#requestSubmit").attr("disabled", !0)
    }),
    $("#submitConfirmation").on("click",
    function(e) {
        e.preventDefault(),
        e.stopPropagation();
        var d = $(this).data("info");
        if ("男" == d.sex) var a = 1;
        else var a = 0;
        var t = {};
        t.idName = d.name,
        t.idSex = a,
        t.idNation = d.nationality,
        t.idIdentity = d.num,
        t.idAddress = d.address,
        ajaxRequest("/Home/User/saveInformation", t, "post", null,
        function(e) {
            toastr.error("undefined" == typeof e.responseJSON ? lang("tip.server") : e.responseJSON.info)
        })
    }),
    $("#idCardModal").on("click", ".header-reset",
    function() {
        $("#idCardModal").modal("hide"),
        i.modal("show")
    }),
    i.on("click", ".header-cancel",
    function(e) {
        e.preventDefault(),
        e.stopPropagation(),
        i.modal("hide"),
        $(".get-photo").removeClass("hidden"),
        $(".add-photo").addClass("hidden").html(""),
        $("input[type='file']").val("")
    }),
    t.on("click", ".confirmation-cancel",
    function(e) {
        e.preventDefault(),
        e.stopPropagation(),
        t.modal("hide"),
        $(".get-photo").removeClass("hidden"),
        $(".add-photo").addClass("hidden").html(""),
        $("input[type='file']").val("")
    }).on("click", ".confirmation-back",
    function(e) {
        e.preventDefault(),
        e.stopPropagation(),
        t.modal("hide"),
        i.modal("show")
    }),
    $("input[type='file']").on("change",
    function(d) {
        var a = $(this),
        t = d.target.files[0];
        e(t, a)
    })
});