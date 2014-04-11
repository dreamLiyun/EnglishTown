<!--#include file="../Conn/Conn.asp"-->
<!-- #include file="../function/function.asp" -->
<%
dim Result(1,3)
Result(0,0)="Word"
Result(0,1)="PhoneticSymbol"
Result(0,2)="Meaning"
Result(0,3)="Pronouinciation"
Result(1,0)=trim(request.Form("Word"))
Result(1,1)=trim(request.Form("WordYinbiao"))
Result(1,2)=trim(request.Form("WordMeaning"))
Result(1,3)=trim(request.Form("WordPronounce"))


'Message strList&RsList
dim chp
chp=0
str=addDatabase(Result,"T_Word","Hello")
Message str
Conn.execute(str)
strtimr=Format_Time(now(),5)
SQL ="Select Count('ID'),Chapter from [T_Chapter] where Date="+strtimr
Set Rs=server.CreateObject("ADODB.Recordset")
Rs.open SQL ,conn,2,3
if Rs.eof or Rs.bof then 
SQL ="Select Chapter from [T_Chapter] order by ID DESC"
Set RsCh=server.CreateObject("ADODB.Recordset")
RsCh.open SQL ,conn,2,3
if rs.eof or rs.bof then
chp=0
else
chp=RsCh("Chapter")+1
end if
RsCh.close
set RsCh=nothing
SQL = "insert into [T_Chapter](Chapter,Date) values('"+chp+"','"+strtimr+"')"
end if
Rs.close
Set Rs=nothing
%>
<script language="javascript">
self.location="addword.asp";
</script>