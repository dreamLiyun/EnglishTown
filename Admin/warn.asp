<%
if session("UserName")="" then
response.Write"<script  language='javascript'>alert('��������ʱ��δ��¼���������µ�¼��');self.parent.location.href='login.asp';</script>"
end if 
%>
