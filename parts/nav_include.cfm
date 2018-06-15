<div class="responsive_bar"><i class="fa fa-bars"></i></div>
<div id="navigation-app" class="col-xs-2 sidenav">
	<div id="logo_navs">
		<img alt="crm"  src="<cfoutput>#application.domain_name#</cfoutput>Assets/images/crm.png" class="img-responsive">
		<div class="responsive_tag">
			<i class="fa fa-arrow-left"></i>
		</div>
	</div>
	<div id="logo_navs2">
		<div class="dropdown">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
				<cfoutput>#session.user_name#</cfoutput><span class="glyphicon glyphicon-chevron-down"></span>
			</button>
			<div class="dropdown-menu">
				<cfoutput>
					<a class="dropdown-item" href="#application.domain_name#logout.cfm">Logout</a>
				</cfoutput>				
			</div>
		</div>
	</div>
	<div id="nav_plate">
		<nav class="navigation" >
			<ul  class="nav nav-pills nav-stacked">
				<cfset variables.url_page="#listlast(cgi.script_name,"/")#">
				<cfif session.user_type eq "1">
					<li <cfif variables.url_page eq "home.cfm"> class="active" </cfif> >
						<a href="<cfoutput>#application.domain_name#</cfoutput>home.cfm">Candidate List</a>
					</li>
					<li <cfif variables.url_page eq "schedule_list.cfm"> class="active" </cfif> >
						<a href="<cfoutput>#application.domain_name#</cfoutput>schedule/schedule_list.cfm">Schedule Interview</a>
					</li>
					<li <cfif variables.url_page eq "panel_members.cfm"> class="active" </cfif> >
						<a href="<cfoutput>#application.domain_name#</cfoutput>panel/panel_members.cfm">Add Panel Member</a>
					</li>
					<li <cfif variables.url_page eq "panel_list.cfm"> class="active" </cfif> >
						<a href="<cfoutput>#application.domain_name#</cfoutput>panel/panel_list.cfm">Panel Management </a>
					</li>
					<li <cfif variables.url_page eq "job_vacancy_list.cfm"> class="active" </cfif>>
						<a href="<cfoutput>#application.domain_name#</cfoutput>job_vacancy/job_vacancy_list.cfm">Job Vacancy Management </a>
					</li>
					<li <cfif variables.url_page eq "skills_list.cfm"> class="active" </cfif>>
						<a href="<cfoutput>#application.domain_name#</cfoutput>skill/skills_list.cfm">Skills Management </a>
					</li>
					<li <cfif variables.url_page eq "interviewtypes_list.cfm"> class="active" </cfif>>
						<a href="<cfoutput>#application.domain_name#</cfoutput>interviewtypes/interviewtypes_list.cfm">Interview Type Management </a>
					</li>

					
				</cfif>
			</ul>
		</nav>
	</div>
</div>