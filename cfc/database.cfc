<cfcomponent access="public" displayname="database">
    <cffunction name="candidate_details_pdf"  access="remote">
      <cfset variables.list_paramenters=session.list_paramenters>
      <cfset variables.list_columnlist_paramenters=session.list_columnlist_paramenters>
      <cfset variables.canlist_search_true=session.canlist_search_true>
      <cfset variables.candidate_list_query=session.candidate_list_query>
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
        select * from CandidateDetails where status=1 AND CandidateId=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.action_id#" />;
      </cfquery>
      <cfsavecontent variable="cachedOutput">
        <cfoutput query="view_candidate">
          
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
          
        </cfoutput>

      </cfsavecontent>  
      <cfreturn cachedOutput>
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
                  '#cffile.SERVERFILENAME#',
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
</cfcomponent>