<cfdocument  format="PDF">
	<cfinclude template="parts/login_check.cfm">
	<html> 
		<head>      
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"  type="text/css">
			<style>
			center h1{
				text-align: center;
				color: #8f3939;
				font-weight: 500;
			}
			</style>
		</head>
		<body>
			<center>
				<h1>Candidate List</h1> 
			</center>
			<cfset  candidate_details_pdf = database.candidate_details_pdf()>
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Experience</th>
						<th>Applied For</th>
					</tr>
				</thead>
				<tbody>
					<cfoutput>
						<cfloop query="#candidate_details_pdf#">
							<tr>
								<td>#CandidateId#</td>
								<td>#FirstName#</td>
								<td>#Email#</td>
								<td>#Experience#</td>
								<td>#JobPosition#</td>
							</tr>
						</cfloop>
					</cfoutput>
				</tbody>
			</table>
		</body>
		</html>
	</cfdocument>