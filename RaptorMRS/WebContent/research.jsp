<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Research Reports</title>
</head>
<body>
<!-- Created by Lev, uploaded by Marek -->
<f:view>
	<div id= "navigation">
			<img src="img\logo_xl.png" height="60" width="180">
		</div>
		
		<div id= "content">
		
			<div id = "form">
				<h1> Please select a report to run. </h1>
				<p> You will be asked to save the file locally on your computer! </p>
	
			<h:form>
	
				<h:commandButton action="#{researchReportsBean.generateBloodSampleReport}" value="Generate Blood Sample Report"></h:commandButton>
				<h:commandButton action="#{researchReportsBean.generateConditionReport}" value="Generate Condition/Procedure Report"></h:commandButton>
				<h:commandButton action="#{researchReportsBean.generateRxReport}" value="Generate Rx Report"></h:commandButton>
			</h:form>
	
			</div>
			
			<div id = "footer">
				<p><a href="index.jsp">Log out</p>
			</div>
			
		</div>
</f:view>
</body>
</html>