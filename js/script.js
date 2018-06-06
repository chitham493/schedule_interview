  $(".add_panel_members_but").click(function(){
   
 $("#panelmemberadd_modal").modal();
   
 });
    $("#panelmemberedit_modal").on("submit", "#form_editmembers", function(e) {
      e.preventDefault();
      var formData = new FormData(this);
      $.ajax({
            type: 'POST',
            url: domain + "cfc/database.cfc?method=editpanelmembers",
            data:formData,
        cache:false,
        contentType: false,
        processData: false,
            success: function(result) {
              result=$.trim(result);
                if (result == "success") {
                    $(".modal-content").html("<div class='msg_header'><h3>Edited Successfully!!!</h3></div>");
                    setTimeout(function() {
                      location.reload();
                    }, 3000);
                }
             //$("#myModal").css("display", "block");
            }
        });

   });
   $("#panelmemberadd_modal").on("submit", "#form_addmembers", function(e) {
      e.preventDefault();
      var formData = new FormData(this);
      $.ajax({
            type: 'POST',
            url: domain + "cfc/database.cfc?method=addpanelmembers",
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
                }
             //$("#myModal").css("display", "block");
            }
        });

   });
  $('#panel_members_table').DataTable( {
        "bProcessing": true,
              "bServerSide": true,
               "responsive": true,
              "sAjaxSource": domain +'panel/cfc/panel_listmembers.cfc?method=dataTable',
              "lengthMenu": [[5,10, 25, 50], [5,10, 25, 50]],
              "rowReorder": {
            selector: 'td:nth-child(2)'
                 },
              columns:
                      [  
                      
                       { title:'Id',name:"PanelId",class: "panelmember_list_column" },
                       { title:'Name',name:"FirstName",class: "panelmember_list_column" },
                       { title:'Email',name:"Email",class: "panelmember_list_column" },
                       { title:'Designation',name:"Designation",class: "panelmember_list_column" },
                          {
                                title: "Action",
                                orderable: false,
                                data: null,
                                class: "dt-head-center",
                                'render': function (data, type, row) {
                                  
                   return '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_panelmember(\''+row[0]+'\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Delete\" class=\"icon_vox \" onclick=\"return delete_panelmember(\''+row[0]+'\')\" data-column=\"'+row[0]+'\" ><span class=\"material-icons\">delete<\/span><\/a>'
               }
                            }
                      ]
    } );
  function addmembers_to(id){

      $.ajax({
      url:  domain+"cfc/database.cfc?method=membersinpanel",
      type:"POST",
      data:{id:id},
      success:function(html){
        $(".add_memberinpanel_div").html(html);
        $("#membersinpanel_modal").modal();
        $("#select_membersinpanel").select2({
          placeholder: "Select Members"
          });
            $.ajax({
                url:  domain+"cfc/database.cfc?method=getpaneldetails",
                type:"POST",
                data:{panelid:id},
                success:function(response){
                  response=$.trim(response);
                if (typeof response !== 'undefined' || response =="") {
                      response = response.replace('"','');
                      response = response.replace('"','');
                      $("#PanelMembers_id").val(response);
                      result = response.split(',');
                      $("#select_membersinpanel").val(result); 
                      $("#select_membersinpanel").trigger('change'); 
                   }
                }
              });
        }
       });

  }
