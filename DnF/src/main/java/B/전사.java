package B;

public class 전사 extends 캐릭터 {

    public 전사(String 캐릭터명, int 레벨) {
        super(캐릭터명, 레벨);
        this.hp = 레벨 * 100;
        this.공격력 = 레벨 * 15;
    }

    @Override
    public double 스킬발동() {
        return 스킬발동_검휘두르기();
    }

    public double 스킬발동_검휘두르기() {
        System.out.println("검 휘두르기!");
        return this.공격력 * 1.5;
    }
}