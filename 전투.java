package B;

public class 전투 {
    // JSP에서 전투.생성된캐릭터 로 접근
    public static 캐릭터 생성된캐릭터 = null;

    private 플레이어 player = new 플레이어();

    // 캐릭터 생성 (반드시 플레이어체크)
    public String 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) {
        if (!player.플레이어체크(플레이어id)) {
            생성된캐릭터 = null;
            return "권한이 없습니다 (id 불일치)";
        }
        if ("전사".equals(직업)) {
            생성된캐릭터 = new 전사(캐릭터명, 레벨);
        } else if ("마법사".equals(직업)) {
            생성된캐릭터 = new 마법사(캐릭터명, 레벨);
        } else {
            생성된캐릭터 = null;
            return "알 수 없는 직업: " + 직업;
        }
        return "캐릭터 생성 성공";
    }

    // 몬스터 공격 (반드시 플레이어체크 → 스킬발동 → 등급판정)
    public String 몬스터공격(String 플레이어id) {
        if (!player.플레이어체크(플레이어id)) {
            return "권한이 없습니다 (id 불일치)";
        }
        if (생성된캐릭터 == null) {
            return "캐릭터가 없습니다.";
        }
        String 멘트 = (생성된캐릭터 instanceof 전사) ? "검 휘두르기!" : "파이어볼!";
        double 데미지 = 생성된캐릭터.스킬발동();
        String 등급 = 등급판정(데미지);
        return String.format("\"%s\" → 데미지 %.1f → %s", 멘트, 데미지, 등급);
    }

    public String 등급판정(double 데미지) {
        if (데미지 >= 200) return "S급 공격";
        else if (데미지 >= 100) return "A급 공격";
        else return "B급 공격";
    }
}