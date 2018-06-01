<cfcomponent access="public" displayname="logindb">
    <cffunction name="logindb"  access="remote">
        <cfargument name="username" type="string" required="true">
        <cfargument name="passwords" type="string" required="true"> 
            <cfquery name="login_query" datasource="#application.datasource#">  
          		select * from UserDetails where UserName=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.username#" /> and password = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#Hash(arguments.passwords,'MD5')#" />;
            </cfquery>
            <cfset variables.data_count="#login_query.recordCount#">
                <cfif variables.data_count gt 0>
        		<cfoutput query="login_query" >
        		 	<cfset session.user_session="#login_query.UserId#"/>
                    <cfset session.user_name="#login_query.FirstName# #login_query.LastName#"/>
                    <cfset session.user_type="#login_query.RoleId#"/>
        		</cfoutput>                 
        		<cfoutput>Success</cfoutput>
        		<cfelse> 
        		</cfif>
    </cffunction>
</cfcomponent>