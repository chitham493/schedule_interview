<!DOCTYPE html>
   <html lang="en">
      <head>
         <title>Candidate List</title>
         <cfinclude template="parts/header_include.cfm">
         <cfinclude template="parts/login_check.cfm">
      </head>
      <body>
         <cfinclude template="parts/modal_include.cfm">
         <div class="container-fluid" >
            <div  class="row content">
               <cfinclude template="parts/nav_include.cfm">
               <section class="col-xs-12 col-md-10">
                  <header class="jumbotron">
                     <h2>Candidate List </h2>
                  </header>
                  <div id="content_real">
                     <div id="content_layout">
                        <div class="top_tabelements row">

                           <div class="col-lg-5">
                              <div class="row">
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <div class="expo_pdf col-xs-5">
                                          <a href="canlist_pdf.cfm" target="_Blank" type="button" class="btn btn-info">
                                             <span class="glyphicon glyphicon-export"></span> Export
                                          </a>
                                       </div>
                                       <div class="add_candidate_but col-xs-5">
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
                           <table id="table_lay" class="table table-responsive">
                              <tfoot>
                                 <tr>
                                    <th rowspan="1" colspan="1"></th>
                                    <th rowspan="1" colspan="1">
                                       <input type="text" placeholder="Search Name" data-column="0" class="candidate_columnfo0">
                                    </th>
                                    <th rowspan="1" colspan="1">
                                       <input type="text" placeholder="Search Email" class="candidate_columnfo1" data-column="1">
                                    </th>
                                    <th rowspan="1" colspan="1">
                                       <input  data-column="2" class="candidate_columnfo2" type="text" placeholder="Search Experience">
                                    </th>
                                    <th rowspan="1" colspan="1">
                                       <input type="text" class="candidate_columnfo3"  data-column="3" placeholder="Search Post-Applied">
                                    </th>
                                    <th></th>
                                 </tr>
                              </tfoot>
                           </table>
                        </main>
                     </div>
                  </div>
               </section>
            </div>
         </div>
         <cfinclude template="parts/footer_include.cfm"> 
      </body>
      </html>