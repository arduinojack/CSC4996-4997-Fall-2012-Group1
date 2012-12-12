<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="main.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Data Export</title>
</head>
<body>
<!-- Created by Lev, uploaded by Marek -->
	<f:view>
		<div id="navigation">
			<div style="float: right">
				<table>
				<tbody>
					<tr>
						<td><h3 style="color:red">Hello: <i><h:outputLabel value="#{loginBean.systemUser.username }"/></i></h3></td>
					<td>
						<p><h:commandLink tabindex="-1" action="#{loginBean.logout}">Log out</h:commandLink></p>
						<p><h:commandLink tabindex="-2" action="#{userService.switchToUpdateInfo}">Change My Password</h:commandLink></p>
					</td>
					</tr>
				</tbody>
				</table>
			</div>

			<div style="float: left">
				<img src="img\logo_xl.png" height="60" width="180">
			</div>

		</div>

		<div id="content">

			<div id="form">
				<h:form>
					<h2>Data Export</h2>
					<p>Export non-identifying information to CSV file</p>
					<h:commandButton action="#{researchReportsBean.generateConditionReport}" value="Export to CSV" style="width:200px;height:70px;margin-top:30px"></h:commandButton>
				</h:form>
			</div>
			<center>
				<a href="HelpInformation.pdf">Need Help?</a>
			</center>

		</div>
	</f:view>
</body>
</html>
