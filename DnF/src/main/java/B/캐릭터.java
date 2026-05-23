package B;

public abstract class 캐릭터 {
    public String 캐릭터명;
    public int 레벨;
    public double hp;
    public double 공격력;

    public 캐릭터(String 캐릭터명, int 레벨) {
        this.캐릭터명 = 캐릭터명;
        this.레벨 = 레벨;
    }

    public abstract double 스킬발동();
}