component extends="coldbox.system.EventHandler" {



	/**
	 * Produce some restfulf data
	 */
	function data( event, rc, prc ) {
		return [
			{ "id" : createUUID(), name : "Luis" },
			{ "id" : createUUID(), name : "JOe" },
			{ "id" : createUUID(), name : "Bob" },
			{ "id" : createUUID(), name : "Darth" }
		];
	}

	/**
	 * Relocation example
	 */
	function doSomething( event, rc, prc ) {
		relocate( "main.index" );
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit( event, rc, prc ) {
		
	}

	function onRequestStart( event, rc, prc ) {
	}

	function onRequestEnd( event, rc, prc ) {
	}

	function onSessionStart( event, rc, prc ) {
		
	}

	function onSessionEnd( event, rc, prc ) {
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ) {
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}


	/************************************ END IMPLICIT ACTIONS *******************************************/

	function index( event, rc, prc ) {
		prc.welcomeMessage = 'JON';
		if (session.LoggedIn)
		{
			prc.welcomeMessage = "Hello," & session.user;
			prc.xeh.process_logout = "main/process_logout";

			event.setView(view="main/nav/welcome", layout="tabNav");
		}
		else
		{
			prc.displayMsg = '';
			if (structKeyExists(rc,'g')){
				prc.displayMsg = rc.g;
			}
			
			prc.xeh.process_verifyUser = "main/process_verifyUser";
			event.setView("main/signIn");
		}
		}

	function process_verifyUser (event,rc,prc){
			if ((event.getValue("userid") == '') || (event.getValue("password") == '')){
			prc.displayMsg = "Please enter your UserID and password";
			prc.xeh.process_verifyUser = "main/process_verifyUser";
			event.setView("main/signIn");
		}
		elseif (event.getValue("password") != "test"){
			prc.displayMsg = "The password you entered is incorrect";
			prc.xeh.process_verifyUser = "main/process_verifyUser";
			event.setView("main/signIn");
		}
		else{
			session.LoggedIn = true;
			session.user = rc.userid;
    		relocate(event="main/view_welcome");		
		}

	}
	function view_welcome (event,rc,prc){
		
		prc.welcomeMessage = "Hello," & session.user;
		prc.xeh.process_logout = "main/process_logout";
		event.setView(view="main/nav/welcome", layout="tabNav");
		
	}

	function view_cgiDump(event,rc,prc){
		event.setView(view="main/nav/cgidump", layout="tabNav");
	}
	function view_dataReport(event,rc,prc){
		event.setView(view="main/nav/dataReport", layout="tabNav");
	}
	
	function view_fileViewer(event,rc,prc){
		prc.errorMsg = "";
		prc.displayMsg = "";
		event.SetView(view="main/nav/fileViewer", layout="tabNav");
	}
	
	function process_logout(event, rc, prc){
		session.LoggedIn = false;
		session.user = 'guest';
		prc.displayMsg = "You successfully logged out";
		prc.xeh.process_verifyUser = "main/process_verifyUser";

		event.setView("main/signIn");
	}

	function process_fileShow(event,rc,prc){
		prc.image = #form.trees#
		
		event.setView("main/showFile");
	}

	function process_fileUpload(event,rc,prc){
		prc.errorMsg = "";
		prc.displayMsg = "";
		if (!structKeyExists(form, "filename") || form.filename == ''){
			prc.errorMsg = "Pick a file to upload";
			event.SetView(view="main/nav/fileViewer", layout="tabNav");		
		}
		else{
			fileUpload("#ExpandPath("includes/mywebsitefiles")#", "#form.filename#", "image/png,image/jpg", "MakeUnique");
			prc.displayMsg = "File uploaded!";
			event.SetView(view="main/nav/fileViewer", layout="tabNav");
			
		}
		event.SetView(view="main/nav/fileViewer", layout="tabNav");
	}

	function process_fileDownload(event,rc,prc){
		prc.pageHtml = #form.htmlPath#
		event.setView(view="main/generatePDF");
	}
}






