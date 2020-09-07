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

	function index( event, rc, prc ){
		
		if ((event.getValue("userid") == '') || (event.getValue("password") == '')){
			relocate(uri="/unsec/signIn?errorMsg=Please enter your UserID and password");
		}
		elseif (event.getValue("password") != "test"){
			relocate(uri="/unsec/signIn?errorMsg=Incorrect password entered");
		}
		else{
			Session.LoggedIn = true;
			Session.user = rc.userid;
    			relocate(uri="/welcome.cfm");		
		}

	}



}
