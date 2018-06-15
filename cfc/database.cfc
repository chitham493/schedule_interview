<cfcomponent access="public" displayname="database">
  <cffunction access="remote" name="view_schedule_user">
    <cfargument name="schedule_id" type="string" required="true">
    <cfargument name="candidate_id" type="string" required="true">
    <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
    <cfquery datasource="#application.datasource#" name="schedule_view_rounds">
    select IT.Name Interview_type,S.ScheduleId ScheduleId,S.ScheduleId ScheduleId,P.PanelId PanelId,P.PanelId PanelId,S.next_schdule_status,S.Current_Status,S.Total_Mark,S.Final_Result,S.Final_Round from Schedule S INNER join InterviewRounds IR on IR.InterviewRoundId=S.InterviewRoundId  Inner join InterviewTypes IT on IT.InterviewTypeId=IR.InterviewTypeId Inner join Panel P on P.PanelId=S.PanelId where CandidateId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.candidate_id#" /> ORDER BY S.ScheduleId ASC
  </cfquery>
  <cfoutput>
   <cfset variables.Counts_exist_round= 0>
   <cfset Overall_Score_count=0>
   <cfset Overall_Score=0>
   <cfloop query="schedule_view_rounds">
    <cfset variables.schedule_id= #ScheduleId#>
    <cfset variables.Total_Mark= #Total_Mark#>
    <cfset variables.Current_Status= #Current_Status#>
    <cfset variables.Final_Round= #Final_Round#>
    <cfset variables.Final_Result= #Final_Result#>
    <cfset variables.Counts_exist= 0>
    <div class="row">
      <div class="col-md-12">
        <center><label><h4>Round#Counts_exist_round+1#: #Interview_type#</h4></label></center>
        <cfif #Final_Round# neq '' AND #Final_Round# neq '0'>
          <center><label><h4>(Final Round)</h4></label></center>
        </cfif>
      </div>
    </div>
    <cfif #Current_Status# eq "4">
      <cfset variables.Join_Review="LEFT">
      <cfset variables.Status="">
      <cfelse>
        <cfset variables.Join_Review="RIGHT">
      </cfif>
      <cfquery datasource="#application.datasource#" name="schedule_view_rounds_UserDetails" result="schedule_view_rounds_UserDetailsrs">
      select UD.FirstName FirstName,UD.LastName LastName,R.Comments as Comments,R.ReviewId as ReviewId ,R.ReviewId as ReviewId  from Panel P inner join PanelMembers PM on PM.PanelId=P.PanelId INNER join UserDetails UD on PM.UserId=UD.UserId #variables.Join_Review# JOIN Review R on UD.UserId=R.ReviewedBy AND R.ScheduleId='#variables.schedule_id#'  where P.PanelId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#PanelId#" /> AND PM.Status=1   ORDER BY P.PanelId ASC
    </cfquery>

    <cfloop query="schedule_view_rounds_UserDetails">
      <cfset Overall_Score_count=Overall_Score_count+1>
      <div class="row">
        <div class="form-group col-md-12">
          <h4>#FirstName# #LastName#'s Review:</h4>
          <cfif ReviewId eq "">
            <div class="alert alert-danger">  Waiting for Review</div>
            <cfelse>
              <cfset variables.Counts_exist=variables.Counts_exist+1>
              <cfset variables.review_id=#ReviewId#>
              <cfquery datasource="#application.datasource#" name="schedule_view_rounds_Skills" result="schedule_view_rounds_SkillsRs">
              select RS.Score,SK.Name from RateSkills RS inner join Skills SK on SK.SkillId=RS.SkillId WHERE RS.ReviewId=#variables.review_id#
            </cfquery>
            Comment:#Comments#<br>
            <cfset variables.Counts_exist_skills= 0>
            <cfset Counts_exist_skills_score=0>
            &nbsp;&nbsp;&nbsp;
            <cfloop query="schedule_view_rounds_Skills">#Name#:#Score#/10 
            <cfset Counts_exist_skills=Counts_exist_skills+1>
            <cfset Counts_exist_skills_score=Counts_exist_skills_score+#Score#>
          </cfloop> 
          <div class="form-group col-md-12">
            <cfset Counts_exist_skills_score_total=Counts_exist_skills_score/Counts_exist_skills>
            <cfset Overall_Score=Overall_Score+Counts_exist_skills_score_total>
            Total:#Counts_exist_skills_score_total#/10
          </div> 
        </cfif>
      </div> 
    </div>
  </cfloop>
</cfloop>
</cfoutput>
<cfif #variables.Current_Status# eq "4">
  <cfif #schedule_view_rounds_UserDetailsrs.RecordCount# eq variables.Counts_exist>
    <center> <h4>OverAll Total:&nbsp<cfoutput>#Overall_Score/Overall_Score_count#/10</cfoutput></h4> </center>
    <div class="row">
      <div class="form-group col-md-12">
        <center> 
          <input type="radio" name="result_candidate" onclick="return changersstatus('<cfoutput>#variables.schedule_id#</cfoutput>','1','<cfoutput>#variables.Overall_Score/variables.Overall_Score_count#</cfoutput>','<cfoutput>#variables.Final_Round#</cfoutput>')" value="1">OnHold&nbsp;
          <input value="3"  onclick="return changersstatus('<cfoutput>#variables.schedule_id#</cfoutput>','3','<cfoutput>#variables.Overall_Score/variables.Overall_Score_count#</cfoutput>','<cfoutput>#variables.Final_Round#</cfoutput>')"  type="radio" name="result_candidate">Rejected&nbsp;
          <input type="radio"  onclick="return changersstatus('<cfoutput>#variables.schedule_id#</cfoutput>','2','<cfoutput>#variables.Overall_Score/variables.Overall_Score_count#</cfoutput>','<cfoutput>#variables.Final_Round#</cfoutput>')"   value="2"  name="result_candidate">Selected 
        </center>
      </div> 
    </div>
    <cfelse>
     <div class="alert alert-danger">Waiting for OverAll Score</div> 
   </cfif> 
   <cfelse>
    <div class="row">
      <div class="form-group col-md-12">
        <cfquery datasource="#application.datasource#" name="status_tabs" result="status_tabsrs">
        select * from status where statusid=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#variables.Current_Status#" />
      </cfquery>
      <center> <h4>Status:&nbsp<cfoutput>#status_tabs.Title#</cfoutput></h4> </center>
      <center> <h4>OverAll Total:&nbsp;<cfoutput>#variables.Total_Mark#/10</cfoutput></h4> </center>
    </div> 
  </div>
</cfif> 
</cffunction>
<cffunction name="change_statusschedule" access="remote">
  <cfargument name="schedule_id" type="string" required="true">
  <cfargument name="status" type="string" required="true">
  <cfargument name="Total_Mark" type="string" required="true">
  <cfargument name="Final_Round_status" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="panel_name_editquery" datasource="#application.datasource#"  result="myResult">
  UPDATE Schedule
  SET Current_Status=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.status#" />
  ,ModifiedDate ='#variables.todaydate#'
  <cfif arguments.Final_Round_status eq '1'>
  ,Total_Mark=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.Total_Mark#">
  ,Final_Result=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.status#">
  </cfif>
  WHERE ScheduleId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.schedule_id#" />
</cfquery>
<cfoutput>success</cfoutput>
</cffunction> 
<cffunction access="remote" name="add_schedulecandidate_form">
  <cfargument name="candidate_id" type="string" required="true">
  <cfargument name="schedule_date" type="string" required="true">
  <cfargument name="schedule_time" type="string" required="true">
  <cfargument name="schedule_interview_type" type="string" required="true">
  <cfargument name="schedule_interview_panel" type="string" required="true">
  <cfif (structKeyExists(arguments, "final_rounds")) eq 1> 
   <cfset variables.final_rounds_val='1'>
   <cfelse>
    <cfset variables.final_rounds_val='0'>
  </cfif>
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="status_change" datasource="#application.datasource#" result="stausrs">
  Update Schedule Set next_schdule_status=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1"> where CandidateId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.candidate_id#">
