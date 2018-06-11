<!-- Modal For selecting rounds-->
<div class="modal fade" id="selecting_skills_modal" role="dialog">
   <div class="modal-dialog modal-md">
      <div class="modal-content">
         <form id="selecting_skills_form" type="post">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Select Skills</h4>
         </div>
         <div class="modal-body" id="selecting_skills_div">



         </div>  
         <div class="modal-footer">
         <div class="form-group col-md-12">
            <button type="submit" class="btn btn-primary">Save</button>
         </div>  
      </div> 
   </form >
   </div>
  </div>
</div>
<!-- Modal For Candidate Edit-->
<div class="modal fade" id="jobvacancyedit_modal" role="dialog">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Edit Job Vacancy</h4>
         </div>
         <div class="modal-body" id="jobvacancy_modal_div">

         </div>   
        
      <div class="modal-footer">  
      </div>
   </div>
  </div>
</div>
<!-- Modal For selecting rounds-->
<div class="modal fade" id="selectinground_modal" role="dialog">
   <div class="modal-dialog modal-md">
      <div class="modal-content">
         <form id="selectinground_form" type="post">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Select Rounds</h4>
         </div>
         <div class="modal-body" id="selectinground_div">



         </div>  
         <div class="modal-footer">
         <div class="form-group col-md-12">
            <button type="submit" class="btn btn-primary">Save</button>
         </div>  
      </div> 
   </form >
   </div>
  </div>
</div>
<!-- Modal For Panel Members Add-->
<div class="modal fade" id="job_vacancy_modal" role="dialog">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Add Job Position</h4>
         </div>
         <form action="" id="form_job_vacancy">
         <div class="modal-body row">
            <div class="job_vacancy_div">
                  <div class="form-row">
                     <label class="control-label col-sm-2">Job Name</label>
                     <div class="col-sm-4 form-group ">
                        <input type="text" pattern=".{3,35}" title="3 to 35 characters" class="form-control" id="JobPosition"  required name="JobPosition" placeholder="Job Name">
                     </div>
                     <label class="control-label col-sm-2">Job Code</label>
                     <div class="col-sm-4 form-group ">
                        <input type="text" pattern=".{1,35}" required title="1 to 35 characters" class="form-control" id="JobCode"  name="JobCode" placeholder="Job Code">
                     </div>
                  </div>
                  <div class="form-row ">
                     <label class="control-label col-sm-2">JobDescription</label>
                     <div class="col-sm-4 form-group ">
                        <textarea class="form-control" pattern=".{3,50}" required title="3 to 50 characters" id="JobDescription"  name="JobDescription">
                        </textarea>
                     </div>
                     <label class="control-label col-sm-2">JobResponsibilty</label>
                     <div class="col-sm-4 form-group ">
                        <textarea class="form-control" pattern=".{3,50}" required title="3 to 50 characters" id="JobResponsibilty"  name="JobResponsibilty">
                        </textarea>
                     </div>
                  </div>
                  <div class="form-row ">
                     <label class="control-label col-sm-2">StartDate</label>
                     <div class="col-sm-4 form-group ">
                        <input type="text"    required  class="form-control" id="StartDate"  name="StartDate">
                     </div>
                     <label class="control-label col-sm-2">EndDate</label>
                     <div class="col-sm-4 form-group ">
                        <input type="text" class="form-control"   required id="EndDate"  name="EndDate">
                     </div>
                  </div>
                  <div class="form-row ">
                     <label class="control-label col-sm-2">Vacancy</label>
                     <div class="col-sm-4 form-group ">
                        <input type="number"   pattern=".{5,20}" required title="5 to 20 characters"  class="form-control" id="Vacancy"  name="Vacancy" placeholder="Vacancy">
                     </div>
                  </div>
                  <div class="form-row ">
                     <label class="control-label col-sm-2">Rounds</label>
                     <div class="col-sm-4 form-group ">
                        <input type="number"   min="1" max="5" required  class="form-control" id="Rounds"  name="rounds" placeholder="Rounds">
                     </div>
                  </div>
   </div>
      </div>
      <div class="modal-footer">
         <div class="form-group col-md-12">
            <button type="submit" class="btn btn-primary">Add Panel Member</button>
         </div>  
      </div>
      </form>
   </div>
  </div>
</div>

<!-- Modal For Panel Members in Panels Add-->
<div class="modal fade" id="membersinpanel_modal" role="dialog">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Members in Panel</h4>
         </div>
         <form action="" id="membersinpanel" method="post">
         <div class="modal-body row">
            <div class="add_memberinpanel_div">
               
              
            </div>
         </div>
      <div class="modal-footer">
      <div class="form-group col-md-12">
                           <button type="submit" class="btn btn-primary">Save</button>
                        </div>  
      </div>
      </form>
   </div>
  </div>
</div>
<!--Modal for Delete panelMember -->   
<div class="modal fade" id="delete_modal_panelmember" role="dialog">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
         <div class="modal-body">
            <p class="notify_pops">Please confirm to delete panel Member.</p>
         </div>
         <div class="modal-footer">
            <button type="button" id="confirm_delete_panelmember" class="btn btn-success">Yes</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
         </div>
      </div>
   </div>
