<cfoutput>
	<cfscript>
		

	</cfscript>
	<h3 class="error-message"> #prc.displayMsg# </h3>
	<h1>Please sign-in</h1>

	<form class="login-form" action="#event.buildLink(prc.xeh.process_verifyUser)#" method="post">
		<input type="text" name="userid" class="user-input" placeholder="UserID"><br>
		<input type="password" name="password" class="user-input" placeholder="Password"><br>
		<input type="submit">
	</form>
	
</cfoutput>