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
	
}