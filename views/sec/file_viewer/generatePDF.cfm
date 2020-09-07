<cfset pageHtml = fileRead("#prc.pageHtml#")>
<cfcontent type="application/pdf">
<cfheader name="Content-Disposition" value="attachment;filename=page_as.pdf">
<cfdocument format="pdf">
   	<h1>Hello <cfoutput>#Session.user#</cfoutput></h1>
   	<p>This is a PDF representation of the last page's html.</p>
	<hr>
   	<cfscript>
		myfile = FileOpen("#prc.pageHtml#", "read");
		while(NOT FileisEOF(myfile)){
			x = FileReadLine(myfile);
			WriteOutput("#x#");
		}
	FileClose(myfile);
	</cfscript>

<cfdocumentitem type="footer" evalatprint="true">
	<cfoutput> #TimeFormat(Now())# on #DateFormat(Now())#</cfoutput>
</cfdocumentitem>
</cfdocument>


