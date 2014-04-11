<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>top</title>
<style type="text/css">
body {margin: 0px;}
td   {font-size:14px;color:#000000;font-family:  Helvetica, sans-serif, "宋体";}
</style>
</head>
<script type="text/javascript">
var oInterval = "";
function fnStartInterval(){
oInterval = window.setInterval("fnRecycle()",1000);
}
function fnRecycle(){
// Code to display hours, minutes, and seconds.
var day="";
		var month="";
		var ampm="";
		var ampmhour="";
		var myweekday="";
		var year="";
		var ht="";
		var mt="";
		var st="";
		mydate=new Date();
		myweekday=mydate.getDay();
		mymonth=mydate.getMonth()+1;
		myday= mydate.getDate();
		myyear= mydate.getYear();
		ht = mydate.getHours();
		mt = mydate.getMinutes();
		st = mydate.getSeconds();
		year=(myyear > 200) ? myyear : 1900 + myyear;
		if(myweekday == 0)
		weekday=" 星期日 ";
		else if(myweekday == 1)
		weekday=" 星期一 ";
		else if(myweekday == 2)
		weekday=" 星期二 ";
		else if(myweekday == 3)
		weekday=" 星期三 ";
		else if(myweekday == 4)
		weekday=" 星期四 ";
		else if(myweekday == 5)
		weekday=" 星期五 ";
		else if(myweekday == 6)
		weekday=" 星期六 ";
		//document.write(year+"年"+mymonth+"月"+myday+"日 "+weekday);
		document.getElementById("time").innerHTML=year+"年"+mymonth+"月"+myday+"日 "+weekday+"  "+((ht<10)?"0":"")+ht+((mt<10)?":0":":")+mt+((st<10)?":0":":")+st;
}

</script>
<body onLoad="fnRecycle();fnStartInterval()">
<table width="100%"  border="0" cellpadding="8" cellspacing="0" align="center">
  <tr>
    <td width="22%" valign="middle" style="font-size:30px;height:60px"><img src="Image/logo.png" height="100" width="300" /></td>
    <td width="78%" valign="bottom" align="right">当前时间：<span id="time">tty</span></td>
  </tr>
  <tr>    
    <td width="40%" style="color:#000000;"><marquee loop="-1" style="color:#0000FF">最新章节</marquee></td>
    <td width="60%" align="right" style="color:#000000;"></td>
  </tr>
</table>
</body>
</html>
