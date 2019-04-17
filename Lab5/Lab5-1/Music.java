public class Music{
	private String song;//노래
	private String singer;//가수
	int day;//발매일
    
	public Music(String song, String singer,int day){//생성자
        this.song = song;
        this.singer = singer;
        this.day = day;
    }
	
	public void result() {

			System.out.println("노래이름 : "+song+"  가수 : "+singer+"  발매일 : "+day);
		
	}

}