</div>
<!-- Modal For Panel Member  Edit-->
<div class="modal fade" id="panelmemberedit_modal" role="dialog">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <form action="" id="form_editmembers">
            <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">Edit Panel Member</h4>
               </div>
               <div class="modal-body">
                  <div class="row edit_panelmember_form_div">
                     
               </div>
            </div>
            <div class="modal-footer">  
               <div class="form-group col-md-12">
                  <button type="submit" class="btn btn-primary">Edit Panel Member</button>
               </div> 
            </div>
         </form>   
         
   </div>
  </div>
</div>
<!-- Modal For Panel Members Add-->
<div class="modal fade" id="panelmemberadd_modal" role="dialog">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Add Panel Members</h4>
         </div>
         <form action="" id="form_addmembers">
         <div class="modal-body row">
            <div class="add_panelmember_div">
                  <div class="form-row">
                     <label class="control-label col-sm-2">First Name</label>
                     <div class="col-sm-4 form-group ">
                        <input type="text" pattern="A-Za-z]{3,20}" title="3 to 20 characters" class="form-control" id="firstname"  name="firstname" placeholder="First Name">
                     </div>
                     <label class="control-label col-sm-2">Last Name</label>
                     <div class="col-sm-4 form-group ">
                        <input type="text" pattern="[A-Za-z]{3,20}" title="3 to 20 characters" class="form-control" id="lastname"  name="lastname" placeholder="Last Name">
                     </div>
                  </div>
                  <div class="form-row ">
                     <label class="control-label col-sm-2">Email</label>
                     <div class="col-sm-4 form-group ">
                        <input type="text" pattern=".{3,50}" title="3 to 50 characters" class="form-control" id="email"  name="email" placeholder="Email">
                     </div>
                     <label class="control-label col-sm-2">Phone</label>
                     <div class="col-sm-4 form-group ">
                        <input type="tel" pattern="^[0-9-+()]{3,15}" title="" class="form-control" id="phone"  name="phone" placeholder="Phone" maxlength="10">
                     </div>
                  </div>
                  <div class="form-row ">
                     <label class="control-label col-sm-2">User Name</label>
                     <div class="col-sm-4 form-group ">
                        <input type="text"   pattern=".{5,20}" required title="5 to 20 characters"  class="form-control" id="username"  name="username" placeholder="User Name">
                     </div>
                     <label class="control-label col-sm-2">Password</label>
                     <div class="col-sm-4 form-group ">
                        <input type="password" class="form-control"  pattern=".{5,20}" required title="5 to 20 characters" id="password"  name="password" placeholder="Password">
                     </div>
                  </div>
                  <div class="form-row ">
                     <label class="control-label col-sm-2">Designation</label>
                     <div class="col-sm-4  form-group">
                        <cfset  designation_list = database.designation_list()>
                        <select  class="form-control" name="designation" required>
                           <option value="">--Please Select--</option>
                             <cfoutput>
                                 <cfloop query="designation_list">
                                    <option value="#DesignationId#">#Name#</option>
                                 </cfloop>
                             </cfoutput>
                        </select>
                     </div>
                  </div>
   </div>
      </div>
      <div class="modal-footer">
      <div class="form-group col-md-12">
                           <button type="submit" class="btn btn-primary">Add Panel Member</button>
                        </div>  
      </div>
      </form>
   </div>
  </div>
</div>
<!--Modal for Delete panel -->   
<div class="modal fade" id="delete_modal_panel" role="dialog">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
         <div class="modal-body">
            <p class="notify_pops">Please confirm to delete panel.</p>
         </div>
         <div class="modal-footer">
            <button type="button" id="confirm_delete_panel" class="btn btn-success">Yes</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
         </div>
      </div>
   </div>
</div>
<!-- Modal For Panel Edit-->
<div class="modal fade" id="paneledit_modal" role="dialog">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Edit Panel</h4>
         </div>
         <div class="modal-body">
            <div class="row edit_panel_form_div">
               
         </div>
      </div>
      <div class="modal-footer">  
      </div>
   </div>
  </div>
