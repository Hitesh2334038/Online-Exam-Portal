<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<title>Add Question</title>
</head>
<body>
	<div class="container " align="center">
		<div class="bs-example">
			<h2 class="heading">Add Candidate</h2>
			<c:url var="addAction" value="/addCandidate/${Exam_Id}/saveCandidate"></c:url>
			
			<form:form action="${addAction}" method="post"
				modelAttribute="user">
					<div class="form-group row">
						<form:label path="user_Id" name="user_Id" class="col-sm-2 col-form-label">User Id
							</</form:label>
						<div class="col-sm-10">
							<form:input class="form-control" name="user_Id" path="user_Id"
								 placeholder="Enter User Id of Candidate " required="true"></form:input>
						</div>
					</div>
				
					<div class="form-group row">
						<div class="col-sm-10 offset-sm-2">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>
			</form:form>

			<%-- <div class="container bs-example" align="center">

				<c:if test="${!empty listOfExam}">
					<h2 class="heading">Question List</h2>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">Exam Id</th>
								<th scope="col">Exam Name</th>
								<th scope="col">User Id</th>
								
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="exam" items="${listOfExams}">
								<tr>
									<td>${exam.exam_Id}</td>
									<td>${exam.exam_Name}</td>
									<td>${exam.user1.user_Id}</td>
									<td>${question.answer}</td>
									<td><a
										href="<c:url value='/candidate/${Exam_Id}/editCandidate/${exam.exam_Id}' />"><button>Edit</button></a>
										<a href="<c:url value='/candidate/${Exam_Id}/deleteCandidate/${exam.exam_Id}' />"><button>Delete</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div> --%>
			<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
				integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
				crossorigin="anonymous"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
				crossorigin="anonymous"></script>
		</div>
	</div>

</body>
</html>