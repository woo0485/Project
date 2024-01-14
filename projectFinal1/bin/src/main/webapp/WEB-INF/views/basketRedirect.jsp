<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <form action="basket" method="post" id="basketRedirectForm">
        <input type="hidden" name="id" value="${sessionScope.id}">      
    </form>
    <script>
    $("#basketRedirectForm").submit();
    </script>