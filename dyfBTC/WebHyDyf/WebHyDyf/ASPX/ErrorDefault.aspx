<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorDefault.aspx.cs" Inherits="WebHyDyf.ASPX.ErrorDefault" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    string errorMessage = Request.Form["errorMessage"];
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>出错啦</title>
    <style type="text/css">
        A
        {
            color: #FF0000;
            text-decoration: none;
        }
        A:Visited
        {
            color: #FF0000;
            text-decoration: none;
        }
        A:Active
        {
            color: #004567;
            text-decoration: none;
        }
        A:Hover
        {
            color: #0000FF;
            text-decoration: none;
        }
        p
        {
            align: center;
            background-color: #C0C0C0;
            font-size: 9pt;
            line-height: 20pt;
            border: 1px solid black;
            margin: 10px 10px 10px 10px;
            padding: 6px 12px 6px 12px; /* 上、右、下、左*/
        }
    </style>
</head>
<body bgcolor="#ffffff">
    <br>
    <br>
    <p>
        错误信息：<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="4" color="#FF0000"><%=errorMessage %></font><br>
        <br>
        <br>
        <br>
    </p>
</body>
</html>

