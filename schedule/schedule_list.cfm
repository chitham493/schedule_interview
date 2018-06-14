<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Schduele List</title>
       <cfinclude template="../parts/header_include.cfm">
       <cfinclude template="../parts/login_check.cfm">
   </head>
   <body>
      <cfinclude template="../parts/modal_include.cfm">
      <div class="container-fluid" >
         <div  class="row content">
            <cfinclude template="../parts/nav_include.cfm">
            <section class="col-xs-12 col-md-10">
               <header class="jumbotron">
                  <h2>Schedule List </h2>
               </header>
               <div id="content_real">
                  <div id="content_layout">
                     <div class="row schedule_tabs_div">
                        <div class="row tabs_shift  col-sm-12">
                           <ul class="nav nav-tabs">
                              <li class="active"><a data-toggle="tab" onclick="return tabs_select('1')" href="#table_lay_div">All</a></li>
                              <li><a data-toggle="tab" onclick="return tabs_select('2')" href="#table_lay_div">Scheduled Candidates</a></li>
                              <li><a data-toggle="tab" onclick="return tabs_select('3')" href="#table_lay_selected_div" class="selected_candidate">Selected Candidates</a></li>
                           </ul>
                        </div>
                      </div>
                     <main class="">
                        <div class="table table_lay1"  id="schedultinter">
                           <table id="table_schedule_all" class="table table-responsive">
                           </table>
                        </div>
                        <div class="table table_lay2" id="schedultinter">
                           <table id="table_schedule_candidate" class="table table-responsive">
                              
                           </table>
                        </div>
                        <div class="table table_lay3"  id="schedultinter">
                           <table id="table_selected_candidate" class="table table-responsive">
                              
                           </table>
                        </div>
                     </main>
                  </div>
               </div>
            </section>
         </div>
      </div>
      <cfinclude template="../parts/footer_include.cfm"> 
   </body>
</html>