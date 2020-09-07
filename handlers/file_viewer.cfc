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
	function index( event, rc, prc ){
		event.setView( view="sec/file_viewer", layout="secured" );
	}

	/**
	 * show
	 */
	function show( event, rc, prc ){
		prc.image = #form.trees#
		event.setView( view="sec/file_viewer/show_file", layout="secured_no_head" );
	}
	
	/**
	 * upload
	 */
	function upload( event, rc, prc ){
		if (!structKeyExists(form, "filename") || form.filename == ''){
			
			relocate(uri="/file_viewer.cfm?error=Pick a file to upload");
		
		}
		else{
			fileUpload("#ExpandPath("includes/mywebsitefiles")#", "#form.filename#", "image/png,image/jpg", "MakeUnique");
			relocate(uri="/file_viewer.cfm?success=File uploaded!")
			
		}
	}

	/**
	 * download
	 */
	function download( event, rc, prc ){
		prc.pageHtml = #form.htmlPath#
		event.setView( view="sec/file_viewer/generatePDF");
	}



}
