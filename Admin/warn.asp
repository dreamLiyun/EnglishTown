<%
if session("UserName")="" then
response.Write"<script  language='javascript'>alert('由于您长时间未登录，请您重新登录！');self.parent.location.href='login.asp';</script>"
end if 
%>
