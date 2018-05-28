$(".responsive_tag").click(function() {
    $("#navigation-app").fadeOut("slow");
}); 
$(".responsive_bar").click(function() {
    $("#navigation-app").fadeIn("slow");
});
 $(".add_candidate_but").click(function(){
	 
 $("#candidateadd_modal").modal();
	 
 });
$(".form_dev").submit(function(e){
	e.preventDefault();
	$.ajax({
	url:  domain+"cfc/logindb.cfc?method=logindb",
	var:$(".form_dev").serialize(),
		type:"post",
		cache: false,
		success:function(html){
			alert(html);
		}
	});

});


  $('[data-toggle="tooltip"]').tooltip();   
 function tabs_select(tabs_select){
	 $("table[class='table schedultinter']").hide();
	 $("table[id='table_lay"+tabs_select+"']").show();
	 
 }
function assignment(id){
	$("#schedule_interview_modal").modal();
 }
function delete_candidate(id){
	$("#delete_modal").modal();
	
} 
function view_candidate(id){
	$("#viewcandidate_modal").modal();
	
} 
function edit_candidate(id){
	$("#cn_name").val("Chithambaram");
	 $("#candidateadd_modal").modal();
}