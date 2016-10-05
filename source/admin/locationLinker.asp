<%@ Language=VBScript %>
<%Option Explicit%>
<html>
<head>
	<link rel=stylesheet type="text/css" href="../style.css">
	
<script language=javascript>
<!--
//  Return the name built properly
function linkIt() {
	//  Build the link based on the values entered - we assume everything is build properly
	window.returnValue = document.linker.strName.value + ',' + document.linker.strAddress.value + ',' + document.linker.strCity.value + ',' + document.linker.strState.value + ',' + document.linker.strZip.value;
	window.close();
}

//-->
</script>

</head>
<title>Build Map Link</title>
<body bgcolor="#333333">


<table width=420 cellspacing=0 cellpadding=0 border=1 bordercolor="#737373" align=center bgcolor="#FFFFFF">
<tr>
	<td bgcolor="#ffffff"><table width=412 cellspacing=0 cellpadding=4 border=0 align=center><tr><td class=subHead>Location Linker</td></tr></table></td>
</tr>
<tr>
	<td>
		<!-- Form to show the name and address fields -->
		<form name=linker id=linker>
		<table width=420 cellspacing=0 cellpadding=4 border=0 align=center>
			<tr>
				<td colspan=2>Fill out each field completely or the linker will not work properly.<br><span class=fineprint>NOTE: Do NOT use any commas in your entries on this form.  That will cause the linker to not function properly.  Also, once you save this link and the Location field is populated with the link info on the Event form, DO NOT change anything in the location bar or it will cause the linker to not work.  Be sure to check the Include Map checkbox on the Event form to include a link to a map to this address.</span></td>
			</tr>
			<tr>
				<td align=right>Name of Place: </td>
				<td><input type=text name=strName style="width:300px"></td>
			</tr>
			<tr>
				<td align=right>Street Address: </td>
				<td><input type=text name=strAddress style="width:300px"></td>
			</tr>
			<tr>
				<td align=right>City: </td>
				<td><input type=text name=strCity style="width:300px"></td>
			</tr>
			<tr>
				<td align=right>State: </td>
				<td><input type=text name=strState maxlength=2 style="width:300px"></td>
			</tr>
			<tr>
				<td align=right>Zip: </td>
				<td><input type=text name=strZip style="width:300px"></td>
			</tr>
			<tr>
				<td colspan=2 align=center><button class=button name=save onclick="javascript:linkIt();">Save</button>&nbsp;&nbsp;<button name=cancel class=button onClick="window.returnValue=''; window.close();">Cancel</button></td>
			</tr>
		</table>
		</form>
	</td>
</tr>
</table>

</body>
</html>