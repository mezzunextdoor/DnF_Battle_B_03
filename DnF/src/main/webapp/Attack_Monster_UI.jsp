<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="B.전투" %>
<%@ page import="B.캐릭터" %>
<!DOCTYPE html>
<html>
<head>
    <title>몬스터 공격 UI</title>
</head>
<body>

    <h2>몬스터 공격</h2>

    <%
        // 세션에서 앞서 입력한 플레이어 ID 가져오기 (없으면 기본값 "hero")
        String id = (String) session.getAttribute("playerId");
        if (id == null) {
            id = "hero"; 
        }

        전투 battle = new 전투();

        // 만약 캐릭터 생성 페이지를 거치지 않고 이 페이지를 단독 실행했을 때를 위한 안전장치
        if (전투.생성된캐릭터 == null) {
            battle.캐릭터생성(id, "인하마법사", "마법사", 10);
        }
        
        캐릭터 c = 전투.생성된캐릭터;
    %>

    <p>
        <strong>현재 플레이어 ID:</strong> <%= id %><br>
        <strong>공격 대기 캐릭터:</strong> 
        <%= (c != null) ? c.캐릭터명 + " (HP: " + c.hp + " / 공격력: " + c.공격력 + ")" : "없음" %>
    </p>

    <form action="Attack_Monster_UI.jsp" method="post">
        <button type="submit">몬스터 공격하기!</button>
    </form>

    <br><hr><br>

    <%
        // 사용자가 [몬스터 공격하기!] 버튼을 눌렀을 때(POST)만 공격 결과 출력
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String 공격결과 = battle.몬스터공격(id);
    %>
            <h3>[몬스터 공격 결과]</h3>
            입력ID: <%= id %><br>
            결과: <%= 공격결과 %><br>
    <%
        }
    %>

</body>
</html>