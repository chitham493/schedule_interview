<!--- <cfif (structKeyExists(session, "user_session")) neq 1> 
	<cfset session.error_login="Invalid Access">
	<cflocation url="#application.domain_name#index.cfm">
</cfif> --->
<cfobject 
component = "#application.database_component#" 
name =  "database" >