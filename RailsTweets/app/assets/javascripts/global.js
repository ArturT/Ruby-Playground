// replace id_element with value using jquery animation 
function toggle_html(id_element, value) {
	var obj = document.getElementById(id_element);
	
	if($(obj).html() == '')
	{
		$(obj).css('display','none');
		obj.innerHTML = value;
		$(obj).css("opacity", 0.2).slideDown().animate({opacity: 1}, "slow");
	}
	else
	{
		$(obj).animate({opacity: 0.2}, "slow").slideUp("slow", function() {
			obj.innerHTML = value;
			$(obj).slideDown().animate({opacity: 1}, "slow");	
		});	
	}	
}