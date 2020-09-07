/**
 * Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	// Application properties
	this.name              = hash( getCurrentTemplatePath() );
	this.sessionManagement = true;
	this.sessionTimeout    = createTimespan( 0, 0, 30, 0 );
	this.setClientCookies  = true;

	// Java Integration
	this.javaSettings = {
		loadPaths               : [ expandPath( "./lib" ) ],
		loadColdFusionClassPath : true,
		reloadOnChange          : false
	};

	// COLDBOX STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR COLDBOX APP
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	// The web server mapping to this application. Used for remote purposes or static purposes
	COLDBOX_APP_MAPPING   = "";
	// COLDBOX PROPERTIES
	COLDBOX_CONFIG_FILE   = "";
	// COLDBOX APPLICATION KEY OVERRIDE
	COLDBOX_APP_KEY       = "";

	// application start
	public boolean function onApplicationStart() {
		application.cbBootstrap = new coldbox.system.Bootstrap(
			COLDBOX_CONFIG_FILE,
			COLDBOX_APP_ROOT_PATH,
			COLDBOX_APP_KEY,
			COLDBOX_APP_MAPPING
		);
		application.cbBootstrap.loadColdbox();
		return true;
	}

	// application end
	public void function onApplicationEnd( struct appScope ) {
		arguments.appScope.cbBootstrap.onApplicationEnd( arguments.appScope );
		Session.LoggedIn = false;

	}

	// request start
	public boolean function onRequestStart( string targetPage ) {
		// Process ColdBox Request
		application.cbBootstrap.onRequestStart( arguments.targetPage );
		var page = CGI.path_info;
		if (page != "/signIn" && page != "/verifyUser/"){
			checkLoginStatus(page);
		}
		return true;
	}

	public void function onSessionStart() {
		application.cbBootStrap.onSessionStart();
		Session.LoggedIn = false;
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ) {
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection = arguments );
		Session.LoggedIn = false;
	}

	public boolean function onMissingTemplate( template ) {
		return application.cbBootstrap.onMissingTemplate( argumentCollection = arguments );
	}
	<!--- writeDump(var = cgi, label = "CGI Scope"); --->
	function checkLoginStatus( path ){
		if (Session.LoggedIn == false){
			location(url="/signIn?errorMsg=You need to login to view that page"); 
			Session.cur_path = path;

		}
	}
	

	
}


