<cfoutput>
<cfset viewName = #replace(#CGI.path_info#, "main/view_", '')#>
<cfset pageHtml = '/Users/jonmi/Documents/loginPage/views/main/nav' & #viewName# & ".cfm">
<cfdirectory directory=#ExpandPath("includes/mywebsitefiles")# action="list" filter="*.jpg| *.png" name="filelist">
<cfscript>
<!--- Initialize *Msg variables --->

</cfscript>
<div class="sec">
	<h1>File Viewer</h1>
	<h5>#prc.displayMsg#</h5>

<!--- Image view selector --->

	<label class="form-style">
		<form class="file-form" action="#event.buildLink("main/process_fileShow")#" method="post">
			<select name="trees" class="tree-select">

			<cfloop query="filelist">
		
				<cfset displayName = replaceNoCase(#name#, "_", " ", "all")>
				<cfset displayName = uCase(replaceNoCase(#displayName#, ".jpg", "", "one"))>
				<option value=#name#>#displayName#</option>
			</cfloop>
		</select><br>
    	<input type="submit" value="Show me!">
	</form>
</label>
<p style="margin-bottom: 10px">or</p>

<!--- New file uploader --->

<label class="form-style">
	<h5 class="error-msg">#prc.errorMsg#</h5>
	<form class="img-form" action="#event.buildLink("main/process_fileUpload")#" method="POST" enctype="multipart/form-data">
		<input type="file" id="new-file" name="filename">
		<input type="submit" value="Upload file">
	</form>
</label>

<!--- PDF generator --->

<form action="#event.buildLink("main/process_fileDownload")#" method="POST">
	<input type="hidden" name="htmlPath" value="#pageHtml#">
	<input type="submit" id="submit-button" value="PDF this page">
	
</form>


</div>

</cfoutput>