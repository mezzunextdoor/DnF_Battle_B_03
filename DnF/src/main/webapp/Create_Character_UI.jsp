<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="B.전투" %>
<%@ page import="B.캐릭터" %>
<!DOCTYPE html>
<html>
<head>
    <title>캐릭터 생성 UI</title>
</head>
<body>

    <h2>캐릭터 생성</h2>
    
    <form action="Create_Character_UI.jsp" method="post">
        플레이어 ID: <input type="text" name="id" required><br><br>
        캐릭터명: <input type="text" name="이름" required><br><br>
        
        직업 선택: 
        <select name="직업">
            <option value="전사">전사</option>
            <option value="마법사">마법사</option>
        </select><br><br>
        
        레벨: <input type="number" name="레벨" min="1" value="1" required><br><br>
        
        <button type="submit">캐릭터 생성</button>
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            request.setCharacterEncoding("UTF-8");

            String id = request.getParameter("id");
            String 이름 = request.getParameter("이름");
            String 직업 = request.getParameter("직업");
            int 레벨 = Integer.parseInt(request.getParameter("레벨"));

            전투 battle = new 전투();
            String 결과 = battle.캐릭터생성(id, 이름, 직업, 레벨);

            // 다음 페이지(공격 UI)에서 사용할 수 있도록 세션에 ID 저장
            session.setAttribute("playerId", id);

            if (전투.생성된캐릭터 != null) { 
                // 캐릭터 생성 성공 시 알림을 띄우고 Attack_Monster_UI.jsp로 이동
    %>
                <script type="text/javascript">
                    alert("캐릭터 생성 완료! 몬스터 공격 화면으로 이동합니다.");
                    location.href = "Attack_Monster_UI.jsp";
                </script>
    <%
            } else {
                // ID가 "hero"가 아니어서 실패한 경우
    %>
                <br><br>
                <span style="color:red;">[생성 실패] <%= 결과 %></span>
    <%
            }
        }
    %>

</body>
</html>