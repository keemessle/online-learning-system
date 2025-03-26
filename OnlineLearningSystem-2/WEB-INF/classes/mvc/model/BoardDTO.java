package mvc.model;

public class BoardDTO {

	private int num;			// 번호
	private String login_id;	// 등록자 아이디
	private String name;		// 등록자 이름
	private String title;		// 제목
	private String content;		// 내용 
	private String postdate;	// 등록 일자
	private int hit;			// 조회수
	private String ip;			// IP 주소
	private String filename;  	// 파일명을 저장할 필드 추가
	
	public BoardDTO() {
		super();
	}
	
	public int getNum() { return num; }
	public void setNum(int num) { this.num = num; }
	
	public String getLogin_id() { return login_id; }
	public void setLogin_id(String login_id) { this.login_id = login_id; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }

	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }

	public String getPostdate() { return postdate; }
	public void setPostdate(String postdate) { this.postdate = postdate; }

	public int getHit() { return hit; }
	public void setHit(int hit) { this.hit = hit; }

	public String getIp() { return ip; }
	public void setIp(String ip) { this.ip = ip; }

	public String getFileName() { return filename; }
    public void setFileName(String fileName) { this.filename = filename; }
    
    
}
