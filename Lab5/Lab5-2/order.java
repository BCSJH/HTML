import java.util.Scanner;

public class order {
	int money;
	int result_m;
	public void showMenu(product[] p){
	System.out.println("상품을 선택하세요.");
	
	for(int i=0; i<p.length ; i++)
		System.out.println((i+1) + "." + p[i].name + ":" + p[i].price +"원");

	Scanner u = new Scanner(System.in);
	
	result_m=u.nextInt();
	System.out.println(p[result_m-1].name+" 상품을 선택했습니다.");
	result(p[result_m-1].getprice());
	
	}
	
	public order(int money){
		this.money=money;	
	}
	

	public void result(int menu){
		money-=menu;
		if(money<0)
		{
			System.out.println("당신의 현재 돈으로 구매하기어렵습니다.");
			System.out.println(-money+"원 더 필요합니다.");
		}
		else
		{
			System.out.println("남은 돈은 : "+money + "입니다.");
		}
	}

}

