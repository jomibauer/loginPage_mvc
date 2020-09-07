<cfoutput>
<div class="sec">
	<a href="/file_viewer.cfm">< < BACK</a><br>

	<cfset imgPath = "/includes/mywebsitefiles/" & #prc.image#>
	<div class="img-box">
		<img id="pic" src=#imgPath#><br>
		<label id="pic-label">#prc.image#</label>	
	</div>

	</div>
</cfoutput>