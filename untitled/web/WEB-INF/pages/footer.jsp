<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="now" class="java.util.Date"/>
<footer class="footer">
    <div class="container">
        <p class="text-muted">Copyright © ${now.getYear()+1900} by MushuCorp. All Rights Reserved.</p>
    </div>
</footer>
</body>
</html>