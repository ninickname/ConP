<%@ page contentType="text/html;charset=UTF-8" language="java" import="tokbox.*,tokbox.SessionOb,java.util.List" %>

<div class="well">
    <ul class="list-group">
        <%  List<SessionOb> lsob = SessionOb.getSessions();
            for(int i=0; i < lsob.size();i++){
            if ( !lsob.get(i).isActive()){
                continue;
            }
            String sessionId = (lsob.get(i)).getSessionId();
            String token = SessionOb.getToken(sessionId);
        %>
        <li><a href="index.jsp?content=video_call&sessionId=<%=sessionId%>&token=<%=token%>" class="btn btn-success">Client name </a></li>
        <%}%>
    </ul>
</div>


