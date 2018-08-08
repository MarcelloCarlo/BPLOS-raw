<%--
  Created by IntelliJ IDEA.
  User: John Carlo Villar
  Date: 08/08/2018
  Time: 02:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Guru Uploading File</title>
</head>
<body>
File: <br />
<form action="uploadX" method="POST"
      enctype="multipart/form-data">
    <input type="file" name="guru_file" size="50" />
    <br />
    <input type="submit" value="Upload" />
</form>
</body>
</html>
