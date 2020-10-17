<cfoutput>
	<div class="row">
		<div class="col">
			<div class="list-group">
				<cfif session.user.isUserInGroup("ADMIN")>
					<a href="#event.buildLink(prc.xeh.importIndex)#" class="list-group-item">Manage Imports</a>
				</cfif>
				<a href="#event.buildLink(prc.xeh.rootsIndex)#" class="list-group-item">Manage Roots and Streams</a>
				<a href="#event.buildLink(prc.xeh.riversIndex)#" class="list-group-item">Manage Rivers of Rhythm</a>
			</div>
		</div>
	</div>
</cfoutput>