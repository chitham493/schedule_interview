<cfcomponent access="public" displayname="logindb">
    <cffunction name="logindb"  access="remote">
        <cfargument name="username" type="string" required="true">
        <cfargument name="passwords" type="string" required="true"> 
        <cfargument name="check_logger" type="string" required="true">   
            <cfquery name="crm" datasource="logindb">  
          		select * from admin_users where username=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.username#" /> and password = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#Hash(arguments.password,'MD5')#" />;
            </cfquery>
            <cfset variables.data_count="#crm.recordCount#">
                <cfif #data_count# gt 0>
        		<cfoutput query="crm" >
        		 	<cfset session.user_session="#crm.id#"/>
                    <cfset session.user_name="#crm.name#"/>
                    <cfset session.user_type="#arguments.check_logger#"/>
        		</cfoutput>                 
        		<cflocation url="#application.domain_name#home.cfm">
        		<cfelse>
                     <cfset session.error_login="invalid" >
        			<cfset form.error="invalid" >
                    <cflocation url="#application.domain_name#index.cfm?invalid">
        		</cfif>
    </cffunction>
</cfcomponent>