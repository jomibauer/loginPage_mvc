<cfoutput>
	<cfscript>
		if (structKeyExists(rc, "errorMsg")){
			errorMsg = rc.errorMsg;
		}
		else{
			errorMsg='';
		}

	</cfscript>
	<h3 class="error-message"> #errorMsg# </h3>
	<h1>Please sign-in</h1>

	<form class="login-form" action="#event.buildLink( 'verifyUser' )#" method="post">
		<input type="text" name="userid" class="user-input" placeholder="UserID"><br>
		<input type="password" name="password" class="user-input" placeholder="Password"><br>
		<input type="submit">
	</form>
	

</cfoutput>