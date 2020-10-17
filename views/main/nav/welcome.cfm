<cfoutput>


<div class="sec">
	<form action="#event.buildLink(prc.xeh.process_logout)#" method="post">
		<h1>Hello, #session.user#</h1>
		<input type="submit" name= "logout" value="Logout" id="submit-button">
	</form>
</div>

<cfdump var="#session#">

</cfoutput>