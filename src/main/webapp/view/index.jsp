<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	text-align: center;
}

table {
	width: 600px;
	margin: auto;
}

table, th, td {
	border: 1px solid darkgray;
	text-align: center;
	border-collapse: collapse;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#btn1").click(function() {
		$("#table").empty();
		$.ajax({
			url : "/MyController",
			method : "post",
			dataType : "text",
			success : function(data) {
				var table = "<thead>";
				table += "<tr><th>번호</th><th>이름</th><th>제목</th><th>Email</th><th>날짜</th></tr>";
				table += "<tbody>";
				var people = data.split("/");
				for(var k in people){
					table += "<tr>";
					var item = people[k].split(",");
					for (var i = 0; i < item.length; i++) {
						if(i==4 || i==5) continue;
						table += "<td>" + item[i] + "</td>";
					} 
					table += "</tr>";
				}
				table += "</tbody>";
				$("#table").append(table);
			},
			error : function() {
				alert("읽기실패");
			}
		});
	});
 	$("#btn2").click(function() {
		$("#table").empty();
		$.ajax({
			url : "/MyController2",
			method : "post",
			dataType : "xml",
			success : function(data) {
				var table = "<thead>";
				table += "<tr><th>번호</th><th>이름</th><th>제목</th><th>Email</th><th>날짜</th></tr>";
				table += "<tbody>";
				$(data).find("member").each(function() {
					table += "<tr>";
					table +="<td>"+ $(this).attr("idx")+"</td>";
					table +="<td>"+ $(this).text()+"</td>";
					table +="<td>"+ $(this).attr("title")+"</td>";
					table +="<td>"+ $(this).attr("email")+"</td>";
					table +="<td>"+ $(this).attr("reg")+"</td>";
					table += "</tr>";
				});
				table += "</tbody>";
				$("#table").append(table);
			},
			error : function() {
				alert("읽기실패");
			}
		});
	});
 	
 	$("#btn3").click(function() {
		$("#table").empty();
		$.ajax({
			url : "/MyController3",
			method : "post",
			dataType : "json",
			success : function(data) {
				var table = "<thead>";
				table += "<tr><th>번호</th><th>이름</th><th>제목</th><th>Email</th><th>날짜</th></tr>";
				table += "<tbody>";
				$.each(data, function() {
					table += "<tr>";
					table +="<td>"+ this["idx"]+"</td>";
					table +="<td>"+ this["name"]+"</td>";
					table +="<td>"+ this["title"]+"</td>";
					table +="<td>"+ this["email"]+"</td>";
					table +="<td>"+ this["reg"]+"</td>";
					table += "</tr>";
				});
				table += "</tbody>";
				$("#table").append(table);
			},
			error : function() {
				alert("읽기실패");
			}
		});
	});
 	
});
</script>
<script type="text/javascript"></script>
</head>
<body>
	<div>
		<button id="btn1">Text 정보가져오기</button>
		<button id="btn2">XML 태그/속성 정보가져오기</button>
		<button id="btn3">JSON 정보가져오기</button>
	</div>
	<hr>
	<div>
		<table id="table"></table>
	</div>
</body>
</html>