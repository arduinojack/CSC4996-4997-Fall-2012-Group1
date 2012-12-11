<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE html>
<html lang="en-US">

<head>
	<link rel="stylesheet" href="main.css" type="text/css" />
	<title>Easy EMR</title>
</head>

<body>
<f:view>
<h:form>

	
	<div id= "navigation">
	<div style="float:right">
		<p><h:commandLink action="#{loginBean.logout}">Log out</h:commandLink></p>
		<p><h:commandLink action="#{userService.switchToUpdateInfo}">Change My Password</h:commandLink></p>
	</div>
	
	<div style="float:left">
		<img src="img\logo_xl.png" height="60" width="180">
	</div>
	</div>
	
	<br>
	<div id="container">
	
	<center>
	<div width = "400" height = "60" style="border:2px groove">
	<p><b>Search:</b>&nbsp;&nbsp;First Name <h:inputText id="firstname" value="#{encounterService.searchPatientFirstName }" />&nbsp;&nbsp;<h:commandButton id="searchFirst" value="Search" action="#{encounterService.searchPatientsF }"></h:commandButton>&nbsp;&nbsp;Last Name<h:inputText id="lastname" value="#{encounterService.searchPatientLastName }" />&nbsp;&nbsp;<h:commandButton id="searchLast" value="Search" action="#{encounterService.searchPatients }"></h:commandButton>&nbsp;&nbsp;Patient ID<h:inputText id="patientID" value="#{encounterService.searchPatientId }" />&nbsp;&nbsp;<h:commandButton id="search" value="Search" action="#{encounterService.searchPatient }"></h:commandButton></p>
	</div>
	<BR>
	<h:commandButton id="submit" style="width:150px;height:50px" value="Submit" action="#{encounterService.saveOrUpdateEncounter }" rendered="#{ not encounterService.newEncounter }"></h:commandButton>
	<h:commandButton id="startNew" style="width:150px;height:50px" value="Start New Encounter" action="#{encounterService.startEncounter}" rendered="#{encounterService.newEncounter }"></h:commandButton>
	</center>
		
	<div id = "module" style="float:left">
		<h1>General Information</h1>
		<table>
		
		<tr>
		<td><font color="red"><h1>Visit ID </h1></td>
		<td><h:inputText value = "#{encounterService.encounter.encounterID }"></h:inputText></font></td>
		</tr>
		
		<tr>
		<td><h3>First Name</h3></td>
		<td><h:inputText value = "#{encounterService.patient.firstName }"></h:inputText></td>
		</tr>
		
		<tr>
		<td><h3>Last Name</h3></td>
		<td><h:inputText value = "#{encounterService.patient.lastName }"></h:inputText></td>
		</tr>
		
		<tr>
		<td><h3>Location</h3></td>
		<td><h:inputText value = "#{encounterService.patient.residence }"></h:inputText></td>
		</tr>
		
		<tr>
		<td><h3>Birth Date</h3></td>
		<td><h:inputText value = "#{encounterService.patient.birthDate }"></h:inputText></td>
		</tr>
		
		<tr>
		<td><h3>Gender</h3></td>
		<td><h:selectOneMenu id ="gender" value="#{encounterService.patient.gender }">
		   	<f:selectItem itemValue="NULL" itemLabel="- Select -" />
		   	<f:selectItem itemValue="Male" itemLabel="Male" />
		   	<f:selectItem itemValue="Female" itemLabel="Female" />
		</h:selectOneMenu></td>
		</tr>
		
		<tr>
		<td><h3>Height</h3></td>
		<td><h:inputText id="hin" value="#{encounterService.vitals.height }"></h:inputText> in</td>
		</tr>
		
		<tr>
		<td><h3>Weight</h3></td>
		<td><h:inputText id="wlbs" value="#{encounterService.vitals.weight }"></h:inputText> lbs</td>
		</tr>
			
		</table>
	</div>
			
	<div id = "module" style = "float:left">
	<table>
		<h1>Vitals</h1>
		
		<tr>
		<td><h3>Blood Pressure (mmHg)</h3></td>
		<td><h:inputText style = "width:60px" id="bpTop"  value="#{encounterService.vitals.systolicBP }" /> / <h:inputText style = "width:60px" id="bpBottom"  value="#{encounterService.vitals.diastolicBP }" /> <BR></td>
		</tr>
		
		<tr>
		<td><h3>Heart Rate (bpm)</h3></td>
		<td><h:inputText id="heartrate"  value="#{encounterService.vitals.heartRate }" /><br></td>
		</tr>
		
		<tr> 
		<td><h3>Temperature (F)</h3></td>
		<td><h:inputText id="temperature"  value="#{encounterService.vitals.temperatureF }" /><br></td>
		</tr>
		
		<tr>
		<td><h3>Respirations (Breaths per Minute)</h3></td>
		<td><h:inputText id="respirations"  value="#{encounterService.vitals.respRate }" /><br></td>
		</tr>
		
		<tr>
		<td><h3>Oxygen (%)</h3></td>
		<td><h:inputText id="oxygen"  value="#{encounterService.vitals.oximetry }" /><br></td>
		</tr>
		
		<tr>
		<td><h3>Blood Sample #</h3></td>
		<td><h:inputText style="width:100px" value = "#{encounterService.vitals.bloodSampleID }"></h:inputText></td>
		</tr>
		
		<tr>
		<td><h3>Malaria</h3></td>
		<td><h:selectOneMenu id ="malaria" value="#{encounterService.vitals.malaria }">
			<f:selectItem itemValue="No" itemLabel="No" />
			<f:selectItem itemValue="Yes" itemLabel="Yes" />
		</h:selectOneMenu></td>
		</tr>

		<tr>
		<td><h3>Dengue</h3></td>
		<td><h:selectOneMenu id ="dengue" value="#{encounterService.vitals.dengue }">
			<f:selectItem itemValue="No" itemLabel="No" />
			<f:selectItem itemValue="Yes" itemLabel="Yes" />
		</h:selectOneMenu></td>
		</tr>
		
	</table>
	</div>
			
	<div id = "module" style = "float:left">
		<h1>HPI</h1>
		
		<center>
		<h3>Chief Complaint</h3>
		<h:inputTextarea style="width:100%" id="primaryComplaint" value="#{encounterService.encounter.chiefComplaint }" />
		</center><BR>
		<table>
		<tr>
		<td><h3>Onset</h3></td>
		<td><h:inputText style = "width:50px" value="#{encounterService.encounter.onsetNumber }"></h:inputText>
		<h:selectOneMenu value="#{encounterService.encounter.onsetUnit }">
			<f:selectItem itemValue="days" itemLabel="days"/>
			<f:selectItem itemValue="weeks" itemLabel="weeks"/>
			<f:selectItem itemValue="months" itemLabel="months"/>
			</h:selectOneMenu> ago</td>
		</tr>
		
		<tr>
		<td><h3>Severity</h3></td>
		<td><h:selectOneMenu>
			<f:selectItem itemValue="0" itemLabel=" - "/>
			<f:selectItem itemValue="1" itemLabel="1"/>
			<f:selectItem itemValue="2" itemLabel="2"/>
			<f:selectItem itemValue="3" itemLabel="3"/>
			<f:selectItem itemValue="4" itemLabel="4"/>
			<f:selectItem itemValue="5" itemLabel="5"/>
			<f:selectItem itemValue="6" itemLabel="6"/>
			<f:selectItem itemValue="7" itemLabel="7"/>
			<f:selectItem itemValue="8" itemLabel="8"/>
			<f:selectItem itemValue="9" itemLabel="9"/>
			<f:selectItem itemValue="10" itemLabel="10"/>
		</h:selectOneMenu></td>
		</tr>
		
		<tr>
		<td><h3>Radiation</h3></td>
		<td><h:inputText value="#{encounterService.encounter.radiation }"/></td>
		</tr>
		
		<tr>
		<td><h3>Quality</h3></td>
		<td><h:inputText value="#{encounterService.encounter.quality }"/></td>
		</tr>
		
		<tr>
		<td><h3>Provokes / Palliates</h3></td>
		<td><h:inputText value="#{encounterService.encounter.provokes }"/></td>
		</tr>
		
		<tr>
		<td><h3>Time of Day</h3></td>
		<td><h:inputText value="#{encounterService.encounter.timeOfDay }"/></td>
		</tr>
		
		<tr>
		<td><h3>Other</h3></td>
		<td><h:inputText value="#{encounterService.encounter.other }"/></td>
		</tr>
		</table>
		<BR>
		<center>
		<h3>Physical Examination</h3>
		<h:inputTextarea style="width:100%" id="physicalExamination" value="#{encounterService.encounter.overallImpression }" />
		</center>
		
	</div>
	
	<div id = "module" style = "float: left">
		<h1>Complaints / Treatment</h1>
		<center>	
	
		<h3>Assessment</h3>
		<h:inputTextarea style="width:100%" id="assessment" value="#{encounterService.encounter.assessment }" />
		
		<table>
		<tr>
		<td><h3>Problem List</h3></td>
		<td><h3>Prescription / Treatment</h3></td>
		</tr>
		
		<tr>
		<td><h:inputText value="#{encounterService.encounter.condition1 }"></h:inputText></td>
		<td><h:inputText value="#{encounterService.encounter.medicationPrescribed1 }"></h:inputText></td>
		</tr>
		
		<tr>
		<td><h:inputText value="#{encounterService.encounter.condition2 }"></h:inputText></td>
		<td><h:inputText value="#{encounterService.encounter.medicationPrescribed2 }"></h:inputText></td>
		</tr>
		
		<tr>
		<td><h:inputText value="#{encounterService.encounter.condition3 }"></h:inputText></td>
		<td><h:inputText value="#{encounterService.encounter.medicationPrescribed3 }"></h:inputText></td>
		</tr>
		
		<tr>
		<td><h:inputText value="#{encounterService.encounter.condition4 }"></h:inputText></td>
		<td><h:inputText value="#{encounterService.encounter.medicationPrescribed4 }"></h:inputText></td>
		</tr>
		
		<tr>
		<td><h:inputText value="#{encounterService.encounter.condition5 }"></h:inputText></td>
		<td><h:inputText value="#{encounterService.encounter.medicationPrescribed5 }"></h:inputText></td>
		</tr>
		
		</table>
		
		<h3>Treatment Given</h3>
		<h:inputTextarea style="width:100%" id="treatmentGiven" value="#{encounterService.encounter.medicalProcedures }" />
		
		<h3>Family/Social History</h3>
		<h:inputTextarea style="width:100%" id="socialHistory" value="#{encounterService.patient.socialHistory }" />
		
		</center>
	
	</div>
	</div>
	<center>
	
		<p><a href="HelpInformation.pdf">Need Help?</a></p>
	
	</center>
	</h:form>
</f:view>
</body>