
import java.util.InputMismatchException;
import java.util.Scanner;

public class La5과제 {

		public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("================");
		System.out.println("201704007 김정현");
		System.out.println("================");
		System.out.println("Music player");
		
		Music[] Music = new Music[3];//배열에 저장하기 위함
		int userInt;//사용자로부터 어떤 메뉴를 선택할지 입력받게 하기 위함
		Scanner user = new Scanner(System.in);
		
		String song;
		int day;
		String singer;
		
		do{//사용자로부터 입력받은 메뉴가 1,2,0에 있지 않으면 다시 입력하게 하기 위함

			System.out.println("1.음악리스트   2.음악추가   0.끝내기");
			userInt=user.nextInt();//메뉴 입력
			
		switch(userInt)
		{
		case 1: {
				try {
					System.out.println("음악리스트");
					for(int i=0;i<3;i++)
						Music[i].result();//결과 출력
				}
				catch(Exception e){
					System.out.println("결과가 없습니다.");
				}
				break;
			}
		case 2: {
				for(int i=0;i<3;i++) {//입력
					System.out.println((i+1)+"노래제목 : ");
					song=user.next();
					System.out.println("가수 : ");
					singer=user.next();
					System.out.println("발매일 :");
					day=user.nextInt();
					Music[i]= new Music(song, singer, day);
					}
				break;
			}
		case 0: {//시스템 좀료
				System.out.println("시스템 종료");
				return ;
			}
			default ://이상한거 입력했을 때
				System.out.println("1,2,0에서 입력해주세요!");
				user.nextLine();

			}
		}while(userInt!=0);//종료를 입력할때까지 반복
		
	}

}
