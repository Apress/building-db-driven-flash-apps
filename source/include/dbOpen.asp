<%
' OPEN DB CONNECTION
DIM oConn
Dim sConn

'  BUild the connection string
sConn = "DRIVER=SQL Server;SERVER=sql.nteg.com;UID=KIST;APP=Microsoft Development Environment;DATABASE=KIST;User Id=KIST;PASSWORD=stupid;" 

'  Open the connection	        
set oConn = server.CreateObject("ADODB.Connection")

oConn.Open(sConn)


%>