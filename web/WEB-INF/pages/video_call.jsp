<%@ page contentType="text/html;charset=UTF-8" language="java" import="tokbox.*,tokbox.TokBoxApi" %>
<script src="//static.opentok.com/v2/js/opentok.min.js"></script>
<div class="well" id="video_call">

    <div class="row">
        <div class="well">
            <div id="videoWrapper" class="col-md-12"></div>
            <div id="videoCaller" class="col-md-12"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <button onclick="endSession()" class="btn btn-warning" id="end_session_btn">End call</button>
            <button onclick="startSession()" class="btn btn-success" id="start_session_btn">Turn on video!!!</button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#feedbackleModal" data-whatever="@getbootstrap">Feedback</button>
        </div>
        <small class="text-danger">Make sure you allowed access your video camera from the browser</small>
</div>
    <div class="modal fade" id="feedbackleModal" tabindex="-1" role="dialog" aria-labelledby="feedbackModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="feedbackModalLabel">New message</h4>
                </div>
                <div class="modal-body">
                    <form >
                       <!-- TODO 5 Star /-->
                        <div class="form-group">
                            <label for="message-text" class="control-label">Feedback:</label>
                            <textarea class="form-control" id="message-text"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Skip</button>
                    <button type="button" class="btn btn-primary">Send message</button>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">

        var cw = $('#videoCaller').width();
        $('#videoCaller').css({'height':cw+'px!important'});


        var cv = $('#videoWrapper').width();
        console.log(cv);
        $('#videoWrapper').css({'height':cv+'px!important'});

        var apiKey;
        var sessionId;
        var token;
        var videoSession;
        var publisher;
        function startSession() {
            $("#start_session_btn").addClass("loading");

            apiKey = '<%=TokBoxApi.apiKey%>';
            sessionId = '${param.sessionId}';
            token = '${param.token}';


            videoSession = OT.initSession(apiKey, sessionId);

            videoSession.on("streamCreated", function (event) {
                videoSession.subscribe(event.stream,"videoCaller",{width: "100%", height: "100%"});
            });

            videoSession.connect(token, function (error) {
                publisher = OT.initPublisher("videoWrapper",{width: "20%", height: "20%"});
                videoSession.publish(publisher);

                $("#start_session_btn").hide();
                $("#end_session_btn").show();

            });
        }


        function endSession() {
            $("#start_session_btn").addClass("loading");

            videoSession.unpublish(publisher);
            $.post("endVideoCall",{"sessionId":sessionId},function(){


            })


        }

    </script>
</div>
