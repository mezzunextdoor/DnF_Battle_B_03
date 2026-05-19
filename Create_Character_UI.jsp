<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="B.전투" %>
<%@ page import="B.캐릭터" %>
<%
    // 테스트 데이터
    String id = "hero";
    String 이름 = "인하전사";
    String 직업 = "전사";
    int 레벨 = 10;

    전투 battle = new 전투();
    String 결과 = battle.캐릭터생성(id, 이름, 직업, 레벨);

    out.println("[캐릭터 생성 결과]<br>");
    out.println("입력ID: " + id + "<br>");
    out.println("결과: " + 결과 + "<br>");
    if (전투.생성된캐릭터 != null) {
        캐릭터 c = 전투.생성된캐릭터;
        out.println("캐릭터명: " + c.캐릭터명 + " / 직업: " + 직업 + "<br>");
        out.println("HP: " + c.hp + " / 공격력: " + c.공격력);
    }
%>