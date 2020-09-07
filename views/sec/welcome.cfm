<cfoutput>


<div class="sec">
	<form action="#event.buildLink( 'welcome.logout' )#" method="post">
		<h1>#prc.welcomeMessage#</h1>
		<input type="submit" name= "logout" value="Logout" id="submit-button">
	</form>
</div>

<cfdump var="#Session#">

</cfoutput>