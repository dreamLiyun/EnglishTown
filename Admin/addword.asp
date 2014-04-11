<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="../Conn/Conn.asp"-->
<!--#INCLUDE file="../function/function.asp"-->
<%
if request.QueryString("action")="del" then
SQL = "delete * from [T_Word] where ID="+Request.QueryString("id")
Conn.execute(SQL)
response.Redirect("addword.asp?action=update&Chapter="+Request.QueryString("Chapter"))
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>add word</title>
<link rel="stylesheet" type="text/css" href="../style/style.css" />
<script language="javascript">
function TestPlay()
{
   var MusPath=document.addform.WordPronounce.value;
   if(MusPath=="")
   {
    alert("没有输入路径！请输入路径");
	return;
   }
   Play(MusPath);
}
function Play(MusicPath)
{

//BgPlay.stop();
//var str = "<embed name='BgPlay'  autostart='true' src='"+ MusicPath +"' volume=10></embed>";
var str= "<audio autoplay='autoplay' src='"+MusicPath+"'></audio>"
document.getElementById("MusicPart").innerHTML = str;

}

function CheckForm()
{
var fm=document.addform;
if(fm.Word.value=="")
{
alert("Please Enter Word!");
return false;
}
if(fm.WordYinbiao.value=="")
{
alert("Please Enter Text!");
return false;
}
if(fm.WordMeaning.value=="")
{
alert("Please input WordMeaning!");
return false;
}
if(fm.WordPronounce.value=="")
{
alert("Please Input Word Pronounce!");
return false;
}
return true;
}

</script>
</head>
<%
dim strmusic,strmusic1
strmusic="./1.Mp3"
strmusic1="http://res.iciba.com/resource/amp3/1/0/5d/41/5d41402abc4b2a76b9719d911017c592.mp3"


%>
<body>
<div id="MusicPart" style="display:none">
<EMBED name="BgPlay"  src="<%=strmusic%>" autostart="true" loop="false"   hidden="true" volume=10 ></embed>
<audio autoplay="autoplay"  src="<%=strmusic%>" >
</audio>
</div> 
<table align="center" width="100%">
<tr  height="200">
<td>
<div align="center">
<form name="addform" method="post" action="AddDeal.asp" onsubmit="return CheckForm()">
<table border="0" width="80%" align="center">
<tr>
<td width="42%" align="right">单词</td>
<td width="58%" align="left"><input type="text" name="Word"  /></td>
</tr>
<tr>
<td align="right">音标</td>
<td align="left"><input type="text" name="WordYinbiao" /></td>
</tr>
<td align="right">释义</td>
<td align="left"><input name="WordMeaning" type="text" size="50" /></td>
<tr>
<td align="right">发音</td>
<td align="left"><input name="WordPronounce" type="text" size="50" />
&nbsp;&nbsp;<label style="cursor:hand;"  onclick="TestPlay();">测试<img src="../Image/Voice.png" height="20" align="bottom"/></label></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="增加" /></td>
</tr>
</table>
</form>
</div>
</td>
</tr>
<tr valign="bottom">
<td>
<%

dim strchapt,strtime
strtime=Format_Time(now(),5)
set rs=server.CreateObject("ADODB.Recordset")
if request.QueryString("action")<>"update" then
SQL = "select Chapter  from [T_Chapter] where date='"+strtime+"'"
else
SQL = "select *  from [T_Chapter] where Chapter = "+Request.QueryString("Chapter")
end if
rs.open SQL,conn,1,1
if (rs.eof or rs.bof) then
%>
<div align="center" style="border:0px solid #000000;">
<br/>
<center><font size="+2" style="font:bolder">当前没有记录！</font></center>
<br />
</div>
<%
else
strchapt=rs("Chapter")
%>
<div align="center" style="border:1px solid #000000;">
<br/>
<center><font size="+2" style="font:bolder">第<%=strchapt%>章</font></center>
<br />
<table align="center" width="80%" rules="rows" >
<tr class="tableTitle">
<td>序号</td>
<td>单词</td>
<td>音标</td>
<td>释义</td>
<td>发音</td>
<td>编辑</td>
</tr>
<%
dim inum
inum=1
Set Rscord=server.CreateObject("ADODB.Recordset")
SQL ="select ID,Word,PhoneticSymbol,Meaning,Pronouinciation from [T_Word] where Chapter="&strchapt&" order by ID ASC"
Rscord.open SQL,conn,1,1
if (Rscord.eof or Rscord.bof) then
%>
<tr class="tableCell">
<td colspan="5">当前没有记录</td>
</tr>
<%
else
do while not Rscord.eof 
%>
<tr class="tableCell">
<td><%=inum%></td>
<td><%=trim(Rscord("Word"))%></td>
<td><%=trim(Rscord("PhoneticSymbol"))%></td>
<td><%=trim(Rscord("Meaning"))%></td>
<td><img  style="cursor:hand;" src="../Image/Voice.png"  onclick="Play('<%=trim(Rscord("Pronouinciation"))%>');" /></td>
<td><a href="javascript:EditWord('<%=trim(Rscord("Word"))%>','<%=trim(Rscord("PhoneticSymbol"))%>','<%=trim(Rscord("Meaning"))%>','<%=trim(Rscord("Pronouinciation"))%>');">编辑</a>&nbsp;&nbsp;<a href="addword.asp?action=del&id=<%=Rscord("ID")%>&Chapter=<%=Request.QueryString("Chapter")%>">删除</a></td>
</tr>
<%
Rscord.movenext
if Rscord.eof then
exit do
end if
inum=inum+1
loop

end if
Rscord.close
Set Rscord=nothing
%>
</table>
<BR/>
</div>
<%
end if
rs.close
Set rs=nothing
%>
</td>
</tr>
</table>
</body>
</html>
<script language="javascript">
function EditWord(wo,ph,me,sr)
{
   var myFm=document.addform;
   myFm.Word.value=wo;
   myFm.WordYinbiao.value=ph;
   myFm.WordMeaning.value=me;
   myFm.WordPronounce.value=sr;
}
</script>
