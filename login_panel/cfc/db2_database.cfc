<cfcomponent access="public" displayname="db2_database">
  <cffunction name="review_candidate_user_submit" access="remote">
    <cfargument name="schedule_id" type="string" required="true">
    <cfargument name="round_id" type="string" required="true">
    <cfargument name="SkillId_lists" type="string" required="true">

    <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
    <cfquery name="review_candidate_up_query" datasource="#application.datasource#" result="myResult">
    INSERT INTO [Review]
    (
      [ScheduleId],
      [StatusId],
      [ReviewedBy],
      [Comments],
      [CreatedDate],
      [CreatedBy],
      [ModifiedDate],
      [ModifiedBy],
      [Status]
      )VALUES
    (
      <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.schedule_id#">,
      <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">,
      <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.user_session#">,
      <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.Comments#">,
      '#variables.todaydate#',
      #session.user_session#,
      '#variables.todaydate#',
      #session.user_session#,
      <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">
      )
  </cfquery>  
  <cfset variables.new_key=myResult.GENERATEDKEY>
  <cfloop list="#SkillId_lists#" item="SkillId_lists_vals">
    <cfquery name="review_candidate_user_upskills_query" datasource="#application.datasource#" result="myResults2">
    INSERT INTO [RateSkills]
    (

      [ReviewId],
      [SkillId],
      [Score],
      [CreatedDate],
      [ModifiedDate],
      [Status]
      )VALUES
    (

     <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#variables.new_key#">,
     <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#SkillId_lists_vals#">,
     <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments['skills#SkillId_lists_vals#']#">,

     '#variables.todaydate#',
     '#variables.todaydate#',
     <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">
     )
  </cfquery>
</cfloop>

</cffunction>
<cffunction access="remote" name="review_candidate_user">
  <cfargument name="schedule_id" type="string" required="true">
  <cfargument name="round_id" type="string" required="true">
  <cfquery name="review_candidate_user_check_query" datasource="#application.datasource#" result="panelmembers">
  select * from Review where ScheduleId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.schedule_id#">
</cfquery>
<cfquery name="review_candidate_user_query" datasource="#application.datasource#" result="panelmembers">
select A.* from Skills as A inner join InterviewSkills as B on A.SkillId=B.SkillId where B.Status=1 AND B.InterviewRoundId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.round_id#">
</cfquery>



<cfset variables.data_count="#review_candidate_user_check_query.recordCount#">
<cfif variables.data_count gt 0>
  <cfquery name="review_candidate_user_list" datasource="#application.datasource#" result="review_candidate_user_listrs">
  Select B.*,A.Score from RateSkills as A inner join Skills as B on A.SkillId=B.SkillId where A.ReviewId=#review_candidate_user_check_query.ReviewId#
</cfquery>
<div class="box-body "> 
  <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"></button>
        <h4 class="modal-title">Review Candidate</h4>
      </div>
  <div class="row modal-body">
    <div class="form-group">
    <label class="control-label col-sm-4">Rate Skills(?/10)</label>
    <div class="col-sm-7">  
      <div class="well" id="ReviewSkills">
        <cfoutput>

          <cfloop query="review_candidate_user_list">
            <div class="row">
              <div class="form-group col-md-4">
                <label for="usrname"> #Name# </label>
                <input type="number" required class="form-control" name="skills#SkillId#" id="skills#SkillId#" min="0" max="10" value="#Score#" disabled >
              </div>
            </div>
          </cfloop>
        </cfoutput>
      </div>   
    </div>   
  </div>
  <div class="form-group">                                          
    <label class="control-label col-sm-4">Comments</label>
    <div class="col-sm-7">
      <textarea class="form-control rounded-0" id="Comments" disabled name="Comments" rows="5"><cfoutput>#review_candidate_user_check_query.Comments#</cfoutput></textarea>
    </div>
  </div>

  </div>  
