<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Candidate List</title>
       <cfinclude template="parts/header_include.cfm"> 
   </head>
   <body>
      <!--Modal for View Candidate-->
      <div class="modal fade" id="viewcandidate_modal" role="dialog">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">View Candidate</h4>
               </div>
               <div class="modal-body">
                  <div class="box-body form-horizontal" id="view_candidate_modal_div">
                     <div class="form-group form-row">
                        <label class="control-label col-sm-6">Name :</label>
                        <div class="col-sm-6 row-top">
                           Chithambaram N
                        </div>
                     </div>
                     <div class="form-group form-row">
                        <label class="control-label col-sm-6">Designation :</label>
                        <div class="col-sm-6 row-top">
                           Software Developer
                        </div>
                     </div>
                     <div class="form-group form-row">
                        <label class="control-label col-sm-6">Email :</label>
                        <div class="col-sm-4 row-top">
                           asdsad@gmail.com
                        </div>
                     </div>
                     <div class="form-group form-row">
                        <label class="control-label col-sm-6">Contact Number :</label>
                        <div class="col-sm-4 row-top">
                           dfgfdg
                        </div>
                     </div>
                     <div class="form-group form-row">
                        <label class="control-label col-sm-6">Location :</label>
                        <div class="col-sm-4 row-top">
                           asdsad
                        </div>
                     </div>
                     <div class="form-group form-row">
                        <label class="control-label col-sm-6">Applied For :</label>
                        <div class="col-sm-4 row-top">
                           Coldfusion
                        </div>
                     </div>
                     <div class="form-group form-row">
                        <label class="control-label col-sm-6">Experience :</label>
                        <div class="col-sm-4 row-top">
                           2 years
                        </div>
                     </div>
                     <div class="form-group form-row">
                        <label class="control-label col-sm-6">Current Ctc :</label>
                        <div class="col-sm-4 row-top">
                           ******
                        </div>
                     </div>
                     <div class="form-group form-row">
                        <label class="control-label col-sm-6">Expected CTC :</label>
                        <div class="col-sm-4 row-top">
                           *****************
                        </div>
                     </div>
                     <div class="form-group form-row">
                        <label class="control-label col-sm-6">Skill:</label>
                        <div class="col-sm-4 row-top">
                           Coldfusion,mysql,sql,java,php,.net,angular-js,react js
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!--Modal for Delete -->	
      <div class="modal fade" id="delete_modal" role="dialog">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
                  <p class="notify_pops">Please confirm to delete interview candidate.</p>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-success">Yes</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
               </div>
            </div>
         </div>
      </div>
      <!--Modal for Schedule Interview -->
      <div class="modal fade" id="schedule_interview_modal" role="dialog">
         <div class="modal-dialog modal-md">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">Schedule Interview</h4>
               </div>
               <div class="modal-body">
                  <div class="row" class="add_candidate_form_div">
                     <form id="add_candidate_form">
                        <div class="form-row">
                           <div class="form-group col-md-2">
                              <label for="date">Date:</label>
                           </div>
                           <div class="form-group col-md-4">
                              <input type="date" class="form-control" id="schedule_date" >
                           </div>
                           <div class="form-group col-md-2">
                              <label for="date">Time:</label>
                           </div>
                           <div class="form-group col-md-4">
                              <input type="time" class="form-control" id="schedule_time">
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-3">
                              <label for="inter_pan">Interview Panel:</label>
                           </div>
                           <div class="form-group col-md-6">
                              <select multiple class="form-control" id="schedule_interview_panel">
                                 <option>karthick</option>
                                 <option>sumesh</option>
                                 <option>nagesh</option>
                              </select>
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-12">
                              <button type="submit" class="btn btn-primary">Schedule Candidate</button>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Modal For Candidate Add-->
      <div class="modal fade" id="candidateadd_modal" role="dialog">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">Add Candidate</h4>
               </div>
               <div class="modal-body">
                  <div class="row">
                     <form id="add_candidate_form" action="asdsa">
                        <div class="form-row">
                           <div class="form-group col-md-6">
                              <label for="usrname">Candidate Name</label>
                              <input type="text" class="form-control" id="cn_name" placeholder="Candidate Name">
                           </div>
                           <div class="form-group col-md-6">
                              <label for="psw">Applied For</label>
							  <select  class="form-control">
								 <option value="">--Please Select--</option>
								 <option value="1">Php Developer</option>
								 <option value="2">Coldfusion Developer</option>
								 <option value="3">Angular</option>
								 <option value="4">Android</option>
							  </select>
                         
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-6">
                              <label for="designation">Designation</label>
                              <select  class="form-control">
                                 <option value="">--Please Select--</option>
                                 <option value="1">Team Lead</option>
                                 <option value="2">Senior Developer</option>
                                 <option value="3">Jr Developer</option>
                              </select>
                           </div>
                           <div class="form-group col-md-6">
                              <label for="con_number">Contact Number</label>
                              <input type="number" class="form-control" id="cn_contact_no" placeholder="Contact Number">
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-6">
                              <label for="email">Email</label>
                              <input type="email" class="form-control" id="cn_email" placeholder="Email">
                           </div>
                           <div class="form-group col-md-6">
                              <label for="experience">Experience</label>
                              <input type="number" class="form-control" id="cn_experience" placeholder="Experience">
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-6">
                              <label for="loc">Location</label>
                              <input type="text" class="form-control" id="cn_location" placeholder="Location">
                           </div>
                           <div class="form-group col-md-6">
                              <label for="current_cmny">Current Company</label>
                              <input type="number" class="form-control" id="cn_current_company" placeholder="Current Company">
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-6">
                              <label for="current_ctc">Current Ctc</label>
                              <input type="text" class="form-control" id="cn_current_ctc" placeholder="Current Ctc">
                           </div>
                           <div class="form-group col-md-6">
                              <label for="expected_ctc">Expected Ctc</label>
                              <input type="number" class="form-control" id="cn_expected_ctc" placeholder="Expected Ctc">
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-6">
                              <label for="current_ctc">Current Company</label>
                              <input type="text" class="form-control" id="cn_current_company" placeholder="Current Company">
                           </div>
                           <div class="form-group col-md-6">
                              <label for="notice Period">Resume Upload</label>
                              <input type="file" class="form-control" id="cn_resume_upload">
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-6">
                              <label for="current_ctc">skills</label>
                              <input type="text" class="form-control" id="tags" >
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-12">
                              <button type="submit" class="btn btn-primary">Add Candidate</button>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
               <div class="modal-footer">  
               </div>
            </div>
         </div>
      </div>
      <div class="container-fluid" >
         <div  class="row content">
            <div class="responsive_bar"><i class="fa fa-bars"></i></div>
            <div id="navigation-app" class="col-xs-2 sidenav">
               <div id="logo_navs">
                  <img alt="crm"  src="Assets/images/crm.png" class="img-responsive">
                  <div class="responsive_tag">
                     <i class="fa fa-arrow-left"></i>
                  </div>
               </div>
               <div id="logo_navs2">
                  <div class="dropdown">
                     <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                     Chithambaram<span class="glyphicon glyphicon-chevron-down"></span>
                     </button>
                     <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Logout</a>
                     </div>
                  </div>
               </div>
               <div id="nav_plate">
                  <cfinclude template="parts/nav_include.cfm">
               </div>
            </div>
            <section class="col-xs-12 col-md-10">
               <header class="jumbotron">
                  <h2>Candidate List </h2>
               </header>
               <div id="content_real">
                  <div id="content_layout">
                     <div class="top_tabelements row">
                        <div class="col-lg-7">
                           <div class="row">
                              <div class="col-md-3 col-lg-3 form-group"><input type="text" class="form-control" placeholder="Category"></div>
                              <div class="col-md-3 col-lg-3 form-group"><input type="text" class="form-control" placeholder="Job Position"></div>
                              <div class="col-md-3 col-lg-3 form-group"><input type="text" class="form-control" placeholder="Experience"></div>
                              <div class="col-md-3 col-lg-3 form-group">
                                 <button class="btn btn-info"><span>Filter</span></button>
                              </div>
                           </div>
                        </div>
                        <div class="col-lg-5">
                           <div class="row">
                              <div class="col-sm-6">
                                 <div class="row">
                                    <div class="expo_pdf col-xs-5">
                                       <button type="button" class="btn btn-info">
                                       <span class="glyphicon glyphicon-export"></span> Export
                                       </button>
                                    </div>
                                    <div class="add_candidate_but col-xs-5">
                                       <button type="button" class="btn btn-info">
                                       <span class="glyphicon glyphicon-plus-sign"></span> Add
                                       </button>
                                    </div>
                                 </div>
                              </div>
                              <div class="col-sm-6">
                                 <form class="search_form row" action="action_page.php">
                                    <div class="col-md-4">
                                       <input type="text" placeholder="Search.." name="search">
                                    </div>
                                    <div class="col-md-6">
                                       <button type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                     <main class="table-responsive">
                        <table id="table_lay" class="table">
                           <tr>
                              <th>Name</th>
                              <th>Email</th>
                              <th class="table_active">Experience</th>
                              <th>Post Applied</th>
                              <th>Action</th>
                           </tr>
                           <tr>
                              <td>Name</td>
                              <td>Esdsa@asdsa.com</td>
                              <td>10 Yrs</td>
                              <td>Coldfusion</td>
                              <td>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"  onclick="edit_candidate('id')" class="icon_vox can_list cl_edit"><span class="material-icons" >edit</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Delete"  onclick="delete_candidate('id')" class="icon_vox"><span class="material-icons">delete</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="View" onclick="view_candidate('id')" class="icon_vox"><span class="material-icons">pageview</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Scheduled" onclick="return false" class="icon_vox schedule_active"><span class="material-icons">assignment</span></a>
                              </td>
                           </tr>
                           <tr>
                              <td>Name</td>
                              <td>Esdsa@asdsa.com</td>
                              <td>10 Yrs</td>
                              <td>Coldfusion</td>
                              <td>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"  onclick="edit_candidate('id')" class="icon_vox can_list cl_edit"><span class="material-icons" >edit</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Delete"  onclick="delete_candidate('id')" class="icon_vox"><span class="material-icons">delete</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="View" onclick="view_candidate('id')" class="icon_vox"><span class="material-icons">pageview</span></a>
                                 <a href="#"  data-toggle="tooltip" data-placement="bottom" title="Schedule"  onclick="assignment('id')" class="icon_vox"><span class="material-icons">assignment</span></a>
                              </td>
                           </tr>
                           <tr>
                              <td>Name</td>
                              <td>Esdsa@asdsa.com</td>
                              <td>10 Yrs</td>
                              <td>Coldfusion</td>
                              <td>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"  onclick="edit_candidate('id')" class="icon_vox can_list cl_edit"><span class="material-icons" >edit</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Delete"  onclick="delete_candidate('id')" class="icon_vox"><span class="material-icons">delete</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="View" onclick="view_candidate('id')" class="icon_vox"><span class="material-icons">pageview</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Scheduled" onclick="return false" class="icon_vox schedule_active"><span class="material-icons">assignment</span></a>
                              </td>
                           </tr>
                           <tr>
                              <td>Name</td>
                              <td>Esdsa@asdsa.com</td>
                              <td>10 Yrs</td>
                              <td>Coldfusion</td>
                              <td>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"  onclick="edit_candidate('id')" class="icon_vox can_list cl_edit"><span class="material-icons" >edit</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Delete"  onclick="delete_candidate('id')" class="icon_vox"><span class="material-icons">delete</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="View" onclick="view_candidate('id')" class="icon_vox"><span class="material-icons">pageview</span></a>
                                 <a href="#"  data-toggle="tooltip" data-placement="bottom" title="Schedule"  onclick="assignment('id')" class="icon_vox"><span class="material-icons">assignment</span></a>
                              </td>
                           </tr>
                           <tr>
                              <td>Name</td>
                              <td>Esdsa@asdsa.com</td>
                              <td>10 Yrs</td>
                              <td>Coldfusion</td>
                              <td>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"  onclick="edit_candidate('id')" class="icon_vox can_list cl_edit"><span class="material-icons" >edit</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Delete"  onclick="delete_candidate('id')" class="icon_vox"><span class="material-icons">delete</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="View" onclick="view_candidate('id')" class="icon_vox"><span class="material-icons">pageview</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Scheduled" onclick="return false" class="icon_vox schedule_active"><span class="material-icons">assignment</span></a>
                              </td>
                           </tr>
                           <tr>
                              <td>Name</td>
                              <td>Esdsa@asdsa.com</td>
                              <td>10 Yrs</td>
                              <td>Coldfusion</td>
                              <td>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"  onclick="edit_candidate('id')" class="icon_vox can_list cl_edit"><span class="material-icons" >edit</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Delete"  onclick="delete_candidate('id')" class="icon_vox"><span class="material-icons">delete</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="View" onclick="view_candidate('id')" class="icon_vox"><span class="material-icons">pageview</span></a>
                                 <a href="#"  data-toggle="tooltip" data-placement="bottom" title="Schedule"  onclick="assignment('id')" class="icon_vox"><span class="material-icons">assignment</span></a>
                              </td>
                           </tr>
                           <tr>
                              <td>Name</td>
                              <td>Esdsa@asdsa.com</td>
                              <td>10 Yrs</td>
                              <td>Coldfusion</td>
                              <td>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"  onclick="edit_candidate('id')" class="icon_vox can_list cl_edit"><span class="material-icons" >edit</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Delete"  onclick="delete_candidate('id')" class="icon_vox"><span class="material-icons">delete</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="View" onclick="view_candidate('id')" class="icon_vox"><span class="material-icons">pageview</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Scheduled" onclick="return false" class="icon_vox schedule_active"><span class="material-icons">assignment</span></a>
                              </td>
                           </tr>
                           <tr>
                              <td>Name</td>
                              <td>Esdsa@asdsa.com</td>
                              <td>10 Yrs</td>
                              <td>Coldfusion</td>
                              <td>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"  onclick="edit_candidate('id')" class="icon_vox can_list cl_edit"><span class="material-icons" >edit</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Delete"  onclick="delete_candidate('id')" class="icon_vox"><span class="material-icons">delete</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="View" onclick="view_candidate('id')" class="icon_vox"><span class="material-icons">pageview</span></a>
                                 <a href="#"  data-toggle="tooltip" data-placement="bottom" title="Schedule"  onclick="assignment('id')" class="icon_vox"><span class="material-icons">assignment</span></a>
                              </td>
                           </tr>
                           <tr>
                              <td>Name</td>
                              <td>Esdsa@asdsa.com</td>
                              <td>10 Yrs</td>
                              <td>Coldfusion</td>
                              <td>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"  onclick="edit_candidate('id')" class="icon_vox can_list cl_edit"><span class="material-icons" >edit</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Delete"  onclick="delete_candidate('id')" class="icon_vox"><span class="material-icons">delete</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="View" onclick="view_candidate('id')" class="icon_vox"><span class="material-icons">pageview</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Scheduled" onclick="return false" class="icon_vox schedule_active"><span class="material-icons">assignment</span></a>
                              </td>
                           </tr>
                           <tr>
                              <td>Name</td>
                              <td>Esdsa@asdsa.com</td>
                              <td>10 Yrs</td>
                              <td>Coldfusion</td>
                              <td>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"  onclick="edit_candidate('id')" class="icon_vox can_list cl_edit"><span class="material-icons" >edit</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="Delete"  onclick="delete_candidate('id')" class="icon_vox"><span class="material-icons">delete</span></a>
                                 <a href="#" data-toggle="tooltip" data-placement="bottom" title="View" onclick="view_candidate('id')" class="icon_vox"><span class="material-icons">pageview</span></a>
                                 <a href="#"  data-toggle="tooltip" data-placement="bottom" title="Schedule"  onclick="assignment('id')" class="icon_vox"><span class="material-icons">assignment</span></a>
                              </td>
                           </tr>
                        </table>
                     </main>
                     <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li class="active"><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">&raquo;</a></li>
                     </ul>
                  </div>
               </div>
            </section>
         </div>
      </div>
      <cfinclude template="parts/footer_include.cfm"> 
   </body>
</html>