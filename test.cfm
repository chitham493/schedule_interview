<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.9/css/dataTables.bootstrap.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <table class="table table-striped table-bordered table-hovered" id="displayData">
      </table>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function(){
 
  var globalVars = {
      tableConfigs: null,
      tableId:$('table#displayData')
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
          globalVars.tableConfigs = globalVars.tableId.dataTable( {
              "bProcessing": true,
              "bServerSide": true,
              "sAjaxSource": 'proses.cfc?method=dataTable',
              columns:
                      [   { title:'Name',name:"FIRSTNAME" },
                          { title:'Email',name:"EMAIL" },
                          { title:'Experience',name:"EXPERIENCE" },
                          { title:'Post Applied',name:"JobPosition" },
                          {
                                title: "Action",
                                orderable: false,
                                data: null,
                                class: "dt-head-center",
                                defaultContent: [
                                    "<center>",
                                    "<a href=\"##\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Edit\"  onclick=\"return edit_candidate(\'#CandidateId#\')\" class=\"icon_vox can_list cl_edit\"><span class=\"material-icons\" >edit<\/span><\/a>\r\n<a href=\"##\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Delete\"  onclick=\"delete_candidate(\'#CandidateId#\')\" class=\"icon_vox\"><span class=\"material-icons\">delete<\/span><\/a>\r\n<a href=\"##\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"View\" onclick=\"view_candidate(\'#CandidateId#\')\" class=\"icon_vox\"><span class=\"material-icons\">pageview<\/span><\/a>\r\n<a href=\"##\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Scheduled\" onclick=\"return false\" class=\"icon_vox schedule_active\"><span class=\"material-icons\">assignment<\/span><\/a>",
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
 
  main.register.apply();
});
</script>
 
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.9/js/dataTables.bootstrap.min.js"></script>
</body>
</html>