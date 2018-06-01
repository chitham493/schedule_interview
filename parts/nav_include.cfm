<div class="responsive_bar"><i class="fa fa-bars"></i></div>
<div id="navigation-app" class="col-xs-2 sidenav">
	<div id="logo_navs">
		<img alt="crm"  src="Assets/images/crm.png" class="img-responsive">
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
				<li <cfif variables.url_page eq "home.cfm"> class="active" </cfif> ><a href="home.cfm">Candidate List</a></li>
				<li ><a href="schedule_interview.html">Schedule Interview</a></li>
				<li ><a href="add_panel.html">Add Panel Member</a></li>
				<li ><a href="add_custom.html">Add Custom</a></li>
			</ul>
		</nav>
	</div>
</div>