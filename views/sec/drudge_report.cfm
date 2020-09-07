<cfoutput>

<cfhttp url="https://www.drudgereport.com/"
useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36 Edg/84.0.522.59"
resolveurl=true
>

<cfset modifiedDrudge= REreplaceNoCase(CFHTTP.fileContent, 'HREF=(.+?)>', "href='https://www.mind-over-data.com'>", "ALL")> 

<!--- <cfset modifiedDrudge= replaceNoCase(CFHTTP.fileContent, 'HREF="https://',  "href='http://www.mind-over-data.com?garbage=", "ALL")> --->


<div class="sec">
	<h2>Data over Drudge Report</h2>
	<label>#modifiedDrudge#<label>
</div>



</cfoutput>
