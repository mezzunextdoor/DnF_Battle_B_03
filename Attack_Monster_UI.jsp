<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="B.전투" %>
<%@ page import="B.캐릭터" %>
<%
    // 테스트 데이터
    String id = "hero";

    전투 battle = new 전투();

    // 캐릭터가 아직 없으면 마법사로 생성 (단독 실행 가능하도록)
    if (전투.생성된캐릭터 == null) {
        battle.캐릭터생성(id, "인하마법사", "마법사", 10);
    }

    String 공격결과 = battle.몬스터공격(id);

    out.println("[몬스터 공격 결과]<br>");
    out.println("입력ID: " + id + "<br>");
    if (전투.생성된캐릭터 != null) {
        캐릭터 c = 전투.생성된캐릭터;
        out.println("공격자: " + c.캐릭터명 + " (HP: " + c.hp + " / 공격력: " + c.공격력 + ")<br>");
    }
    out.println("결과: " + 공격결과);
%>