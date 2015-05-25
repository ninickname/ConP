<%@ page contentType="text/html;charset=UTF-8" language="java" import="tokbox.*,tokbox.TokBoxApi" %>
<script src="//static.opentok.com/v2/js/opentok.min.js"></script>
<div class="well">
    <button onclick="startSession()" class="btn btn-success">Press me now!!!</button>
    <script type="text/javascript">

        function startSession() {

            var apiKey = '<%=TokBoxApi.apiKey%>';
            var sessionId = '${param.sessionId}';
            var token = '${param.token}';


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
</div>
