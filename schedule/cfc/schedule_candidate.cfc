<cfcomponent>
    <cffunction name="dataTable" access="remote" format="json">
        <cfset sTableName = "Schedule" />
        <cfset listColumns = "CandidateId,FIRSTNAME,ScheduleDate,ScheduleTime,JobPosition,Name,AppliedFor,JobVacancyId,next_schdule_status,Final_Round,Current_Status,ScheduleId" />
        <cfset listColumns_query = "S.ScheduleId,C.CandidateId,C.FIRSTNAME,S.ScheduleDate,S.ScheduleTime,J.JobPosition,J.JobVacancyId,C.AppliedFor,S.Final_Round,IT.Name,S.next_schdule_status,S.Current_Status" />
        <cfset sIndexColumn = "C.CandidateId" />
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
        <cfset session.listColumns=variables.listColumns_query>
        <cfquery datasource="#coldfusionDatasource#" name="qFiltered" result="myResult">
           SELECT  Distinct #listColumns_query#
                FROM #sTableName# S inner join InterviewRounds R on R.InterviewRoundId = S.InterviewRoundId inner join JobVacancy J 
            on J.JobVacancyId = R.JobId inner join CandidateDetails C on C.CandidateId = S.CandidateId inner join InterviewTypes IT on R.InterviewTypeId = IT.InterviewTypeId  left join Review Rw on R.InterviewTypeId = IT.InterviewTypeId where S.Status = 1 AND S.Current_Status=4
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
                <cfelse>
            </cfif>
        </cfquery>
        <cfset session.list_paramenters='#list_paramenters#'>
        <cfset session.list_columnlist_paramenters='#list_columnlist_paramenters#'>
        <cfquery datasource="#coldfusionDatasource#" name="qCount">
            SELECT COUNT(#sIndexColumn#) as total
            FROM   #sTableName# S inner join InterviewRounds R on R.InterviewRoundId = S.InterviewRoundId inner join JobVacancy J 
            on J.JobVacancyId = R.JobId inner join CandidateDetails C on C.CandidateId = S.CandidateId where S.Status = 1
        </cfquery>
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