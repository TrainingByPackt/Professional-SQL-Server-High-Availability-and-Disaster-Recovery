$ConnectionString = "Data Source=DPLAGL;Initial Catalog=Sales;integrated security=true"
$SqlConnection = new-object system.data.SqlClient.SQLConnection($ConnectionString)
#$query = "Select * from Sales.SalesOrderDetail"
#$Sqlcommand = new-object system.data.sqlclient.sqlcommand($query,$SqlConnection)
$SqlConnection.Open()
#$Sqlcommand.ExecuteNonQuery()
