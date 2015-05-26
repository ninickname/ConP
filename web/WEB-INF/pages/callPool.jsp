<%@ page contentType="text/html;charset=UTF-8" language="java" import="tokbox.*,tokbox.SessionOb,java.util.List" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>

<div class="well">
    <ul class="list-group">
        <%  List<SessionOb> lsob = SessionOb.getActiveSessions();
            for(int i=0; i < lsob.size();i++){
                String sessionId = (lsob.get(i)).getSessionId();
                String token = SessionOb.getToken(sessionId);
        %>
        <li><a href="index.jsp?content=video_call&sessionId=<%=sessionId%>&token=<%=token%>" class="btn btn-success">Client <%=(lsob.get(i)).getClient().getUserName()%> is waiting for you from <%=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format((lsob.get(i)).getCreated_at().getTime())%> </a></li>
        <%}%>
    </ul>
</div>


