import java.util.Scanner;

public class product {
	int price;
	String name;
	
	Scanner in = new Scanner(System.in);
	
	public product(String name, int price) {
		this.name=name;
		this.price=price;
	}

	public int getprice(){
		return this.price;
	}
	
	public String getname(){
		return this.name;
	}

}

	
	