</div>
<!-- Modal For Panel Add-->
<div class="modal fade" id="paneladd_modal" role="dialog">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Add Panel</h4>
         </div>
         <div class="modal-body">
            <div class="row add_panel_form_div">
               <form id="add_panel_form" action="" >
                  <div class="form-row">
                     <div class="form-group col-md-12">
                        <label for="usrname">Panel Name</label>
                        <input type="text" required class="form-control" name="panel_name" id="panel_name" pattern="[A-Za-z]{3,20}" title="3 to 20 characters" placeholder="Panel Name">
                     </div>
                    
                 </div>
                
               <div class="form-row">
                  <div class="form-group col-md-12">
                     <button type="submit" class="btn btn-primary">Add Panel</button>
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
<!--Modal for Delete Candidate-->	
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
            <button type="button" id="confirm_delete_candidates" class="btn btn-success">Yes</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
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
            <div class="row add_candidate_form_div">
               <form id="add_candidate_form" action="" enctype="multipart/form-data">
                  <div class="form-row">
                     <div class="form-group col-md-3">
                        <label for="usrname">First Name</label>
                        <input type="text" required class="form-control" name="cn_fname" id="cn_name" pattern="[A-Za-z]{3,20}" title="3 to 20 characters" placeholder="First Name">
                     </div>
                     <div class="form-group col-md-3">
                        <label for="usrname">Last Name</label>
                        <input type="text" class="form-control" pattern="[A-Za-z]{1,20}" name="cn_lname" id="cn_username" title="3 to 20 characters" placeholder="Last Name" required>
                     </div>
                     <div class="form-group col-md-6">
                        <label for="psw">Applied For</label>
                         <cfset  applied_for = database.applied_for()>
                        <select  name="cn_applied_for" class="form-control" required>
                          <option value="">--Please Select--</option>
                          <cfoutput>
                              <cfloop query="applied_for">
                                 <option value="#JobVacancyId#">#JobPosition#</option>
                              </cfloop>
                          </cfoutput>
                       </select>

                    </div>
                 </div>
                 <div class="form-row">
                  <div class="form-group col-md-6">
                     <label for="designation">Designation</label>
                     <cfset  designation_list = database.designation_list()>
                     <select  class="form-control" name="cn_designation" required>
                        <option value="">--Please Select--</option>
                          <cfoutput>
                              <cfloop query="designation_list">
                                 <option value="#DesignationId#">#Name#</option>
                              </cfloop>
                          </cfoutput>
                     </select>
                  </div>
                  <div class="form-group col-md-6">
                     <label for="con_number">Contact Number</label>
                     <input type="tel" name="cn_contact_no"  class="form-control" id="cn_contact_no" required  type="tel" pattern="^[0-9-+()]{3,15}"   placeholder="Contact Number">
                  </div>
               </div>
               <div class="form-row">
                  <div class="form-group col-md-6">
                     <label for="email">Email</label>
                     <input type="email" required name="cn_email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" class="form-control" id="cn_email" placeholder="Email">
                  </div>
                  <div class="form-group col-md-6">
                     <label for="experience">Experience</label>
                     <input  type="number" min="0" max="50"  step="0.01" name="cn_experience" class="form-control" id="cn_experience" placeholder="Experience">
                  </div>
               </div>
               <div class="form-row">
                  <div class="form-group col-md-6">
                     <label for="loc">Location</label>
                     <input type="text" required pattern="[A-Za-z ,-+]{5,50}" name="cn_location" class="form-control" id="cn_location" placeholder="Location">
                  </div>
                  <div class="form-group col-md-6">
                     <label for="current_cmny">Current Company</label>
                     <input type="text" pattern="[A-Za-z ]{5,39}"  name="cn_current_company" class="form-control" id="cn_current_company" placeholder="Current Company">
                  </div>
               </div>
               <div class="form-row">
                  <div class="form-group col-md-6">
                     <label for="current_ctc">Current Ctc</label>
                     <input type="number" min="1000" max="1000000000"  name="cn_current_ctc"  class="form-control" id="cn_current_ctc" placeholder="Current Ctc">
                  </div>
                  <div class="form-group col-md-6">
                     <label for="expected_ctc">Expected Ctc</label>
                     <input type="number" min="1000" max="1000000000" required   name="cn_expected_ctc"  class="form-control" id="cn_expected_ctc" placeholder="Expected Ctc">
                  </div>
               </div>
               <div class="form-row">
                  
                  <div class="form-group col-md-6">
                     <label for="notice Period">Resume Upload</label>
                     <input type="file" accept="application/pdf,.doc,.docx,.xml,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" required name="cn_resume_upload" class="form-control" id="cn_resume_upload">
                  </div>
               </div>
               <div class="form-row">
                  <div class="form-group col-md-6">
                     <label for="current_ctc">skills</label>
                     <cfset  skills_list = database.skills_list()>
                     <select  class="form-control" name="cn_resume_skills" id="cn_resume_skills" multiple required>
                        <cfoutput>
                              <cfloop query="skills_list">
                                 <option value="#SkillId#">#Name#</option>
                              </cfloop>
                          </cfoutput>
                     </select>
                  </div>
                  <div class="form-group col-md-6">
                     <label for="current_ctc">Notice Period(In Months)</label>
                     <input  type="number" min="0" max="60" required  name="cn_notice_period" class="form-control" id="cn_notice_period" >
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
            </div>
         </div>
      </div>
   </div>
</div>
<!-- Modal For Candidate Edit-->
<div class="modal fade" id="candidateedit_modal" role="dialog">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Edit Candidate</h4>
         </div>
         <div class="modal-body" id="edit_candidate_modal">

         </div>   
        
      <div class="modal-footer">  
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
            <div class="row schedule_interview_form_div">
               
            </div>
         </div>
      </div>
   </div>
</div>