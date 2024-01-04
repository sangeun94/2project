<%@ page import="db.dao.Patient.PatientDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page import="db.dao.Patient.LoginDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
    request.setCharacterEncoding("UTF-8");
	
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
   
    System.out.println("Login_proc 파라미터 : " + id + " " + password  );
    
    LoginDAO loginDAO = new LoginDAO();
    PatientDTO patientInfo = loginDAO.findLoginById(id);
    session.setAttribute("loginId", id);  //abc
    
    if (patientInfo == null) {
%>
  <script>
        alert('해당 사용자 정보가 없습니다.');
        location.href = "../Patient/Login1.jsp";
    </script>
  
<%
    } else {
        if (id.equals(patientInfo.getId()) && password.equals(patientInfo.getPassword())) {
%>
            <script>
                alert('로그인 성공');
                location.href = "../homeMain/HompageMain.jsp"; // 로그인 성공 시 이동할 페이지
            </script>
<%
//로그인 성공 시 사용자 아이디와 이름을 세션에 저장



        } else {
%>
            <script>
                alert('로그인 실패');
                history.back(); // 뒤로가기
            </script>
<%
        }
        
        session.setAttribute("loginName", patientInfo.getName());
        //String enteredUserId = "user123";
        
    }
    
%>
		
	
</body>
</html>