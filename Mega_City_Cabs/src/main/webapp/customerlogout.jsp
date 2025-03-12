<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // ✅ Destroy session to log out the driver
    if (session != null) {
        session.invalidate(); 
    }

    // ✅ Redirect to the login page
    response.sendRedirect("customer_home.jsp"); 
%>