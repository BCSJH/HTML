import java.util.Scanner;

public class Lab5과제2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("================");
		System.out.println("201704007 김정현");
		System.out.println("================");

		Scanner in = new Scanner(System.in);
		int user_number;
		String name;
		int price;
		
		System.out.println("몇개의 상품을 입력하시겠습니까?");
		user_number=in.nextInt();
		
		product[] Product = new product[user_number];
		
		for(int i=0; i<user_number;i++)
		{
			in.nextLine();
			System.out.println((i+1)+". 상품 명 : ");
			name=in.nextLine();
			
			
			System.out.println((i+1)+". 상품 가격 : ");
			price=in.nextInt();
			
			Product[i]= new product(name, price);
		}
		order order = new order(user_number);
		System.out.println("현재 갖고 있는 돈을 입력해주세요.");
		order.money=in.nextInt();
		
		order.showMenu(Product);
}
}
