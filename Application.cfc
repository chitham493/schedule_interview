component{
	this.name='interviews';
	this.applicationTimeout=CreateTimeSpan(1, 0, 0, 0);
	this.sessionManagement=true;
	this.sessionTimeout=CreateTimeSpan(1, 0, 0, 0);

	function onApplicationStart(){
		application.myname='interview';	
		application.domain_name="http://"&cgi.server_name&":"&cgi.server_port&"/1interview/";
		application.datasource='scheduleInterview';	
		application.database_component="1interview.cfc.database";	
		application.database_obname="database";	
		return true;
	}
	function onrequeststart(string targetPage){
		filename = ListLast(targetPage, "/");
		if(!structKeyExists(session,"user_session")){		
			if(filename!='index.cfm'&&filename!='logindb.cfc'){
				session.error_login="Invalid Access";
				location(application.domain_name&"index.cfm");
			}			
		}else{
			

			if(session.user_type eq 2){
					if(filename=='index.cfm'){
							location(application.domain_name&"login_panel/candidate_list.cfm");
						}else{
						
							  file_restrict="candidate_list.cfm,logout.cfm,db2_database.cfc,schedule_list.cfc";
								if(!listContains(file_restrict,filename)){
									location(application.domain_name&"login_panel/candidate_list.cfm");
								}
							}
					
				}else{

			if(filename=='index.cfm'){
				location(application.domain_name&"home.cfm");
			}
			}

		}
	}
}	