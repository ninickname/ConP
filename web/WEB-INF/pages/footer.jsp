<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="now" class="java.util.Date"/>
<footer class="footer">
    <div class="container">
        <p class="text-muted">Copyright © ${now.getYear()+1900} by MushuCorp. All Rights Reserved.</p>
    </div>
</footer>
<script>
    $.getJSON("/data/conf_main.json", function(json) {
        // Set company name
        document.getElementById("company_name").innerHTML = json.company_name;

        // Set body css style
        $('body').css(json.body_css);

    });
</script>
</body>
</html>