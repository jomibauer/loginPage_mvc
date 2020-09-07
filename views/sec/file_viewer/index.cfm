<cfoutput>
<div class="sec">
	<h1>File Viewer</h1>
	<label class="form-style">
		<form class="file-form" action="#event.buildLink("show")#" method="post">
			<select name="trees" class="tree-select">

			<cfloop query="prc.file_list">
		
				<cfset displayName = replaceNoCase(#name#, "_", " ", "all")>
				<cfset displayName = uCase(replaceNoCase(#displayName#, ".jpg", "", "one"))>
				<option value=#name#>#displayName#</option>
			</cfloop>
		</select><br>
    	<input type="submit" value="Show me!">
	</form>
</label>

</div>
</cfoutput>