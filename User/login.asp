
<html>
<head >
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <style type="text/css">
    .div-b{ background:#000; -moz-opacity:0.5; -webkit-opacity:0.5; opacity:0.5;filter: Alpha(opacity=50);
             color:Red;vertical-align:middle;margin: -108px 0px 0px -208px; padding: 0px; height: 216px; text-align: center; top: 50%; left: 50%; width: 416px; position: absolute;} 
    </style>
    <script src="../js/function.js" type="text/javascript"></script>
    </head>
<body>
<img border='0' src='../image/bg.jpg' width='100%' height='100%' style='position: absolute;left:0px;top:0px;z-index: -1'>

 <form id="logfrm" method="post" action="ChkLog.asp" onsubmit="return ChkForm(this);">
    <div style="vertical-align:middle;margin: -108px 0px 0px -208px; padding: 0px; height: 216px; text-align: center; top: 50%; left: 50%; width: 416px; position: absolute;"><div  class="div-b" ></div>
      <div style="vertical-align:middle;margin: -108px 0px 0px -208px; padding: 0px; height: 216px; text-align: center; top: 50%; left: 50%; width: 416px; position: absolute;"> 
      <br/><br />
      <table align="center">
       <tr><td align="left" ><font color=white>用户名：</font></td>
       <td><input id="myname" type="text"  size="20" /></td></tr>
       <tr><td align="left" ><font color=white>密码:</font></td>
       <td> <input id="mypsw" type="password"  size="20"   /></td></tr>
       <tr align="center"><td colspan="2"> <input id="Submit1" type="submit" value="提交" /></td></tr>
      
        </table>
        </div>
        
    </form>
</body>
</html>

<script type="text/javascript">
    function ChkForm(objfm) {
        var name, psw;
        name = Trim(objfm.myname.value);
        psw = Trim(objfm.mypsw.value);
        if (name.indexOf(" ") != -1) {
            alert("用户名中不能包含空格！");
            objfm.myname.focus();
            return false;
        }
        else if (name.length == 0) {
            alert("请输入用户名");
            objfm.myname.focus();
            return false;
        }

        if (psw.indexOf(" ") != -1) {
            alert("密码中不能包含空格！");
            objfm.mypsw.focus();
            return false;
        }
        else if (psw.length == 0) {
            alert("请输入密码");
            objfm.mypsw.focus();
            return false;
        }
        return true;
    }


 
</script>