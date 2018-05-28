<cfcomponent access="public" displayname="logindb">
    <cffunction name="logindb"  access="remote">
        <cfargument name="username" type="string" required="true">
        <cfargument name="passwords" type="string" required="true"> 
        <cfif arguments.check_logger eq "admin">
            <cfquery name="login_query" datasource="#datasource#">  
          		select * from UserDetails where UserName=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.username#" /> and password = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#Hash(arguments.passwords,'MD5')#" />;
            </cfquery>
            <cfset variables.data_count="#login_query.recordCount#">
                <cfif variables.data_count gt 0>
        		<cfoutput query="login_query" >
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
            <cfelseif arguments.check_logger eq "users">
                <cfquery name="crm" datasource="crm">  
                    select * from developer_users where reg_username=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.username#" /> and reg_password = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#Hash(arguments.password,'MD5')#" />;
                </cfquery>
                <cfset variables.data_count="#crm.recordCount#">
                <cfif #variables.data_count# gt 0>
                <cfoutput query="crm" >
                    <cfset session.user_session="#crm.id#"/>
                    <cfset session.user_name="#crm.reg_name#"/>
                    <cfset session.user_type="#arguments.check_logger#"/>
                </cfoutput>                 
                <cflocation url="#application.domain_name#home.cfm">
                <cfelse>
                    <cfset session.error_login="invalid" >
                    <cflocation url="#application.domain_name#index.cfm">                   
                </cfif>                
        </cfif>
    </cffunction>
</cfcomponent>