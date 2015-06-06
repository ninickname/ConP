<%@ page contentType="text/html;charset=UTF-8" language="java" import="tokbox.*,sitePackage.UserDAO,tokbox.SessionOb" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.TimeZone" %>
<script src="js/Chart.js"></script>
<div class="row">
    <legend>Global Statistics</legend>
    <div class="col-md-4">
        <label>Total Users: (<%= UserDAO.getUsers().size()%>)</label>
        <div class="row">
            <div class="col-md-8">
                <canvas id="myUsers" width="400" height="400"></canvas>
            </div>
        </div>
        <script>
            var data = [
                {
                    value: <%= UserDAO.getApprovedClients().size()%>,
                    color:"#F7464A",
                    highlight: "#FF5A5E",
                    label: "Clients approved"
                },
                {
                    value: <%= UserDAO.getNotApprovedClients().size()%>,
                    color: "#46BFBD",
                    highlight: "#5AD3D1",
                    label: "Clients not approved"
                },
                {
                    value: <%= UserDAO.getAdmins().size()%>,
                    color: "#FDB45C",
                    highlight: "#2FC555",
                    label: "Admins"
                }
                ,
                {
                    value: <%= UserDAO.getManagers().size()%>,
                    color: "#F2B43C",
                    highlight: "#3FC276",
                    label: "Managers"
                }
                ,
                {
                    value: <%= UserDAO.getEmployees().size()%>,
                    color: "#11649C",
                    highlight: "#FF3373",
                    label: "Employees",
                    labelColor : 'white',
                    labelFontSize : '16'
                }
            ];

            var eval_L = "< %";
            eval_L = eval_L.replace(' ','');

            var eval_R = "% >";
            eval_R = eval_R.replace(' ','');
            var options = {
                segmentShowStroke : false,
                animateScale : true,
                responsive: true
            };
            var myUsers = document.getElementById('myUsers').getContext('2d');
            var myPieChart = new Chart(myUsers).Pie(data,options);

        </script>
    </div>
    <div class="col-md-4">
        <label>Total Sessions: (<%= SessionOb.getSessions().size()%>)</label>
        <div class="row">
            <div class="col-md-8">
            <canvas id="mySessions" width="400" height="400"></canvas>
            </div>
        </div>
        <%  SimpleDateFormat printFormat = new SimpleDateFormat("HH:mm:ss");
            printFormat.setTimeZone(TimeZone.getTimeZone("GMT+0:00"));

        %>
        <label>Average session time: <%= printFormat.format(SessionOb.getAverageSessionTime().getTime())%> minutes</label>
        <script>
            var data = [
                {
                    value: <%= SessionOb.getActiveSessions().size()%>,
                    color:"#F7464A",
                    highlight: "#FF5A5E",
                    label: "Opened sessions"
                },{
                    value: <%= SessionOb.getNotAvticeSessions().size()%>,
                    color: "#46BFBD",
                    highlight: "#5AD3D1",
                    label: "Closed sessions"
                },{
                    value: <%= SessionOb.getOngoingSessions().size()%>,
                    color: "#11649C",
                    highlight: "#FF3373",
                    label: "Ongoing sessions"
                }
            ];

            var options = {
                segmentShowStroke : false,
                animateScale : true,
                responsive: true
            };
            var mySessions = document.getElementById('mySessions').getContext('2d');
            var myPieChart = new Chart(mySessions).Pie(data,options);

        </script>
    </div>
    <div class="col-md-4">

    </div>
    <div class="col-md-4">

    </div>
</div>