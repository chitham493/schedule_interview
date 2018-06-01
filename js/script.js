$(".responsive_tag").click(function() {
    $("#navigation-app").fadeOut("slow");
}); 
$(".responsive_bar").click(function() {
    $("#navigation-app").fadeIn("slow");
});
 $(".add_candidate_but").click(function(){
	 
 $("#candidateadd_modal").modal();
	 
 });
 $(".add_candidate_form_div").on("submit", "#add_candidate_form", function(e) {
	e.preventDefault();
	var formData = new FormData(this);
 	$.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=insertcandiate",
        data:formData,
		cache:false,
		contentType: false,
		processData: false,
        success: function(result) {
      		result=$.trim(result);
            if (result == "success") {
                $(".modal-content").html("<div class='msg_header'><h3>Insert Successfully!!!</h3></div>");
                setTimeout(function() {
                  location.reload();
                }, 3000);
            }else if(result == "fileExtension"){
            	alert("Invalid fileExtension");
            }else if(result == "FileLimit"){
            	alert("FileLimit Should not Exceed 1.5Mb");
            }
         $("#myModal").css("display", "block");
        }
    });

 });
$(".form_dev").submit(function(e){
	e.preventDefault();
	$.ajax({
		url:  domain+"cfc/logindb.cfc?method=logindb",
		data:$(this).serialize(),
		type:"POST",
		success:function(html){
			if($.trim(html)=='Success'){
			window.location.href = domain+"home.cfm";
		}else{
			$(".error_disp_loggs").html('invalid Login');
		}
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
function edit_candidate(id){
	$("#cn_name").val("Chithambaram");
	 $("#candidateadd_modal").modal();
}
$(function(){


  var globalVars = {
      tableConfigs: null,
      tableId:$('table#table_lay')
  }

  var main = {
      register: function(){
        main.UI.register.apply();
        main.EVENTS.register.apply();
      },
      UI: {
        register: function(){
          main.UI.buildTable.apply();
        },
        buildTable: function(){
          globalVars.tableConfigs = globalVars.tableId.DataTable( {
              "bProcessing": true,
              "bServerSide": true,
               "responsive": true,
              "sAjaxSource": 'cfc/datatables.cfc?method=dataTable',
              "lengthMenu": [[5,10, 25, 50], [5,10, 25, 50]],
              "rowReorder": {
            selector: 'td:nth-child(2)'
                 },
              columns:
                      [  
                      
                       { title:'Id',name:"CandidateId",class: "candidate_column0" },
                       { title:'Name',name:"FIRSTNAME",class: "candidate_column1" },
                          { title:'Email',name:"EMAIL" ,class: "candidate_column2"},
                          { title:'Experience',name:"EXPERIENCE",class: "candidate_column3" },
                          { title:'Post Applied',name:"JobPosition",class: "candidate_column4" },
                          {
                                title: "Action",
                                orderable: false,
                                data: null,
                                class: "dt-head-center",
                                defaultContent: [
                                    "<center>",
                                    "<a href=\"##\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_candidate(\'#CandidateId#\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"##\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Delete\" class=\"icon_vox delete_candidate\" data-column=\"#CandidateId#\"><span class=\"material-icons\">delete<\/span><\/a>\r\n<a href=\"##\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"View\"  class=\"icon_vox view_candidate\"><span class=\"material-icons\">pageview<\/span><\/a>\r\n<a href=\"##\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Scheduled\" onclick=\"return false\" class=\"icon_vox schedule_active\"><span class=\"material-icons\">assignment<\/span><\/a>",
                                    "</center>"
                                ].join(""),
                                width: "150px"
                            }
                      ]
          });
        }
      },
      ROUTINES: {
        register: function(){
          main.ROUTINES.getSelectedRow.apply();
        },
        getSelectedRow: function(obj){
          return {
                    index : $(obj).closest('tr').index(),
                    data: globalVars.tableId.dataTable().fnGetData($(obj).closest('tr').index())
                  }
        }
      },
      EVENTS: {
        register: function(){
          main.EVENTS.eventButtonRow.apply();
        },
        eventButtonRow: function(){
          globalVars.tableId
                  .on('preXhr.dt', function(e, setting, data) {
                    console.log(data);
                  })
                  .on('xhr.dt', function(e, setting, data) {
                  })
                  .on('draw.dt', function() {
                      main.EVENTS.gridBtnTable.apply();
                  });

        },
        gridBtnTable: function(){
          var oBtn = $('button[data-tag="pilih"]');
              oBtn.unbind().bind('click',function(){
                var that = $(this).attr('data-tag');
                  if(that=='pilih'){
                    var data = main.ROUTINES.getSelectedRow($(this));
                    console.log(data); //GET POSITION ID DATA AND ALL DATA
                    console.log(data.data[1]); //SEPCIFIK DATA YOU CHICE
                  }
              });
        }
      }
  } //END MAIN
 var x= main.register.apply();
  
 $("#table_lay tfoot input").on( 'keyup', function () {
      var candidate_columnfo0= $(".candidate_columnfo0").val();
      var candidate_columnfo1= $(".candidate_columnfo1").val();
      var candidate_columnfo2= $(".candidate_columnfo2").val();
      var candidate_columnfo3= $(".candidate_columnfo3").val();

       globalVars.tableConfigs.column(0).search(candidate_columnfo0).column(1).search(candidate_columnfo1).column(2).search(candidate_columnfo2).column(3).search(candidate_columnfo3).draw();
        
    } );
 $("#delete_modal").on("click", "#confirm_delete_interview", function(e) {
   		var action_page=$("#action_page").val();
   		var action_id=$("#action_id").val();
   		if(action_page=='candidate_list') {
        	candidate_list_delete(action_id);
   		}
      
   });
 function candidate_list_delete(action_id){
 	$.ajax({
		url:  domain+"cfc/database.cfc?method=delete_candidate",
		type:"POST",
		data:{action_id:parseInt(action_id)},
		success:function(html){
			alert("success");
			location.reload();

		}
	}); 
 }
 $("#table_lay").on("click", ".delete_candidate", function(e) {
   
      $("#action_id").val($(this).parent().parent().parent().find('.candidate_column0').text());
      $("#action_page").val("candidate_list");
      $("#delete_modal").modal();
   });
 $("#table_lay").on("click", ".view_candidate", function(e) {
     var action_id= $(this).parent().parent().parent().find('.candidate_column0').text();
      $.ajax({
		url:  domain+"cfc/database.cfc?method=view_candidate",
		type:"POST",
		data:{action_id:parseInt(action_id)},
		success:function(html){
			$("#viewcandidate_modal").modal(html);
		}
	});

   });
  
});

$("#cn_resume_skills").select2({
	  placeholder: "Skills"
});