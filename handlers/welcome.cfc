/**
 * I am a new handler
 */
component{

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use

	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

	/**
	 * index
	 */
	function index( event, rc, prc){
	<!--- Something weird here happens I don't understand.  When Session.LoggedIn == false, and I navigate to "/welcome",  
	Application.cfc sends me to "/unsec/signIn?errorMsg=Log in to view that page" like I want.  However, when I am not
	logged in and navigate to "/welcome?userid=blahblah", it sends me to "/unsec/signIn?errorMsg=An error occurred.  	Please sign-in again."  This is doubly weird because A. Application.cfc doesnt notice I am not logged in before I get 	here and B. rc.userid exists so this if clause shouldn't happen.  If Application.cfc isn't catching me, shouldn't I 	just carry onto "/welcome"? --->
		if (!(structKeyExists(Session, "user"))){
			Session.LoggedIn = false;
			relocate(uri="/unsec/signIn?errorMsg=An error occurred.  Please sign-in again.");
			
		}
		prc.welcomeMessage = "hi, #Session.user#";
		event.setView(view="sec/welcome", layout="secured");
	}
	function verifyUser( event, rc, prc ){
		
	}
	
	function logout( event, rc, prc ){
		Session.LoggedIn = false;
		StructDelete(Session, "user");
		relocate(uri="/main/index/?errorMsg=You are logged out.")

	}



}
