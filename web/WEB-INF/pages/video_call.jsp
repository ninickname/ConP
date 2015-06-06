<%@ page contentType="text/html;charset=UTF-8" language="java" import="tokbox.*,tokbox.TokBoxApi" %>
<%@ page import="sitePackage.User" %>
<%@ page import="java.util.Date" %>
<script src="//static.opentok.com/v2/js/opentok.min.js"></script>
<div class="well" id="video_call">
    <script type="text/javascript">

        var cw = $('#videoCaller').width();
        $('#videoCaller').css({'height': cw + 'px!important'});

        var cv = $('#videoWrapper').width();
        $('#videoWrapper').css({'height': cv + 'px!important'});

        var apiKey;
        var sessionId;
        var token;
        var videoSession;
        var publisher;
        function startSession() {
            $("#start_session_btn").addClass("loading");
            <%
            SessionOb sob = SessionOb.getSessionById(Integer.parseInt(request.getParameter("id")));
            %>
            apiKey = '<%=TokBoxApi.apiKey%>';
            sessionId = '<%=sob.getSessionId()%>';
            token = '<%=SessionOb.getToken(sob.getSessionId())%>';
            <%
            User ob = (User) request.getSession().getAttribute("user");
            String role = ob == null? "none" : ob.getRole();
            if(role.equals("Employee"))
            {
             sob.setEmployee(ob);
             }
             if(role.equals("User"))
            {
             sob.setClient(ob);
             }

             SessionOb.saveSession(sob);
            %>

            videoSession = OT.initSession(apiKey, sessionId);

            videoSession.on("streamCreated", function (event) {
                videoSession.subscribe(event.stream, "videoCaller", {width: "100%", height: "100%"});
            });

            videoSession.connect(token, function (error) {
                publisher = OT.initPublisher("videoWrapper", {width: "20%", height: "20%"});
                videoSession.publish(publisher);

                $("#start_session_btn").hide();
                $("#end_session_btn").show();

            });
        }

        function endSession() {
            $("#start_session_btn").addClass("loading");

            videoSession.unpublish(publisher);
        }

    </script>
    <div class="row">
        <div class="well">
            <div id="videoWrapper" class="col-md-12"></div>
            <div id="videoCaller" class="col-md-12"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <form class="form-horizontal" action='videoSessionServlet' method="POST" name="ArtForm">
                <input type="text" id="id" name="id" value="<%=sob.getId()%>" hidden="hidden">
                <button  onclick="endSession()" type="submit" class="btn btn-warning" id="end_session_btn">End call</button>
            </form>
            <button onclick="startSession()" class="btn btn-success" id="start_session_btn">Turn on video!!!</button>
        </div>
        <small class="text-danger">Make sure you allowed access your video camera from the browser</small>
    </div>


</div>
