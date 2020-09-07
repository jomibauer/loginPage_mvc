<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<cfoutput>
<cfset t_directory = ExpandPath("views/sec")>
<cfdirectory directory=#t_directory# action="list" type="file" filter="*.cfm" name="loggedPages">


<cfloop query="loggedPages">
		<!--- get url using the file name and the directory --->
		<cfset tempPath= #name#>
	
		<!--- format page names for the buttons --->
		<cfset pageName = #replace(#name#, ".cfm", '')#>
		<cfset pageName = #replace(#pageName#, "_", ' ')#>

		<!--- change css class if the tab is selected --->
		<cfif CGI.path_info == "/" & tempPath>
			<cfset buttonClass = "selected-tab">
		<cfelse>
			<cfset buttonClass = "tab">
		</cfif>
		<a href=#tempPath#>
		<button class=#buttonClass#>#pageName#</button>
		</a>
</cfloop>

</cfoutput>
