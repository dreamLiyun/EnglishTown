<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
A {
text-decoration:none;
color:#FFFFFF;
}
A:hover{
color:#FF0000;
}
A:active{
color:#FFFF33;
}
</style>
</head>
<script language="javascript">
function showHide(obj,objimg)
{
	obj.style.display = obj.style.display == "none" ? "block" : "none";
	if(obj.style.display=="none")
	{
	objimg.src="../Image/nolines_plus.gif";
	}
	else
	{
	objimg.src="../Image/nolines_minus.gif";
	}
}
</script>
<body bgcolor="#0066FF">
<table cellpadding=0 cellspacing=0 align=center id="tb" bgcolor="#0066FF" width="100%">
 <tr height="100">
 <td>User Info</td>
 </tr>
  <tr  align="center">
    <td id=menuTitle1 style="cursor:hand;" onClick="showHide(m0,menuTitle1img)"><img src="../Image/nolines_plus.gif" align="absbottom" name="menuTitle1img" /><font style="font:bold" color="#FFFFFF"  size="+2">用户设置</td>
  </tr>
  <tr id="m0"  style="display:none"  align="center">
    <td align='right'>
        <table cellpadding=0 cellspacing=0 align="center">
          <tr>
            <td ><a href="user_Add.asp" target="adminmain"><img src="../Image/join.gif" align="absbottom" border="0"  />添加用户</a></td>
          </tr>
          <tr>
            <td ><a href="userManage.asp" target="adminmain"><img src="../Image/joinbottom.gif" align="absbottom" border="0" />用户管理</a></td>
          </tr>
        </table>
    </td>
  </tr>
  <tr  align="center">
    <td id=menuTitle2 style="cursor:hand;" onClick="showHide(m2,menuTitle2img)"><img src="../Image/nolines_plus.gif" align="absbottom" name="menuTitle2img" /><font style="font:bold" color="#FFFFFF"  size="+2">试卷管理</td>
  </tr>
  <tr id="m2"  style="display:none"  align="center">
    <td align='right'>
        <table cellpadding=0 cellspacing=0 align="center">
          <tr>
            <td ><a href="addword.asp" target="adminmain"><img src="../Image/join.gif" align="absbottom" border="0" />章节添加</a></td>
          </tr>
		  <tr>
            <td ><a href="ChapterEdit.asp" target="adminmain"><img src="../Image/joinbottom.gif" align="absbottom" border="0" />章节修改</a></td>
          </tr>
        </table>
    </td>
  </tr>
  <tr  align="center">
    <td id=menuTitle3 style="cursor:hand;" onClick="showHide(m3,menuTitle3img)"><img src="../Image/nolines_plus.gif" align="absbottom" name="menuTitle3img" /><font style="font:bold" color="#FFFFFF"  size="+2">考试管理</td>
  </tr>
  <tr id="m3"  style="display:none"  align="center">
    <td align='right'>
        <table cellpadding=0 cellspacing=0 align="center">
          <tr>
            <td ><a href="addtest.asp" target="adminmain"><img src="../Image/join.gif" align="absbottom" border="0" />试题发布</a></td>
          </tr>
		  <tr>
            <td ><a href="user_Add.asp" target="adminmain"><img src="../Image/joinbottom.gif" align="absbottom" border="0" />试题批改</a></td>
          </tr>
        </table>
    </td>
  </tr>
</table>
</body>
</html>