$("#membersinpanel_modal").on("submit", "#membersinpanel", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
      $.ajax({
        url:  domain+"cfc/database.cfc?method=panelmemberadd_form",
        type:"POST",
        data:formData,
        cache:false,
        contentType: false,
        processData: false,
        success:function(result){
          result=$.trim(result);
                if (result == "success") {
                    $(".modal-content").html("<div class='msg_header'><h3>Added/Deleted Successfully!!!</h3></div>");
                    setTimeout(function() {
                      location.reload();
                    }, 3000);
                }
        }
      });
  });
 function edit_panelmember(id){
     $.ajax({
      url:  domain+"cfc/database.cfc?method=edit_panelmember",
      type:"POST",
      data:{action_id:parseInt(id)},
      success:function(html){
        $(".edit_panelmember_form_div").html(html);
        $("#panelmemberedit_modal").modal();
      }
    });

 }
 function delete_panelmember(id){
  $("#delete_modal_panelmember").modal();
  $("#action_id").val(id);
  $("#action_page").val("delete_panelmember");
 }
 $("#delete_modal_panelmember").on("click", "#confirm_delete_panelmember", function(e) {
      var action_page=$("#action_page").val();
      var action_id=$("#action_id").val();
      if(action_page=='delete_panelmember') {
          panelmember_list_delete(action_id);
      }
      
   });

 function panelmember_list_delete(action_id){
  $.ajax({
    url:  domain+"cfc/database.cfc?method=panelmember_list_delete",
    type:"POST",
    data:{action_id:parseInt(action_id)},
    success:function(html){
      location.reload();

    }
  }); 
 }
 function edit_panel(id){
   $.ajax({
    url:  domain+"cfc/database.cfc?method=edit_panel",
    type:"POST",
    data:{action_id:parseInt(id)},
    success:function(html){
      $(".edit_panel_form_div").html(html);
      $("#paneledit_modal").modal();
    }
  });
}
 $(".edit_panel_form_div").on("submit", "#edit_panel_form", function(e) {
  e.preventDefault();
  var formData = new FormData(this);
  $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=editpanel_save",
        data:formData,
    cache:false,
    contentType: false,
    processData: false,
        success: function(result) {
          result=$.trim(result);
          if (result == "success") {
              $(".modal-content").html("<center><div class='msg_header'><h3>Edited Successfully!!!</h3></div></center>");
              setTimeout(function() {
                location.reload();
              }, 3000);
          }
        }
    });

  });

 $(".add_panel_form_div").on("submit", "#add_panel_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
  $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=insertpanel",
        data:formData,
    cache:false,
    contentType: false,
    processData: false,
        success: function(result) {
          result=$.trim(result);
          if (result == "success") {
              $(".modal-content").html("<center><div class='msg_header'><h3>Insert Successfully!!!</h3></div></center>");
              setTimeout(function() {
                location.reload();
              }, 3000);
          }
        }
    });

});
function delete_panel(id){
  $("#delete_modal_panel").modal();
  $("#action_id").val(id);
  $("#action_page").val("delete_panel");
}
$("#confirm_delete_panel").click(function(){
  var action_id=$("#action_id").val();
  $.ajax({
    url:  domain+"cfc/database.cfc?method=delete_panel",
    type:"POST",
    data:{action_id:parseInt(action_id)},
    success:function(html){
      alert("success");
      location.reload();
    }
  }); 
});
 $('#panel_list').DataTable( {
        "bProcessing": true,
              "bServerSide": true,
               "responsive": true,
              "sAjaxSource": domain +'panel/cfc/panel_list.cfc?method=dataTable',
              "lengthMenu": [[5,10, 25, 50], [5,10, 25, 50]],
              "rowReorder": {
            selector: 'td:nth-child(2)'
                 },
              columns:
                      [  
                      
                       { title:'Id',name:"PanelId",class: "panel_list_column" },
                       { title:'Name',name:"Name",class: "panel_list_column" },
                          {
                                title: "Action",
                                orderable: false,
                                data: null,
                                class: "dt-head-center",
                                'render': function (data, type, row) {
                                  
                   return '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_panel(\''+row[0]+'\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" onclick=\"return delete_panel(\''+row[0]+'\')\"  data-placement=\"bottom\" title=\"Delete\" class=\"icon_vox delete_candidate\" data-column=\"'+row[0]+'\" ><span class=\"material-icons\">delete<\/span><\/a><a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Add Members\" class=\"icon_vox \" onclick=\"return addmembers_to(\''+row[0]+'\')\" ><span class=\"material-icons\">add<\/span><\/a>'
               }
                            }
                      ]
    } );
$(".add_panel_but").click(function(){
  $("#paneladd_modal").modal();
 });
  $(".add_panel_form_div").on("submit", "#add_panel_form", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
  $.ajax({
        type: 'POST',
        url: domain + "cfc/database.cfc?method=insertpanel",
        data:formData,
    cache:false,
    contentType: false,
    processData: false,
        success: function(result) {
          result=$.trim(result);
          if (result == "success") {
              $(".modal-content").html("<center><div class='msg_header'><h3>Insert Successfully!!!</h3></div></center>");
              setTimeout(function() {
                location.reload();
              }, 3000);
          }
        }
    });

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
         //$("#myModal").css("display", "block");
        }
    });
 });

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
              "sAjaxSource": domain +'cfc/datatables.cfc?method=dataTable',
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
                                'render': function (data, type, row) {
                                  
                   return '<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_candidate(\''+row[0]+'\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Delete\" class=\"icon_vox delete_candidate\" data-column=\"'+row[0]+'\" ><span class=\"material-icons\">delete<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\"  data-column=\"'+row[0]+'\" title=\"View\"  class=\"icon_vox view_candidate\"><span class=\"material-icons\">pageview<\/span><\/a>\r\n<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Scheduled\" onclick=\"return false\" class=\"icon_vox schedule_active\"><span class=\"material-icons\">assignment<\/span><\/a>'
               }
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
 $("#delete_modal").on("click", "#confirm_delete_candidates", function(e) {
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
			location.reload();

		}
	}); 
 }

 $("#table_lay").on("click", ".delete_candidate", function(e) {
   
      $("#action_id").val($(this).attr("data-column"));
      $("#action_page").val("candidate_list");
      $("#delete_modal").modal();
   });
 $("#table_lay").on("click", ".view_candidate", function(e) {
     var action_id= $(this).attr("data-column");
      $.ajax({
		url:  domain+"cfc/database.cfc?method=view_candidate",
		type:"POST",
		data:{action_id:parseInt(action_id)},
		success:function(html){
			$("#view_candidate_modal_div").html(html);
			$("#viewcandidate_modal").modal();
		}
	});

   });
  
});
 $(".add_candidate_but").click(function(){
   
 $("#candidateadd_modal").modal();
   
 });
function edit_candidate(id){
  
  $.ajax({
    url:  domain+"cfc/database.cfc?method=edit_candidate",
    type:"POST",
    data:{action_id:parseInt(id)},
    success:function(html){
      $("#edit_candidate_modal").html(html);
      $("#candidateedit_modal").modal();
    }
  });
}
$(".responsive_tag").click(function() {
    $("#navigation-app").fadeOut("slow");
}); 
$(".responsive_bar").click(function() {
    $("#navigation-app").fadeIn("slow");
});
function assignment(id){
  $("#schedule_interview_modal").modal();
 }
$("#cn_resume_skills").select2({
	  placeholder: "Skills"
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