</cfquery>
<cfquery name="add_schedulecandidate_form_query" datasource="#application.datasource#" result="schedule_rs">
INSERT INTO [Schedule]
(
  [CandidateId],
  [InterviewRoundId],
  [ScheduleDate],
  [ScheduleTime],
  [PanelId],
  [CreatedDate],
  [ModifiedDate],
  [Status],
  [Final_ROUND],
  [Current_Status],
  [Total_Mark],
  [Final_Result]
  )VALUES
(
  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.candidate_id#">,
  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.schedule_interview_type#">,
  <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.schedule_date#">,
  <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.schedule_time#">,
  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.schedule_interview_panel#">,
  <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">,
  <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">,
  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">,
  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#variables.final_rounds_val#">,
  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="4">,
  <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="0">,
  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="0">
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
<cffunction access="remote" name="schedule_candidate_form" returntype="any" returnFormat="json"> 
  <cfargument name="candidate_id" type="string" required="true">
  <cfargument name="job_id" type="string" required="true">
  <form id="add_schedulecandidate_form">
    <div class="form-row">
     <div class="form-group col-md-2">
      <label for="date">Date:</label>
      <input  type="hidden" class="form-control" name="candidate_id" value="<cfoutput>#arguments.candidate_id#</cfoutput>" id="candidate_id" >
    </div>
    <div class="form-group col-md-4">
      <input required type="text" class="form-control" name="schedule_date" id="schedule_date" >
    </div>
    <div class="form-group col-md-2">
      <label for="date">Time:</label>
    </div>
    <div class="form-group col-md-4">
      <input required type="text" class="form-control" name="schedule_time" id="schedule_time">
    </div>
  </div>
  <div class="form-row">
   <div class="form-group col-md-4">
    <label for="inter_pan">Interview Panel:</label>
  </div>
  <div class="form-group col-md-6">
    <cfset  panel_lists = panel_lists()>
    <select class="form-control" id="schedule_interview_panel" name="schedule_interview_panel" required>
      <option>--Please Select--</option>
      <cfoutput> 
        <cfloop query="panel_lists">
         <option value="#PanelId#">#Name#</option>
       </cfloop>
     </cfoutput>
   </select>
 </div>
</div>
<div class="form-row">
 <div class="form-group col-md-4">
  <label for="inter_pan">Interview Round:</label>
</div>
<div class="form-group col-md-6">
  <cfset  interview_type = interview_type(arguments.candidate_id,arguments.job_id)>
  <cfquery  name="interview_type_check" datasource="#application.datasource#" result="interview_type_checkrs">
  select IR.InterviewRoundId as InterviewTypeId from schedule S inner join InterviewRounds IR on S.InterviewRoundId=IR.InterviewRoundId inner join InterviewTypes IT on IR.InterviewTypeId=IT.InterviewTypeId where S.CandidateId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.candidate_id#" />
</cfquery>
<cfset InterviewTypeId_array=ArrayToList(ValueArray(interview_type_check,"InterviewTypeId"))>
<label for="inter_pan">Final Round:</label><input type="checkbox" name="final_rounds">
<select  class="form-control" id="schedule_interview_type" name="schedule_interview_type" required>
  <option>--Please Select--</option>
  <cfoutput> 
    <cfloop query="interview_type">
      <cfif ListContains(#InterviewTypeId_array#,#InterviewRoundId#) neq 1>
        <option value="#InterviewRoundId#">#Name#</option>
      </cfif>
    </cfloop>
  </cfoutput>
</select>
</div>
</div>
<div class="form-row">
 <div class="form-group col-md-12">
  <button type="submit" class="btn btn-primary">Schedule Candidate</button>
</div>
</div>
</form>
</cffunction> 
<cffunction name="job_vacancy_list_delete" access="remote">
  <cfargument name="action_id" type="INTEGER" required="true">
  <cfquery name="delete_job_vacancy" datasource="#application.datasource#" result="myResult">  
  UPDATE JobVacancy SET Status = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="0" /> where JobVacancyId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.action_id#" />
</cfquery>
<cfreturn myResult.RECORDCOUNT>
</cffunction>
<cffunction access="remote" name="selecting_skills_form_db" returntype="any" returnFormat="json">
  <cfargument name="job_vacancy_id" type="string" required="true">
  <cfargument name="InterviewRoundId_list" type="string" required="true">
  <cfloop list="#arguments.InterviewRoundId_list#" index="interview_round_id">
    <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
    <!---  interviewtypes_skills+interview_round_id --->
    <cfset interviewtypes_skills_lists=arguments['interviewtypes_skills#interview_round_id#']>
    <cfset interviewtypes_skills_lists_id=ArrayTolist(ValueArray(fn_interviewtypes_skills_db('#interview_round_id#'),'SkillId'))>
    <cfset interview_skills_listCommon = listCommon(interviewtypes_skills_lists,interviewtypes_skills_lists_id)>
    <cfset interview_skills_delete= listCompare(interviewtypes_skills_lists_id,interview_skills_listCommon)>

    <cfset interview_skills_add= listCompare(interviewtypes_skills_lists,interview_skills_listCommon)>


    <cfloop list="#interview_skills_delete#" item="ivw_skills_delete_ls">

     <cfquery name="deleteInterview_type" datasource="#application.datasource#" result="deleteInterview_type_rs">
     update InterviewSkills Set Status=0 where InterviewRoundId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#interview_round_id#" /> AND SkillId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#ivw_skills_delete_ls#" />
     </cfquery>

   </cfloop>
   <cfloop list="#interview_skills_add#" index="interview_skills_add_value">       
    <cfquery name="interview_skills_add_query" datasource="#application.datasource#" result="interview_skills_add_query">
    INSERT INTO [InterviewSkills]
    (
      [InterviewRoundId],
      [SkillId],
      [CreatedDate],
      [ModifiedDate],
      [Status]
      )VALUES
    (
      <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#interview_round_id#">,
      <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#interview_skills_add_value#">,
      <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">,
      <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">,
      <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">
      )
  </cfquery>
</cfloop>

</cfloop>
<cfoutput>success</cfoutput>
</cffunction>
<cffunction name="fn_interviewtypes_skills_db" access="public">
  <cfargument name="interview_round_id" type="INTEGER" required="true">
  <cfquery datasource="#application.datasource#" name="fn_interviewtypes_skills_dbs">
  select * from InterviewSkills where  Status=1 AND InterviewRoundId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.interview_round_id#" />
</cfquery>
<cfreturn fn_interviewtypes_skills_dbs>
</cffunction> 
<cffunction name="selectinskills_loop" access="remote">
  <cfargument name="job_vacancy_id" type="INTEGER" required="true">
  <cfargument name="job_rounds" type="INTEGER" required="true">

  <cfset CountVar = 0> 
  <!--- Loop until CountVar = 5. --->
  <cfset  interviewtypes_list = interviewtypes_list_jobs(arguments.job_vacancy_id)>
  <cfset  skills_list = skills_list()>
  <cfoutput>
    <input type="hidden" value="#arguments.job_vacancy_id#" name="job_vacancy_id" id="job_vacancy_id">
    <input type="hidden" value="#arguments.job_rounds#" name="job_rounds" id="job_rounds">
    <cfset InterviewRoundId_list= ArrayToList(ValueArray(interviewtypes_list,"InterviewRoundId")) >
    <input type="hidden" value="#variables.InterviewRoundId_list#" name="InterviewRoundId_list" value="#InterviewRoundId_list#" id="InterviewRoundId_list">
    <cfloop query = "interviewtypes_list"> 
      <cfset data = {
      InterviewRoundId = #InterviewRoundId#
      }/>
      <cfinvoke 
      component="database"
      method="skills_list_jobs" 
      returnVariable="methodResult" 
      argumentCollection="#data#"
      />
      <cfset interview_lists_skills= ArrayToList(ValueArray(methodResult,"SkillId")) >

      <div class="row">
        <div class="form-group col-md-4">
         <label >Skills for #Name#</label >
       </div>
       <div class="form-group col-md-8">
         <select  class="form-control interviewtypes_skills2" name="interviewtypes_skills#InterviewRoundId#" id="interviewtypes_skills#InterviewRoundId#" multiple required>
          <cfoutput>
            <cfloop query="skills_list">
             <option value="#SkillId#"<cfif ListContains(interview_lists_skills,#SkillId#) neq 0> selected</cfif> > #Name#</option>
           </cfloop>
         </cfoutput>
       </select>
     </div>
   </div>
 </cfloop>
</cfoutput>


</cffunction>
<cffunction name="skills_list_jobs"  access="public">
  <cfargument name="InterviewRoundId" type="string" required="true">
  <cfquery name="skills_list_jobs" datasource="#application.datasource#">  
  select A.SkillId from Skills as A inner join InterviewSkills as B on A.SkillId=B.SkillId  where A.status=1 AND B.status=1 AND InterviewRoundId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.InterviewRoundId#" />;
</cfquery>
<cfreturn skills_list_jobs>
</cffunction>
<cffunction access="public" name="interviewtypes_list_jobs">
  <cfargument name="job_vacancy_id" type="string" required="true">
  <cfquery datasource="#application.datasource#" name="interviewtypes_list_jobs">
  select Distinct B.InterviewRoundId,* from InterviewRounds as B  inner join InterviewTypes as A on A.InterviewTypeId=B.InterviewTypeId where JobId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.job_vacancy_id#" /> AND B.Status=1
</cfquery>
<cfreturn interviewtypes_list_jobs>
</cffunction>
<cffunction access="remote" name="selectinground" returntype="any" returnFormat="json">   
  <cfargument name="job_vacancy_id" type="string" required="true">
  <cfargument name="job_rounds" type="string" required="true">
  <cfargument name="interviewtypes1" type="string" required="true">
  <cfargument name="interviewtypes_skills1" type="string" required="true">
  <cfargument name="interviewtypes2" type="string" required="false">
  <cfargument name="interviewtypes_skills2" type="string" required="false">
  <cfargument name="interviewtypes3" type="string" required="false">
  <cfargument name="interviewtypes_skills3" type="string" required="false">
  <cfargument name="interviewtypes4" type="string" required="false">
  <cfargument name="interviewtypes_skills4" type="string" required="false">
  <cfargument name="interviewtypes5" type="string" required="false">
  <cfargument name="interviewtypes_skills5" type="string" required="false">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfset CountVar = 1>
  
  <!--- Loop until CountVar = 5. --->
  <cfset condition_loop=LSParseNumber(arguments.job_rounds)+1>
  <cfloop condition = "CountVar LESS THAN #condition_loop#"> 
    <cfquery name="selectinground" datasource="#application.datasource#" result="selectingroundrsss">

    insert into InterviewRounds (JobId
     ,InterviewTypeId,
     Status,
     round_order) values (
     <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.job_vacancy_id#" />,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments['interviewtypes#CountVar#']#" />,1,#CountVar#);
   </cfquery>
   <cfloop list="#arguments['interviewtypes_skills#CountVar#']#"  item="skill_id">
    <cfquery name="selectingroundskills#CountVar#" datasource="#application.datasource#" result="selectingroundskillsrss#CountVar#">
    insert into InterviewSkills (InterviewRoundId
     ,SkillId
     ,CreatedDate
     ,ModifiedDate
     ,Status) values (
     <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#selectingroundrsss.GENERATEDKEY#" />,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#skill_id#" />,'#variables.todaydate#','#variables.todaydate#',1);
   </cfquery>
 </cfloop>
 <cfset CountVar=CountVar+1>
</cfloop>
<cfoutput>success</cfoutput>
</cffunction>
<cffunction name="jobvacancyedit" access="remote">
  <cfargument name="JobPosition" type="string" required="true">
  <cfargument name="JobCode" type="string" required="true">
  <cfargument name="JobDescription" type="string" required="true">
  <cfargument name="JobResponsibilty" type="string" required="true">
  <cfargument name="StartDate" type="string" required="true">
  <cfargument name="EndDate" type="string" required="true">
  <cfargument name="select_interview_type" type="string" required="true">
  <cfargument name="job_id" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfset variables.job_rounds= ListLen(arguments.select_interview_type)>
  <cfquery datasource="#application.datasource#" name="interview_roundss" result="interview_roundsrss">
  select * from InterviewRounds where JobId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.job_id#" />AND status=1
</cfquery>
<cfset InterviewTypeId_list=ArrayToList(ValueArray(interview_roundss,"InterviewTypeId"))>
<cfset Interview_type_listCommon = listCommon(arguments.select_interview_type,InterviewTypeId_list)>
<cfset Interview_type_delete= listCompare(InterviewTypeId_list,Interview_type_listCommon)>
<cfset Interview_type_add= listCompare(arguments.select_interview_type,Interview_type_listCommon)>

<cfloop list="#Interview_type_delete#" index="Interview_type_delete_list">       
  <cfquery name="deleteInterview_type" datasource="#application.datasource#" result="Interview_types_delete">
  update InterviewRounds Set Status=0 where InterviewTypeId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#Interview_type_delete_list#" /> AND JobId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.job_id#" />
  </cfquery>
</cfloop> 
<cfloop list="#Interview_type_add#" index="Interview_type_add_value">       
  <cfquery name="Interview_type_add_query" datasource="#application.datasource#" result="Interview_type_add_query">
  INSERT INTO InterviewRounds (JobId ,InterviewTypeId,Status)
  VALUES(
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.job_id#" />,   
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#Interview_type_add_value#" />,  
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">
    )
</cfquery>
</cfloop>
<cfquery name="update_job_vacancy" datasource="#application.datasource#" result="update_job_vacancyrs">
update JobVacancy Set JobPosition=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.JobPosition#" />,
 JobDescription= <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.JobDescription#" />,
 JobCode= <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.JobCode#" />,
 JobResponsibilty= <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.JobResponsibilty#" />,
 Vacancy= <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.Vacancy#" />,
 StartDate= <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.StartDate#" />,
 EndDate= <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.EndDate#" />,
 ModifiedDate='#variables.todaydate#',
 ModifiedBy= #session.user_session#,
 rounds= <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.job_rounds#" />
 where JobVacancyId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.job_id#" />
</cfquery>

<cfoutput>#variables.job_rounds#,#arguments.job_id#</cfoutput>
</cffunction>
<cffunction name="edit_job_vacancy" access="remote">
  <cfargument name="job_id" type="string" required="true">
  <cfquery name="edit_job_vacancy" datasource="#application.datasource#">
  select * from JobVacancy where JobVacancyId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.job_id#" />
</cfquery>
<cfoutput query="edit_job_vacancy">
  <form action="" id="form_edit_job_vacancy">
    <input type="hidden" value="#JobVacancyId#" name="job_id">
    <div class="modal-body row">
      <div class="job_vacancy_div">
        <div class="form-row">
         <label class="control-label col-sm-2">Job Name</label>
         <div class="col-sm-4 form-group ">
          <input type="text" pattern=".{3,35}" title="3 to 35 characters" class="form-control" id="JobPosition" required="" value="#JobPosition#" name="JobPosition" placeholder="Job Name">
        </div>
        <label class="control-label col-sm-2">Job Code</label>
        <div class="col-sm-4 form-group ">
          <input type="text" pattern=".{1,35}" required="" title="1 to 35 characters" class="form-control" id="JobCode" value="#JobCode#" name="JobCode" placeholder="Job Code">
        </div>
      </div>
      <div class="form-row ">
       <label class="control-label col-sm-2">JobDescription</label>
       <div class="col-sm-4 form-group ">
        <textarea class="form-control" pattern=".{3,50}" required="" title="3 to 50 characters" id="JobDescription"  name="JobDescription">#JobDescription#</textarea>
      </div>
      <label class="control-label col-sm-2">JobResponsibilty</label>
      <div class="col-sm-4 form-group ">
        <textarea class="form-control" pattern=".{3,50}" required="" title="3 to 50 characters" id="JobResponsibilty" name="JobResponsibilty">#JobResponsibilty#</textarea>
      </div>
    </div>
    <div class="form-row ">
     <label class="control-label col-sm-2">StartDate</label>
     <div class="col-sm-4 form-group ">
      <input type="text" required=""  value="#StartDate#" class="form-control" id="StartDate" name="StartDate">
    </div>
    <label class="control-label col-sm-2">EndDate</label>
    <div class="col-sm-4 form-group ">
      <input type="text" class="form-control" value="#EndDate#"  required="" id="EndDate" name="EndDate">
    </div>
  </div>
  <div class="form-row ">
   <label class="control-label col-sm-2">Vacancy</label>
   <div class="col-sm-4 form-group ">
    <input type="number" pattern=".{5,20}" required="" title="5 to 20 characters" class="form-control" id="Vacancy" value="#Vacancy#" name="Vacancy" placeholder="Vacancy">
  </div>
</div>
<div class="form-row ">
 <label class="control-label col-sm-2">Interview Type</label>
 <div class="col-sm-4 form-group ">
  <cfset  interview_type_id = ArrayToList(ValueArray(interview_type("",'#JobVacancyId#'),'InterviewTypeId'))>
  <cfset  interview_type_all = interview_type_all()>
  <select  class="form-control" name="select_interview_type" id="select_interview_type" multiple required>

    <cfoutput>
      <cfloop query="interview_type_all">

       <option value="#InterviewTypeId#" <cfif ListContains(interview_type_id,#InterviewTypeId#) neq 0> selected</cfif> >#Name#</option>
     </cfloop>
   </cfoutput>
 </select>
</div>
</div>
</div>
</div>
<div class="modal-footer">
 <div class="form-group col-md-12">
  <button type="submit" class="btn btn-primary">Edit JobVacancy</button>
</div>  
</div>
</form>
</cfoutput>
</cffunction>
<cffunction access="remote" name="interview_type_all" returntype="any" returnFormat="json">
  <cfquery datasource="#application.datasource#" name="interview_type_all">
  select * from InterviewTypes where status=1;
</cfquery>
<cfreturn interview_type_all>
</cffunction>  
<cffunction access="remote" name="panel_lists" returntype="any" returnFormat="json">
  <cfquery  datasource="#application.datasource#" name="panel_lists">
  select * from panel where status=1
</cfquery>
<cfreturn panel_lists>
</cffunction>  
<cffunction access="remote" name="interview_type" returntype="any" returnFormat="json">
  <cfargument name="candidate_id" type="string" required="true">
  <cfargument name="job_id" type="string" required="true">
  <cfquery  datasource="#application.datasource#" name="interview_type">
  select  B.InterviewRoundId,A.InterviewTypeId,A.Name from InterviewTypes as A inner join InterviewRounds as B on A.InterviewTypeId=B.InterviewTypeId  where A.status=1 AND B.status=1 AND B.JobId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.job_id#" /> 
</cfquery>
<cfreturn interview_type>
</cffunction> 
<cffunction access="remote" name="insertjob_vacancy" returntype="any" returnFormat="json">   
  <cfargument name="JobPosition" type="string" required="true">
  <cfargument name="JobCode" type="string" required="true">
  <cfargument name="JobDescription" type="string" required="true">
  <cfargument name="JobResponsibilty" type="string" required="true">
  <cfargument name="StartDate" type="string" required="true">
  <cfargument name="EndDate" type="string" required="true">
  <cfargument name="Vacancy" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  
  <cfquery name="insertjob_vacancy" datasource="#application.datasource#" result="insertjob_vacancyrs">
  insert into JobVacancy
   (JobPosition
     ,JobCode
     ,JobDescription
     ,JobResponsibilty
     ,Vacancy
     ,StartDate
     ,EndDate
     ,CreatedDate
     ,ModifiedDate
     ,CreatedBy
     ,ModifiedBy
     ,Status,rounds) values (
     <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.JobPosition#" />,
     <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.JobCode#" />,
     <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.JobDescription#" />,
     <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.JobResponsibilty#" />,      
     <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.Vacancy#" />,
     <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.StartDate#" />,
     <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.EndDate#" />,
     '#variables.todaydate#',
     '#variables.todaydate#',
     #session.user_session#,
     #session.user_session#,
     1,
     <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.rounds#" />
     )
   </cfquery>

   <cfoutput>#insertjob_vacancyrs["GENERATEDKEY"]#,#arguments.rounds#</cfoutput>
 </cffunction>
 <cffunction name="interviewtypes_list"  access="public">
  <cfquery name="interviewtypes_list" datasource="#application.datasource#">  
  select InterviewTypeId,Name from InterviewTypes where status=1 ;
</cfquery>
<cfreturn interviewtypes_list>
</cffunction>
<cffunction name="selectinground_loop" access="remote">
  <cfargument name="job_vacancy_id" type="INTEGER" required="true">
  <cfargument name="job_rounds" type="INTEGER" required="true">

  <cfset CountVar = 0> 
  <!--- Loop until CountVar = 5. --->
  <cfset  interviewtypes_list = interviewtypes_list()>
  <cfset  skills_list = skills_list()>

  <cfoutput>
    <input type="hidden" value="#arguments.job_vacancy_id#" name="job_vacancy_id" id="job_vacancy_id">
    <input type="hidden" value="#arguments.job_rounds#" name="job_rounds" id="job_rounds">

    <cfloop condition = "CountVar LESS THAN #job_rounds#"> 
      <cfset CountVar = CountVar + 1> 
      <div class="row">
        <div class="form-group col-md-6">
          <label >Round #CountVar#</label >
          <select  class="form-control interviewtypes" name="interviewtypes#CountVar#" id="interviewtypes#CountVar#" required>
            <option value="">--Please Select--</option>
            <cfloop query="interviewtypes_list">
              <option  value="#InterviewTypeId#">#Name#</option>
            </cfloop>
          </select>
        </div>
        <div class="form-group col-md-6">
          <label >Skills for Round #CountVar#</label >
          <select  class="form-control" name="interviewtypes_skills#CountVar#" class="interviewtypes_skills" id="interviewtypes_skills#CountVar#" multiple required>
            <cfoutput>
              <cfloop query="skills_list">
               <option value="#SkillId#">#Name#</option>
             </cfloop>
           </cfoutput>
         </select>
       </div>
     </div>
   </cfloop>

 </cfoutput>


</cffunction>
<cffunction name="panelmember_list_delete" access="remote">
  <cfargument name="action_id" type="INTEGER" required="true">
  <cfquery name="delete_candidate" datasource="#application.datasource#" result="myResult">  
  UPDATE UserDetails SET Status = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="0" /> where UserId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />
</cfquery>
<cfreturn myResult.RECORDCOUNT>

</cffunction>
<cffunction name="listCompare" output="false" returnType="string">
  <cfargument name="list1" type="string" required="true" />
  <cfargument name="list2" type="string" required="true" />
  <cfset var list1Array = ListToArray(arguments.List1) />
  <cfset var list2Array = ListToArray(arguments.List2) />
  <cfset list1Array.removeAll(list2Array) /><!--- Return in list format --->
  <cfreturn ArrayToList(list1Array) />
</cffunction>

<cffunction name="listCommon" output="false" returnType="string">
  <cfargument name="list1" type="string" required="true" />
  <cfargument name="list2" type="string" required="true" />
  <cfset var list1Array = ListToArray(arguments.List1) />
  <cfset var list2Array = ListToArray(arguments.List2) />
  <cfset list1Array.retainAll(list2Array) /><!--- Return in list format ---><cfreturn ArrayToList(list1Array) />
</cffunction>
<cffunction access="remote" name="panelmemberadd_form">
  <cfargument name="panelid" type="integer" required="true">
  <cfargument name="PanelMembers" type="string" required="true">
  <cfargument name="PanelMembers_id" type="string" required="true">
  <cfset PanelMembers_listCommon = listCommon(arguments.PanelMembers,arguments.PanelMembers_id)>
  <cfset PanelMembers_delete= listCompare(arguments.PanelMembers_id,PanelMembers_listCommon)>
  <cfset PanelMembers_add= listCompare(arguments.PanelMembers,PanelMembers_listCommon)>
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfloop list="#PanelMembers_delete#" index="memberid_delete">       
    <cfquery name="deletepanelmember" datasource="#application.datasource#" result="panelmembers_delete">
    update PanelMembers Set Status=0 where UserId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#memberid_delete#" /> AND PanelId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.panelid#" />
    </cfquery>
  </cfloop> 
  <cfloop list="#PanelMembers_add#" index="memberid">       
    <cfquery name="insertpanelmember" datasource="#application.datasource#" result="panelmembers">
    INSERT INTO PanelMembers (PanelId,UserId,CreatedDate,ModifiedDate,Status)
    VALUES(
      <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.panelid#" />,   
      <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#memberid#" />,  
      <cfqueryparam cfsqltype="cf_sql_timestamp" value="#variables.todaydate#">,
      NULL,
      1
      )
  </cfquery>
</cfloop><cfoutput>success</cfoutput>
</cffunction>
<cffunction access="remote" name="getpaneldetails" returntype="any" returnFormat="json">
  <cfargument name="panelid" type="integer" required="true">
  <cfquery name="panelinfo" result="panelinfo" datasource="#application.datasource#">       
  select Distinct PM.PanelId,P.Name as PanelName,(select STUFF((SELECT Distinct ',' + Cast(C.UserId as varchar(35)) from PanelMembers as A inner join UserDetails as C on A.UserId=C.UserId inner join Panel as B on A.PanelId=B.PanelId where  A.PanelId=P.PanelId  AND A.Status=1  FOR XML PATH('')) , 1 , 1 , '' )) as memberlist from Panel P inner join PanelMembers PM on P.PanelId = PM.PanelId inner join UserDetails M on M.UserId = PM.UserId where PM.Status=1 and PM.PanelId =<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.panelid#" />          
</cfquery>    
<cfset variable_array=ValueArray(panelinfo,"memberlist")>
<cfreturn variable_array[1]>
</cffunction>
<cffunction name="membersinpanel" access="remote">
  <cfargument name="id" type="integer" required="true">

  <cfquery name="membersinpanel" datasource="#application.datasource#" result="myResult">  
  select * from UserDetails where status=1 And RoleId=2;
</cfquery>
<div class="col-sm-12 form-group ">
  <input type="hidden" value="<cfoutput>#arguments.id#</cfoutput>" name="panelid">
  <select  class="form-control" name="PanelMembers" id="select_membersinpanel" multiple required>
    <cfoutput>
      <cfloop query="membersinpanel">
       <option value="#UserId#">#FirstName# #LastName#</option>
     </cfloop>
   </cfoutput>
 </select>
 <input type="hidden" value=""  name="PanelMembers_id" id="PanelMembers_id" >
</div>
</cffunction>
<cffunction access="remote" name="editpanelmembers"  returntype="any" returnFormat="json">
  <cfargument name="panelmemberid" type="integer" required="true">
  <cfargument name="firstname" type="string" required="true">
  <cfargument name="lastname" type="string" required="true">
  <cfargument name="designation" type="integer" required="true">
  <cfargument name="email" type="string" required="true">
  <cfargument name="phone" type="string" required="true">
  <cfargument name="username" type="string" required="true">
  <cfargument name="password" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="updatemember" result="updatemember" datasource="#application.datasource#">
  update UserDetails set 
    FirstName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.firstname#" />,
    LastName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.lastname#" />,
    Email = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.email#" />,
    DesignationId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.designation#" />,
    ContactNumber = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.phone#" />,
    UserName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.username#" />,
    ModifiedDate = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">,
    ModifiedBy = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.user_session#" />,
    Status = 1 where UserId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.panelmemberid#" /> 
  </cfquery>
  <cfif arguments.password neq "">
    <cfquery name="updatemember_password" result="updatemember_passwords" datasource="#application.datasource#">
    update UserDetails set 
      Password = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#Hash(arguments.password,'MD5')#" />where UserId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.panelmemberid#" /> AND Status = 1 
    </cfquery>
  </cfif>
  <cfoutput>success</cfoutput>
</cffunction>
<cffunction name="edit_panelmember" access="remote">
  <cfargument name="action_id" type="string" required="true">
  <cfquery name="edit_panelmember" datasource="#application.datasource#">
  select * from UserDetails where UserId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />
</cfquery>
<input type="hidden" name="panelmemberid" value="<cfoutput>#arguments.action_id#</cfoutput>" >
<cfoutput query="edit_panelmember">

 <div class="form-row">
   <label class="control-label col-sm-2">First Name</label>
   <div class="col-sm-4 form-group ">
    <input type="text" pattern="[A-Za-z]{3,20}" title="3 to 20 characters" class="form-control" id="firstname" value="#FirstName#"  name="firstname" placeholder="First Name">
  </div>
  <label class="control-label col-sm-2">Last Name</label>
  <div class="col-sm-4 form-group ">
    <input type="text" pattern="[A-Za-z]{3,20}"  value="#LastName#"  title="3 to 20 characters" class="form-control" id="lastname"  name="lastname" placeholder="Last Name">
  </div>
</div>
<div class="form-row ">
 <label class="control-label col-sm-2">Email</label>
 <div class="col-sm-4 form-group ">
  <input type="text" pattern=".{3,50}"  value="#Email#"  title="3 to 50 characters" class="form-control" id="email"  name="email" placeholder="Email">
</div>
<label class="control-label col-sm-2">Phone</label>
<div class="col-sm-4 form-group ">
  <input type="tel" pattern="^[0-9-+()]{3,15}"  value="#ContactNumber#"  title="" class="form-control" id="phone"  name="phone" placeholder="Phone" maxlength="10">
</div>
</div>
<div class="form-row ">
 <label class="control-label col-sm-2">User Name</label>
 <div class="col-sm-4 form-group ">
  <input type="text"   pattern=".{5,20}"  value="#UserName#"  required title="5 to 20 characters"  class="form-control" id="username"  name="username" placeholder="User Name">
</div>
<label class="control-label col-sm-2">Password</label>
<div class="col-sm-4 form-group ">
  <input type="password" class="form-control"  id="password"  name="password" placeholder="Password">
</div>
</div>
<div class="form-row ">
 <label class="control-label col-sm-2">Designation</label>
 <div class="col-sm-4  form-group">
  <cfset  designation_list = designation_list()>
  <select  class="form-control" name="designation" required>
   <option value="">--Please Select--</option>
   <cfset variables.DesignationId=#DesignationId#>
   <cfoutput>
     <cfloop query="designation_list">
      <option value="#DesignationId#" <cfif #DesignationId# eq variables.DesignationId> selected</cfif> >#Name#</option>
    </cfloop>
  </cfoutput>
</select>
</div>
</div>
</cfoutput> 
</cffunction>
<cffunction access="remote" name="addpanelmembers" returntype="any" returnFormat="json">   
  <cfargument name="firstname" type="string" required="true">
  <cfargument name="lastname" type="string" required="true">
  <cfargument name="designation" type="integer" required="true">
  <cfargument name="email" type="string" required="true">
  <cfargument name="phone" type="string" required="true">
  <cfargument name="username" type="string" required="true">
  <cfargument name="password" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>

  <cfquery name="userinfo" datasource="#application.datasource#" result="insertmember">
  insert into UserDetails(FirstName, LastName,Email,DesignationId, ContactNumber,UserName,
    Password,RoleId,CreateDate,CreatedBy,ModifiedDate,ModifiedBy,Status) values (
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.firstname#" />,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.lastname#" />,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.email#" />,
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.designation#" />,      
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.phone#" />,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.username#" />,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#Hash(arguments.password,'MD5')#" />,
    2,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">,
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.user_session#" />,
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.user_session#" />,
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1" />,
    1
    )
  </cfquery>
  <cfoutput>success</cfoutput> 
</cffunction>
<cffunction name="delete_panel" access="remote">
  <cfargument name="action_id" type="INTEGER" required="true">
  <cfquery name="delete_candidate" datasource="#application.datasource#" result="myResult">  
  UPDATE Panel SET Status = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="0" /> where PanelId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />
</cfquery>
<cfreturn myResult.RECORDCOUNT>
</cffunction>
<cffunction name="edit_panel" access="remote">
  <cfargument name="action_id" type="string" required="true">
  <cfquery name="edit_panel" datasource="#application.datasource#">
  select * from Panel where PanelId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />
</cfquery>
<cfoutput query="edit_panel">
  <form id="edit_panel_form" action="" >
    <div class="form-row">
     <div class="form-group col-md-12">
      <label for="usrname">Panel Name</label>
      <input type="text" required class="form-control" name="panel_name" id="panel_name" pattern="[A-Za-z]{3,20}" title="3 to 20 characters" value="#Name#" placeholder="Panel Name">
      <input type="hidden" value="#PanelId#" name="panel_id" value="#PanelId#">
    </div>

  </div>
  <div class="form-row">
    <div class="form-group col-md-12">
     <button type="submit" class="btn btn-primary">Edit Panel</button>
   </div>
 </div>
</form>
</cfoutput>
</cffunction>
<cffunction name="editpanel_save" access="remote">
  <cfargument name="panel_id" type="string" required="true">
  <cfargument name="panel_name" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="panel_name_editquery" datasource="#application.datasource#"  result="myResult">
  UPDATE Panel
  SET Name = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.panel_name#" />
  ,ModifiedDate ='#variables.todaydate#'
  WHERE PanelId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.panel_id#" />
</cfquery>
<cfoutput>success</cfoutput>
</cffunction> 
<cffunction name="insertpanel" access="remote">
  <cfargument name="panel_name" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="insertpanel" datasource="#application.datasource#"  result="myResult">  
  INSERT INTO Panel (Name,CreatedDate,ModifiedDate,Status)
  VALUES
  (<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.panel_name#" />,
    '#variables.todaydate#',
    '#variables.todaydate#',
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="1" />);
</cfquery>
<cfoutput>success</cfoutput>
</cffunction>
<cffunction name="insertskills" access="remote">
  <cfargument name="Skill_name" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="insertpanel" datasource="#application.datasource#"  result="myResult">  
  INSERT INTO Skills (Name,CreateDate,ModifiedDate,Status)
  VALUES
  (<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.Skill_name#" />,
    '#variables.todaydate#',
    '#variables.todaydate#',
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="1" />);
</cfquery>
<cfoutput>success</cfoutput>
</cffunction>
<cffunction name="delete_candidate" access="remote">
  <cfargument name="action_id" type="INTEGER" required="true">
  <cfquery name="delete_candidate" datasource="#application.datasource#" result="myResult">  
  UPDATE CandidateDetails SET Status = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="0" /> where CandidateId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />
</cfquery>
<cfreturn myResult.RECORDCOUNT>

</cffunction>
<cffunction name="view_candidate" access="remote">
  <cfargument name="action_id" type="string" required="true">
  <cfquery name="view_candidate" datasource="#application.datasource#"> 


  select A.*,
  (Cast(A.FirstName as varchar(35)) + ' ' + Cast(A.LastName as varchar(35))) as candidate_name,
  B.Name as destination,
  C.JobPosition as JobPosition
  from 
  CandidateDetails as A 
  inner join Designation as B on A.DesignationId=B.DesignationId 
  inner join JobVacancy as C on A.AppliedFor=C.JobVacancyId 
  where A.status=1 AND CandidateId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />;
</cfquery>
<cfquery  name="candidate_skills" datasource="#application.datasource#">
select STUFF((SELECT ',' + C.Name from CandidateSkills  as A 
 inner join Skills as C on A.SkillId=C.SkillId
 inner join CandidateDetails as B on A.CandidateId=B.CandidateId where A.CandidateId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />  FOR XML PATH('')) , 1 , 1 , '' ) as candidate_skills;
</cfquery>
<cfoutput query="view_candidate">

  <div class="form-group form-row">
   <label class="control-label col-sm-6">Name :</label>
   <div class="col-sm-6 row-top">
    #candidate_name#
  </div>
</div>
<div class="form-group form-row">
 <label class="control-label col-sm-6">Designation :</label>
 <div class="col-sm-6 row-top">
  #destination#
</div>
</div>
<div class="form-group form-row">                                             
 <label class="control-label col-sm-6">Email :</label>
 <div class="col-sm-4 row-top">
  #Email#
</div>
</div>
<div class="form-group form-row">
 <label class="control-label col-sm-6">Contact Number :</label>
 <div class="col-sm-4 row-top">
  #ContactNumber#
</div>
</div>
<div class="form-group form-row">
 <label class="control-label col-sm-6">Location :</label>
 <div class="col-sm-4 row-top">
  #Address#
</div>
</div>
<div class="form-group form-row">
 <label class="control-label col-sm-6">Applied For :</label>
 <div class="col-sm-4 row-top">
  #JobPosition#
</div>
</div>
<div class="form-group form-row">
 <label class="control-label col-sm-6">Experience :</label>
 <div class="col-sm-4 row-top">
  #Experience# Months
</div>
</div>
<div class="form-group form-row">
 <label class="control-label col-sm-6">Current Ctc :</label>
 <div class="col-sm-4 row-top">
  #CurrentCtc#
</div>
</div>
<div class="form-group form-row">
 <label class="control-label col-sm-6">Expected CTC :</label>
 <div class="col-sm-4 row-top">
  #ExpectedCtc#
</div>
</div>
<div class="form-group form-row">
 <label class="control-label col-sm-6">Current Company:</label>
 <div class="col-sm-4 row-top">
  #CurrentCompany#
</div>
</div>
<div class="form-group form-row">
 <label class="control-label col-sm-6">Skill:</label>
 <div class="col-sm-4 row-top">
  #candidate_skills.candidate_skills#
</div>
</div>
<div class="form-group form-row">
 <label class="control-label col-sm-6">View Resume:</label>
 <div class="col-sm-4 row-top">
   <a href="Assets/pdf/#ResumePath#" target="_Blank">Resume</a> 
 </div>
</div>

</cfoutput>
</cffunction>
<cffunction name="edit_candidate" access="remote">
  <cfargument name="action_id" type="string" required="true">
  <cfquery name="edit_candidate" datasource="#application.datasource#"> 
  select A.*,
  (Cast(A.FirstName as varchar(35)) + ' ' + Cast(A.LastName as varchar(35))) as candidate_name,
  B.Name as destination,
  C.JobPosition as JobPosition
  from 
  CandidateDetails as A 
  inner join Designation as B on A.DesignationId=B.DesignationId 
  inner join JobVacancy as C on A.AppliedFor=C.JobVacancyId 
  where A.status=1 AND CandidateId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />;
</cfquery>
<cfquery  name="candidate_skills" datasource="#application.datasource#">
select STUFF((SELECT Distinct ',' + Cast(C.SkillId as varchar(35)) from CandidateSkills as A 
 inner join Skills as C on A.SkillId=C.SkillId
 inner join CandidateDetails as B on A.CandidateId=B.CandidateId  where A.CandidateId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />  FOR XML PATH('')) , 1 , 1 , '' ) as candidate_skills;

</cfquery>

<cfoutput query="edit_candidate">

  <form id="edit_candidate_form" action="" enctype="multipart/form-data">
    <input type="hidden" value="<cfoutput>#arguments.action_id#</cfoutput>" name="action_id" >
    <div class="form-row">
     <div class="form-group col-md-3">
      <label for="usrname">First Name</label>
      <input type="text" value="#FirstName#" required class="form-control" name="cn_fname" id="cn_name" pattern="[A-Za-z]{3,20}" title="3 to 20 characters" placeholder="First Name">
    </div>
    <div class="form-group col-md-3">
      <label for="usrname">Last Name</label>
      <input type="text" value="#LastName#" class="form-control" pattern="[A-Za-z]{1,20}" name="cn_lname" id="cn_name" title="3 to 20 characters" placeholder="Last Name" required>
    </div>
    <div class="form-group col-md-6">
      <label for="psw">Applied For</label>
      <cfset  applied_for = applied_for()>
      <select  name="cn_applied_for" class="form-control" required>
        <option value="">--Please Select--</option>
        <cfoutput>
          <cfset variables.AppliedFor_s=#AppliedFor#>
          <cfloop query="applied_for">
           <option value="#JobVacancyId#" <cfif #variables.AppliedFor_s# eq #JobVacancyId#> Selected </cfif>  >#JobPosition#</option>
         </cfloop>
       </cfoutput>
     </select>

   </div>
 </div>
 <div class="form-row">
  <div class="form-group col-md-6">
   <label for="designation">Designation</label>
   <cfset  designation_list =designation_list()>
   <select  class="form-control" name="cn_designation" required>
    <option value="">--Please Select--</option>
    <cfoutput>
      <cfset variables.DesignationIds=#DesignationId#>
      <cfloop query="designation_list">
       <option value="#DesignationId#" <cfif variables.DesignationIds eq #DesignationIds#> selected </cfif> >#Name#</option>
     </cfloop>
   </cfoutput>
 </select>
</div>
<div class="form-group col-md-6">
 <label for="con_number">Contact Number</label>
 <input type="tel" name="cn_contact_no"  class="form-control" id="cn_contact_no" required  type="tel" pattern="^[0-9-+()]{3,15}" value="#ContactNumber#"  placeholder="Contact Number">
</div>
</div>
<div class="form-row">
  <div class="form-group col-md-6">
   <label for="email">Email</label>
   <input type="email" required name="cn_email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" class="form-control" id="cn_email" value="#Email#" placeholder="Email">
 </div>
 <div class="form-group col-md-6">
   <label for="experience">Experience</label>
   <input  type="number" min="0" max="50" value="#Experience#"  step="0.01" name="cn_experience" class="form-control" id="cn_experience" placeholder="Experience">
 </div>
</div>
<div class="form-row">
  <div class="form-group col-md-6">
   <label for="loc">Location</label>
   <input type="text" required pattern="[A-Za-z ,-+]{5,50}" value="#Address#" name="cn_location" class="form-control" id="cn_location" placeholder="Location">
 </div>
 <div class="form-group col-md-6">
   <label for="current_cmny">Current Company</label>
   <input type="text" pattern="[A-Za-z ]{5,39}"  value="#CurrentCompany#" name="cn_current_company" class="form-control" id="cn_current_company" placeholder="Current Company">
 </div>
</div>
<div class="form-row">
  <div class="form-group col-md-6">
   <label for="current_ctc">Current Ctc</label>
   <input type="number" min="1000" max="1000000000"  value="#CurrentCtc#"   name="cn_current_ctc"  class="form-control" id="cn_current_ctc" placeholder="Current Ctc">
 </div>
 <div class="form-group col-md-6">
   <label for="expected_ctc">Expected Ctc</label>
   <input type="number" min="1000" max="1000000000"  value="#ExpectedCtc#"  required   name="cn_expected_ctc"  class="form-control" id="cn_expected_ctc" placeholder="Expected Ctc">
 </div>
</div>

<div class="form-row">
  <div class="form-group col-md-6">
    <label for="current_ctc">skills</label>
    <cfset  skills_list = skills_list()>
    <select  class="form-control" name="cn_resume_skills" id="cn_resume_skills" multiple required>
      <cfoutput>
        <cfloop query="skills_list">
         <option value="#SkillId#" <cfif ListContains(candidate_skills.candidate_skills,#SkillId#) neq 0> selected</cfif> >#Name#</option>
       </cfloop>
     </cfoutput>
   </select>
 </div>
 <input type="hidden" name="SKILLLISTS" value="#candidate_skills.candidate_skills#"> 
 <div class="form-group col-md-6">
  <label for="current_ctc">Notice Period(In Months)</label>
  <input  type="number" min="0" max="60" value="#NoticePeriod#" required  name="cn_notice_period" class="form-control" id="cn_notice_period" >
</div>
</div>
<div class="form-row">
  <div class="form-group col-md-12">
   <button type="submit" class="btn btn-primary">Edit Candidate</button>
 </div>
</div>
</form>

</cfoutput>
</cffunction>
<cffunction access="remote" name="UpdateCandidate_form"  returntype="any" returnFormat="json">

  <cfargument name="action_id" type="integer" required="true">
  <cfargument name="cn_fname" type="string" required="true">
  <cfargument name="cn_lname" type="string" required="true">
  <cfargument name="cn_applied_for" type="integer" required="true">
  <cfargument name="cn_designation" type="integer" required="true">
  <cfargument name="cn_location" type="string" required="true">
  <cfargument name="cn_email" type="string" required="true">
  <cfargument name="cn_contact_no" type="string" required="true">
  <cfargument name="cn_experience" type="string" required="true">
  <cfargument name="cn_current_company" type="string" required="true">
  <cfargument name="cn_current_ctc" type="string" required="true">
  <cfargument name="cn_expected_ctc" type="string" required="true">
  <cfargument name="cn_notice_period" type="string" required="true">
  <cfargument name="cn_resume_skills" type="string" required="true">  
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")> 
  <cfquery name="UpdateCandidateInfo" result="UpdateCandidateInfo" datasource="#application.datasource#">
  update CandidateDetails set 
    FirstName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_fname#" />,
    LastName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_lname#" />,
    Email = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_email#" />,
    DesignationId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.cn_designation#" />,
    AppliedFor = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.cn_applied_for#" />,
    ContactNumber = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_contact_no#" />,
    Address = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_location#" />,
    Experience = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_experience#" />,
    CurrentCtc = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_current_ctc#" />,
    ExpectedCtc = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_expected_ctc#" />,
    CurrentCompany = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_current_company#" />,
    NoticePeriod = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_notice_period#" />,
    ModifiedDate = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">,
    ModifiedBy = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.user_session#" />,
    Status = 1 where CandidateId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.action_id#" />  
  </cfquery>
  <cfset variables.CommonSkills = listCommon(#arguments.cn_resume_skills#,#arguments.SkillLists#)>
  <cfset variables.DeleteSkills = listCompare(#arguments.SkillLists#,#arguments.cn_resume_skills#)>
  <cfset variables.NewSkills = listCompare(#arguments.cn_resume_skills#,#arguments.SkillLists#)>
  <cfif ListLen(variables.NewSkills) gt 0>   
    <cfloop list="#variables.NewSkills#" index="Key">
      <cfquery name="AddSkills" datasource="#application.datasource#">  
      INSERT INTO CandidateSkills
      (CandidateId,
        SkillId
        ,CreatedDate
        ,CreatedBy
        ,ModifiedDate
        ,ModifiedBy
        ,Status)
      VALUES
      (<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.action_id#" />
       ,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#Key#" />             
       ,<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">
       ,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.user_session#" />
       ,<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#variables.todaydate#">
       ,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.user_session#" />
       ,1)
    </cfquery>
  </cfloop>
</cfif>
<cfif ListLen(variables.DeleteSkills) gt 0> 
  <cfquery name="DeleteSkills" datasource="#application.datasource#">  
  Delete from CandidateSkills where CandidateId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.action_id#" /> and SkillId in (<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#variables.DeleteSkills#" />)
</cfquery>      
</cfif>
   <!---  <cfif ListLen(variables.CommonSkills) gt 0> 
     <cfquery name="UpdateSkills" datasource="#application.datasource#">  
        update CandidateSkills set 
          ModifiedDate = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">,
          ModifiedBy = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.logId#" />,
          Status = 0 
          where CandidateId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.CandidateId#" /> 
          and SkillId in (<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#variables.CommonSkills#" />)
      </cfquery>
    </cfif> --->

    success
  </cffunction>
  <cffunction name="insertcandiate"  access="remote">
    <cfargument name="cn_fname" type="string" required="true">
    <cfargument name="cn_lname" type="string" required="true">
    <cfargument name="cn_applied_for" type="integer" required="true">
    <cfargument name="cn_designation" type="integer" required="true">
    <cfargument name="cn_contact_no" type="string" required="true">
    <cfargument name="cn_email" type="string" required="true">
    <cfargument name="cn_experience" type="string" required="false">
    <cfargument name="cn_location" type="string" required="true">
    <cfargument name="cn_current_company" type="string" required="false">
    <cfargument name="cn_current_ctc" type="INTEGER" required="false">
    <cfargument name="cn_expected_ctc" type="INTEGER" required="true">
    <cfargument name="cn_notice_period" type="string" required="false">
    <cfargument name="cn_resume_skills" type="string" required="true">
    <cfset strPath = ExpandPath( "../" )/>
    <cfset myList=arguments.cn_resume_skills/>
    <!---Loop through the list with attribute index --->
    <cftry> 
      <cffile action="upload"
      fileField="cn_resume_upload"
      destination="#strPath#Assets\pdf\" nameconflict="MakeUnique" accept="application/msword, application/pdf">
      <cfcatch type="application">
      <cfoutput>fileExtension</cfoutput> 
      <cfabort>
    </cfcatch>
  </cftry>
  <cfif CGI.content_length gt 1500000>
    <cfoutput>FileLimit</cfoutput> 
    <cfabort>
  </cfif>
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="candidate_details" datasource="#application.datasource#"  result="myResult">  
  INSERT INTO CandidateDetails (FirstName 
    ,LastName 
    ,Email ,DesignationId ,
    AppliedFor ,
    ContactNumber ,
    Experience ,
    Address ,
    CurrentCtc ,ExpectedCtc ,CurrentCompany ,
    NoticePeriod ,ResumePath ,CreatedDate ,CreatedBy ,
    ModifiedDate ,ModifiedBy ,Status) 
  VALUES
  (<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_fname#" />, 
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_lname#" /> ,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_email#" /> , 
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.cn_designation#" />, 
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.cn_applied_for#" /> , 
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_contact_no#" /> , 
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_experience#" /> , 
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_location#" /> ,
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.cn_current_ctc#"/> , 
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.cn_expected_ctc#"/> , 
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_current_company#"/>,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.cn_notice_period#"/> , 
    '#cffile.SERVERFILE#',
    '#variables.todaydate#', 
    #session.user_session#,
    '#variables.todaydate#' ,
    #session.user_session#,
    1)
</cfquery>
<cfset variables.new_key=myResult.GENERATEDKEY>
<cfloop list="#myList#" index="id">
  <cfquery name="Insert_skills" datasource="#application.datasource#">  
  INSERT INTO CandidateSkills
  (CandidateId,
    SkillId
    ,CreatedDate
    ,CreatedBy
    ,ModifiedDate
    ,ModifiedBy
    ,Status)
  VALUES
  (<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#variables.new_key#" />
   ,#id#
   ,'#variables.todaydate#'
   ,#session.user_session#
   ,'#variables.todaydate#'
   ,#session.user_session#
   ,1)
</cfquery>
</cfloop>
success
</cffunction>
<cffunction name="candidate_details_pdf"  access="remote">
  <cfset variables.list_paramenters=session.list_paramenters>
  <cfset variables.list_columnlist_paramenters=session.list_columnlist_paramenters>
  <cfset variables.canlist_search_true=session.canlist_search_true>
  <cfset variables.listColumns=session.listColumns>
  <cfset variables.count_index=0>
  <cfquery name="candidate_details_pdf" datasource="#application.datasource#">  

  SELECT #session.listColumns#
  FROM CandidateDetails  as A inner join JobVacancy as B  on A.AppliedFor=B.JobVacancyId left join Schedule as C on  A.CandidateId=C.CandidateId WHERE (A.Status=1) 
  <cfloop list="#variables.list_paramenters#" index="name">
  <cfset variables.count_index=(variables.count_index+1)>
  <cfif variables.canlist_search_true eq "1">
  AND (<cfloop list="#listColumns#" index="thisColumn"><cfif thisColumn neq listFirst(listColumns)> OR </cfif>#thisColumn# LIKE <cfif thisColumn is "version"><!--- special case ---><cfqueryparam cfsqltype="CF_SQL_FLOAT" value="#name#" /><cfelse><cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#name#" /></cfif></cfloop>)
  <cfset variables.canlist_search_true=0>
  <cfelse>
  AND #ListGetAt(variables.list_columnlist_paramenters,variables.count_index)# LIKE <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#name#" />
  </cfif>
  </cfloop>
</cfquery>
<cfreturn candidate_details_pdf>
</cffunction>
<cffunction name="applied_for"  access="public">
  <cfquery name="candidate_details" datasource="#application.datasource#">  
  select JobPosition,JobVacancyId from JobVacancy where status=1 ;
</cfquery>
<cfreturn candidate_details>
</cffunction>
<cffunction name="designation_list"  access="public">
  <cfquery name="designation_list" datasource="#application.datasource#">  
  select DesignationId,Name from Designation where status=1 ;
</cfquery>
<cfreturn designation_list>
</cffunction>
<cffunction name="skills_list"  access="public">
  <cfquery name="skills_list" datasource="#application.datasource#">  
  select SkillId,Name from Skills where status=1 ;
</cfquery>
<cfreturn skills_list>
</cffunction>
<cffunction name="delete_skills" access="remote">
  <cfargument name="action_id" type="INTEGER" required="true">
  <cfquery name="delete_skills" datasource="#application.datasource#" result="myResult">  
  UPDATE Skills SET Status = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="0" /> where SkillId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />
</cfquery>
<cfreturn myResult.RECORDCOUNT>
</cffunction>
<cffunction name="edit_skills" access="remote">
  <cfargument name="action_id" type="string" required="true">
  <cfquery name="edit_skills" datasource="#application.datasource#">
  select * from Skills where SkillId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />
</cfquery>
<cfoutput query="edit_skills">
  <form id="edit_skills_form" action="" >
    <div class="form-row">
     <div class="form-group col-md-12">
      <label for="usrname">skills Name</label>
      <input type="text" required class="form-control" name="skills_name" id="skills_name" pattern="[A-Za-z]{3,20}" title="3 to 20 characters" value="#Name#" placeholder="skills Name">
      <input type="hidden"  name="skills_id" value="#SkillId#">
    </div>

  </div>
  <div class="form-row">
    <div class="form-group col-md-12">
     <button type="submit" class="btn btn-primary">Edit Skills</button>
   </div>
 </div>
</form>
</cfoutput>
</cffunction>
<cffunction name="editskills_save" access="remote">
  <cfargument name="skills_id" type="string" required="true">
  <cfargument name="skills_name" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="skills_name_editquery" datasource="#application.datasource#"  result="myResult">
  UPDATE skills
  SET Name = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.skills_name#" />
  ,ModifiedDate ='#variables.todaydate#'
  WHERE skillId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.skills_id#" />
</cfquery>
<cfoutput>success</cfoutput>
</cffunction> 
<cffunction name="insertinterviewtypes" access="remote">
  <cfargument name="interviewtypes_name" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="insertpanel" datasource="#application.datasource#"  result="myResult">  
  INSERT INTO InterviewTypes (Name,CreatedDate,ModifiedDate,Status)
  VALUES
  (<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.interviewtypes_name#" />,
    '#variables.todaydate#',
    '#variables.todaydate#',
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="1" />);
</cfquery>
<cfoutput>success</cfoutput>
</cffunction>
<cffunction name="delete_interviewtypes" access="remote">
  <cfargument name="action_id" type="INTEGER" required="true">
  <cfquery name="delete_interviewtypes" datasource="#application.datasource#" result="myResult">  
    UPDATE InterviewTypes SET Status = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="0" /> where InterviewTypeId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />
  </cfquery>
<cfreturn myResult.RECORDCOUNT>
</cffunction>
<cffunction name="edit_interviewtypes" access="remote">
  <cfargument name="action_id" type="string" required="true">
  <cfquery name="edit_interviewtypes" datasource="#application.datasource#">
  select * from interviewtypes where InterviewTypeId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />
</cfquery>
<cfoutput query="edit_interviewtypes">
  <form id="edit_interviewtypes_form" action="" >
    <div class="form-row">
     <div class="form-group col-md-12">
      <label for="usrname">Interviewtypes Name</label>
      <input type="text" required class="form-control" name="interviewtypes_name" id="interviewtypes_name" pattern=".{3,35}" title="3 to 35 characters" value="#Name#" placeholder="interviewtypes Name">
      <input type="hidden"  name="interviewtypes_id" value="#InterviewTypeId#">
    </div>

  </div>
  <div class="form-row">
    <div class="form-group col-md-12">
     <button type="submit" class="btn btn-primary">Edit InterviewTypes</button>
   </div>
 </div>
</form>
</cfoutput>
</cffunction>
<cffunction name="editinterviewtypes_save" access="remote">
  <cfargument name="interviewtypes_id" type="string" required="true">
  <cfargument name="interviewtypes_name" type="string" required="true">
  <cfset variables.todaydate= dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(),"HH:mm:ss.SSS")>
  <cfquery name="interviewtypes_name_editquery" datasource="#application.datasource#"  result="myResult">
  UPDATE interviewtypes
  SET Name = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.interviewtypes_name#" />
  ,ModifiedDate ='#variables.todaydate#'
  WHERE InterviewTypeId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.interviewtypes_id#" />
</cfquery>
<cfoutput>success</cfoutput>
</cffunction> 
</cfcomponent>