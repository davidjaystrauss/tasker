$(document).ready(function() {
	$(':checkbox').on('click',function() {
		$(this).closest('form').submit();
	})
});