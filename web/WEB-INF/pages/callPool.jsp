<%@ page contentType="text/html;charset=UTF-8" language="java" import="tokbox.*,tokbox.SessionOb" %>

<div class="well">
    <ul class="list-group">
        <% for(int i=0; i < SessionOb.currentSessions.size();i++){
            if ( !SessionOb.currentSessions.get(i).getIsActive()){
                continue;
            }
            String sessionId = (SessionOb.currentSessions.get(i)).sessionId;
            String token = SessionOb.getToken(sessionId);

        %>
        <li><a href="index.jsp?content=video_call&sessionId=<%=sessionId%>&token=<%=token%>" class="btn btn-success">Client name </a></li>
        <%}%>
    </ul>
</div>


