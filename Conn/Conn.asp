<%
dim conn,connstr
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&server.MapPath("..\Data\data.mdb")
set conn=server.CreateObject("ADODB.Connection")
on Error resume next
conn.open connstr
if ERR then
ERR.clear
set conn=nothing
response.Write("数据库连接失败！")
response.End()
end if
%>