</div>
<cfelse>
  <div class="box-body"> 
    <form action="" id="review_candidate_user_form">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Review Candidate</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="form-group">
            <label class="control-label col-sm-4">Rate Skills(?/10)</label>
            <div class="col-sm-7">  
              <div class="well" id="ReviewSkills">
                <cfoutput>
                  <cfset  SkillId = ArrayToList(ValueArray(review_candidate_user_query,'SkillId'))>
                  <input type="hidden" name="SkillId_lists" value="#variables.SkillId#">
                  <input type="hidden" name="schedule_id" value="#arguments.schedule_id#">
                  <input type="hidden" name="round_id" value="#arguments.round_id#">
                  <cfloop query="review_candidate_user_query">
                    <div class="row">
                      <div class="form-group col-md-4">
                        <label for="usrname"> #Name# </label>
                        <input type="number" required class="form-control" name="skills#SkillId#" id="skills#SkillId#" min="0" max="10" >
                      </div>
                    </div>
                  </cfloop>
                </cfoutput>
              </div>   
            </div>   
          </div>
          <div class="form-group">                                          
            <label class="control-label col-sm-4">Comments</label>
            <div class="col-sm-7">
              <textarea class="form-control rounded-0" id="Comments" name="Comments" rows="5"></textarea>
            </div>
          </div> 
        </div>
      </div>
      <div class="modal-footer">  
        <div class="form-group col-md-12">
          <button type="submit" class="btn btn-primary">Save</button>
        </div> 
      </div>
    </form> 
  </div>  


</cfif> 


</cffunction>
<cffunction access="remote" name="add_schedulecandidate_form">
  <cfargument name="candidate_id" type="string" required="true">
  <cfargument name="schedule_date" type="string" required="true">
  <cfargument name="schedule_time" type="string" required="true">
  <cfargument name="schedule_interview_type" type="string" required="true">
  <cfargument name="schedule_interview_panel" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="add_schedulecandidate_form_query" datasource="#application.datasource#" result="panelmembers">
  INSERT INTO [Schedule]
  (
    [CandidateId],
    [InterviewRoundId],
    [ScheduleDate],
    [ScheduleTime],
    [PanelId],
    [CreatedDate],
    [ModifiedDate],
    [Status]
    )VALUES
  (
   <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.candidate_id#">,
   <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.schedule_interview_type#">,
   <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.schedule_date#">,
   <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.schedule_time#">,
   <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.schedule_interview_panel#">,
   <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">,
   <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">,
   <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">
   )
</cfquery>

<cfquery name="getPanelMembersList"  datasource="#application.datasource#"> 
SELECT B.* from [PanelMembers] as A inner join UserDetails as B on A.[UserId]=B.[UserId] where PanelId =<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.schedule_interview_panel#" /> AND A.Status=1 AND B.Status=1 
</cfquery>
<cfquery name="getcandidate_details"  datasource="#application.datasource#"> 
SELECT * from CandidateDetails where CandidateId =<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.candidate_id#" /> AND Status=1 
</cfquery>
<cfset Candidate_Name = getcandidate_details.FirstName&getcandidate_details.LastName>
<cfmail query="getcandidate_details" from="hr@tecnversantinc.com" to="#Email#" subject="Techversant:Interview call" type="html">
  <cfmailpart type="html">
   <html> 
     <head>
      <style type="text/css"> 
       body { 
       font-family:sans-serif;
       font-size:12px;
       color:navy;
       }
     </style> 
   </head> 
   <body>
     <p>Dear #FirstName# #LastName#,</p>
     <p>You Have been Short Listed for an Interview for you job position on #arguments.schedule_date# #arguments.schedule_time#.</p>
     <p>Thanks Regards,<br>HR Manager</p>
   </body>
   </html>
 </cfmailpart>
</cfmail>
<cfmail query="getPanelMembersList" from="hr@tecnversantinc.com" to="#Email#" subject="Techversant:New Interview Schedules" type="html">
  <cfmailpart type="html">
   <html> 
     <head>
      <style type="text/css"> 
       body { 
       font-family:sans-serif;
       font-size:12px;
       color:navy;
       }
     </style> 
   </head> 
   <body>
     <p>Dear #FirstName# #LastName#,</p>
     <p>#variables.Candidate_Name# Has been Schedule for an interview  on #arguments.schedule_date# #arguments.schedule_time#.</p>
     <p>Thanks Regards,<br>HR Manager</p>
   </body>
   </html>
 </cfmailpart>
</cfmail>
<cfoutput>success</cfoutput>
</cffunction>


</cfcomponent>