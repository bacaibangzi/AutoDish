$(function() {

	$("#room-panel .room-panel-date-picker").on(
			"click",
			function(e) {
				e.preventDefault(), e.stopPropagation(), $("#calendarModal")
						.modal("show")
			})

});