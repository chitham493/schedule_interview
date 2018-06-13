<cfcomponent>
    <cffunction name="dataTable" access="remote" format="json">
        <cfset sTableName = "Schedule" />
        <cfset listColumns = "CandidateId,FIRSTNAME,Name,Experience,JobPosition,ScheduleId,AppliedFor,InterviewRoundId" />
        <cfset listColumns_query = "C.FirstName,T.Name,C.Experience,C.AppliedFor,
			S.ScheduleId,C.CandidateId,S.ScheduleDate,S.ScheduleTime,J.JobPosition,T.Name,P.UserId,J.JobVacancyId,I.InterviewRoundId" />
        <cfset sIndexColumn = "S.CandidateId" />
        <cfset coldfusionDatasource = "#application.datasource#"/>
        <cfparam name="url.sEcho" default="1" type="integer" />
        <cfparam name="url.iDisplayStart" default="0" type="integer" />
        <cfparam name="url.iDisplayLength" default="10" type="integer" />
        <cfparam name="url.sSearch" default="" type="string" />
        <cfparam name="url.iSortingCols" default="0" type="integer" />
        <cfparam name="url.sSearch_0" default="" type="string" />
        <cfparam name="url.sSearch_1" default="" type="string" />
        <cfparam name="url.sSearch_2" default="" type="string" />
        <cfparam name="url.sSearch_3" default="" type="string" />
        <cfparam name="con_exist" default="0" type="integer" />
        <cfset list_paramenters="">
        <cfset list_columnlist_paramenters="">
        <cfset session.canlist_search_true="0">
        <cfset session.listColumns=variables.listColumns>
        <!--- Data set after filtering --->
        <cfquery datasource="#coldfusionDatasource#" name="qFiltered" result="myResult">
           SELECT   #listColumns_query#
                FROM #sTableName# as S inner join PanelMembers P 
			on S.PanelId = P.PanelId inner join CandidateDetails C on S.CandidateId = C.CandidateId 
			inner join InterviewRounds I on I.InterviewRoundId = S.InterviewRoundId inner join InterviewTypes T
			on T.InterviewTypeId = I.InterviewTypeId inner join JobVacancy J on J.JobVacancyId = I.JobId 
			where S.Status = 1 and P.UserId =<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.user_session#" />
            <cfif len(trim(url.sSearch))>
            <cfset session.canlist_search_true="1">
                 AND (<cfloop list="#listColumns_query#" index="thisColumn"><cfif thisColumn neq listFirst(listColumns_query)> OR </cfif>#thisColumn# LIKE <cfif thisColumn is "version"><!--- special case ---><cfqueryparam cfsqltype="CF_SQL_FLOAT" value="#val(url.sSearch)#" /><cfelse><cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="%#trim(url.sSearch)#%" /></cfif></cfloop>)
                  <cfset list_paramenters=ListAppend(list_paramenters,"%#trim(url.sSearch)#%")>
                  <cfset list_columnlist_paramenters=ListAppend(list_paramenters,"")>
            </cfif>
            <cfif (len(trim(url.sSearch_0)) OR len(trim(url.sSearch_1)) OR len(trim(url.sSearch_2)) OR len(trim(url.sSearch_3)) )>
                 <cfif len(trim(url.sSearch_0))>
                     AND
                     ( FirstName LIKE <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="%#trim(url.sSearch_0)#%" />)
                  <cfset list_paramenters=ListAppend(list_paramenters,"%#trim(url.sSearch_0)#%")>
                  <cfset list_columnlist_paramenters=ListAppend(list_columnlist_paramenters,"FirstName")>
                 </cfif>
                  <cfif len(trim(url.sSearch_1))>
                     AND
                     (Email LIKE <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="%#trim(url.sSearch_1)#%" />)
                  <cfset list_paramenters=ListAppend(list_paramenters,"%#trim(url.sSearch_1)#%")>
                  <cfset list_columnlist_paramenters=ListAppend(list_columnlist_paramenters,"Email")>
                 </cfif>
                 <cfif len(trim(url.sSearch_2))>
                     AND
                     (Experience LIKE <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="%#trim(url.sSearch_2)#%" />)
                     <cfset list_paramenters=ListAppend(list_paramenters,"%#trim(url.sSearch_2)#%")>
                     <cfset list_columnlist_paramenters=ListAppend(list_columnlist_paramenters,"Experience")>
                 </cfif>
                 <cfif len(trim(url.sSearch_3))>
                    AND
                     (JobPosition LIKE <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="%#trim(url.sSearch_3)#%" />)
                     <cfset list_paramenters=ListAppend(list_paramenters,"%#trim(url.sSearch_3)#%")>
                     <cfset list_columnlist_paramenters=ListAppend(list_columnlist_paramenters,"JobPosition")>
                 </cfif>
            </cfif>
               

            <cfif url.iSortingCols gt 0>
                ORDER BY <cfloop from="0" to="#url.iSortingCols-1#" index="thisS"><cfif thisS is not 0>, </cfif>#listGetAt(listColumns_query,(url["iSortCol_"&thisS]+1))# <cfif listFindNoCase("asc,desc",url["sSortDir_"&thisS]) gt 0>#url["sSortDir_"&thisS]#</cfif> </cfloop>
            </cfif>
        </cfquery>
        <cfset session.list_paramenters='#list_paramenters#'>
        <cfset session.list_columnlist_paramenters='#list_columnlist_paramenters#'>
        <!--- Total data set length --->
        <cfquery datasource="#coldfusionDatasource#" name="qCount">
            SELECT COUNT(#sIndexColumn#) as total
            FROM   #sTableName# as S inner join PanelMembers P 
			on S.PanelId = P.PanelId inner join CandidateDetails C on S.CandidateId = C.CandidateId 
			inner join InterviewRounds I on I.InterviewRoundId = S.InterviewRoundId inner join InterviewTypes T
			on T.InterviewTypeId = I.InterviewTypeId inner join JobVacancy J on J.JobVacancyId = I.JobId 
			where S.Status = 1 and P.UserId =<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.user_session#" /> 
        </cfquery>
          
        <!---
            Output
         --->
        <cfcontent reset="Yes" />
        {"sEcho": <cfoutput>#val(url.sEcho)#</cfoutput>,
        "iTotalRecords": <cfoutput>#qCount.total#</cfoutput>,
        "iTotalDisplayRecords": <cfoutput>#qFiltered.recordCount#</cfoutput>,
        "aaData": [
            <cfoutput query="qFiltered" startrow="#val(url.iDisplayStart+1)#" maxrows="#val(url.iDisplayLength)#">
                <cfif currentRow gt (url.iDisplayStart+1)>,</cfif>
                [<cfloop list="#listColumns#" index="thisColumn"><cfif thisColumn neq listFirst(listColumns)>,</cfif><cfif thisColumn is "version"><cfif version eq 0>"-"<cfelse>"#replacenocase(jsStringFormat(version),"\'","'","all")#"</cfif><cfelse>"#replacenocase(jsStringFormat(qFiltered[thisColumn][qFiltered.currentRow]),"\'","'","all")#"</cfif></cfloop>]
            </cfoutput> ] }
    </cffunction>
</cfcomponent>
