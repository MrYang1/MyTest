<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </head>
  
<body>
	<div class="container">
	<table  class="table table-striped table-bordered table-hover table-condensed ">
		<tr align="center" >
			<td>头像</td>
			<td>姓名</td>
			<td>用户名</td>
			<td>性别</td>
			<td>爱好</td>
			<td>生日</td>
			<td>电话</td>
			<td>邮箱</td>
			<td>家庭住址</td>
			<td>身份证号码</td>
			<td>个人简介</td>
		</tr>
		<c:forEach var="u" items="${list}">
			<tr align="center" >
			<td><img alt="没有头像" src="${u.photourl}" width="80px" height="80px"></td>
			<td>${u.name }</td>
			<td>${u.username }</td>
			<td>${u.sex }</td>
			<td>${u.hobby }</td>
			<td>
				<fmt:formatDate value="${u.birthday}" pattern="yyyy-MM-dd"/>
			</td>
			<td>${u.phonenumber }</td>
			<td>${u.email }</td>
			<td>${u.address }</td>
			<td>${u.carId }</td>
			<td>${u.myshow}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>
