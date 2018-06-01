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
            <button type="button" id="confirm_delete_interview" class="btn btn-success">Yes</button>
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
            <div class="row add_candidate_form_div">
               <form id="add_candidate_form" action="" enctype="multipart/form-data">
                  <div class="form-row">
                     <div class="form-group col-md-3">
                        <label for="usrname">First Name</label>
                        <input type="text" required class="form-control" name="cn_fname" id="cn_name" pattern="[A-Za-z]{3,20}" title="3 to 20 characters" placeholder="First Name">
                     </div>
                     <div class="form-group col-md-3">
                        <label for="usrname">Last Name</label>
                        <input type="text" class="form-control" pattern="[A-Za-z]{1,20}" name="cn_lname" id="cn_name" title="3 to 20 characters" placeholder="Last Name" required>
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