$(function() {
	 $("#doc-body .room-type-rooms").html(p).on("click", ".selectable-block .vertical-middle-block",
		        function() {
		            var o = $(this).parents(".selectable-block"),
		            e = $("#doc-body .selected").length;
		            return o.hasClass("disabled") ? void toastr.warning(lang("noway")) : void(o.hasClass("selected") ? (o.removeClass("selected"), 1 == e && $("#roomBook").attr("disabled", !0)) : e < 3 ? (o.addClass("selected"), $("#roomBook").removeAttr("disabled")) : toastr.warning(lang("max3")))
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
     $("#doc-body .room-type-rooms").on("click", ".selectable-block .vertical-middle-block",
     function() {
         var o = $(this).parents(".selectable-block"),
         e = $("#doc-body .selected").length;
         return o.hasClass("disabled") ? void toastr.warning(lang("noway")) : void(o.hasClass("selected") ? (o.removeClass("selected"), 1 == e && $("#roomBook").attr("disabled", !0)) : e < 3 ? (o.addClass("selected"), $("#roomBook").removeAttr("disabled")) : toastr.warning(lang("max3")))
     });
	 
	 
	 
	 
});