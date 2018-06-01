<cfset exists= structClear(session)>
<cfset session.error_login="Logout Successfully">
<cflocation url="#application.domain_name#index.cfm">