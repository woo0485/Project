<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = (String) session.getAttribute("id");
%>
    <form action="gallery" method="post" id="galleryidform2">
        <input type="hidden" name="id" value="<%= id %>">
    </form>
    <script>
    $("#galleryidform2").submit();
    </script>