<cfcomponent access="public" displayname="database">
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
   <label for="notice Period">Resume Upload</label>
   <input type="file" accept="application/pdf,.doc,.docx,.xml,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" required name="cn_resume_upload" class="form-control" id="cn_resume_upload">
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
  FROM CandidateDetails  as A inner join JobVacancy as B on A.AppliedFor=B.JobVacancyId WHERE (A.Status=1)
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
</cfcomponent>