<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Skills List</title>
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
                  <h2>Skills List </h2>
               </header>
               <div id="content_real">
                  <div id="content_layout">
                     <div class="top_tabelements row">
                       
                        <div class="col-lg-5">
                           <div class="row">
                              <div class="col-sm-6">
                                 <div class="row">
                                    <div class="add_skills_but col-xs-5">
                                       <button type="button" class="btn btn-info">
                                          <span class="glyphicon glyphicon-plus-sign"></span> Add
                                       </button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <main class="table">
                        <table id="skills_list" class="table table-responsive">
                        </table>
                     </main>
                  </div>
               </div>
            </section>
         </div>
      </div>
      <cfinclude template="../parts/footer_include.cfm"> 
   </body>
</html>