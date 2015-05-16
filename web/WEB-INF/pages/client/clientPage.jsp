<%@ page contentType="text/html;charset=UTF-8" language="java" import="tokbox.*" %>

<script src="//static.opentok.com/v2/js/opentok.min.js"></script>

<div class="well">
    <form action="tokboxServlet" method="post" name="videoForm" class="form-horizontal">
        <button type="submit" class="btn btn-success">Get session</button>
    </form>
</div>

<div class="well">
    <button onclick="startSession()" class="btn btn-success">Press me now!!!</button>
</div>

<script type="text/javascript">

    function startSession() {

        var apiKey = '<%=session.getAttribute("apiKey")%>';
        var sessionId = '<%=session.getAttribute("sessionId")%>';
        var token = '<%=session.getAttribute("token")%>';

        var session = OT.initSession(apiKey, sessionId);

        session.on("streamCreated", function (event) {
            session.subscribe(event.stream);
        });

        session.connect(token, function (error) {
            var publisher = OT.initPublisher();
            session.publish(publisher);
        });
    }
</script>


