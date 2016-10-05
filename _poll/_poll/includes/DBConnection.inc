<%

dim sConn 
dim objConn
dim objRS

'  Define the connection string
sConn = "data source=localhost;initial catalog=ticketSQL;Integrated Security=true"

'  Create the connection object
set ObjConn = Server.CreateObject("AdoDb.Connection")

'  Open the connection
ObjConn.open sConn

%>