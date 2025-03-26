package comment;

public class CommentDTO {
	
	private int boardID;
	private int commentID;
	private int num;
	private String login_id;
	private String commentdate;
	private String commenttxt;

	public CommentDTO() {
		super();
	}

	
	public int getBoardID() { return boardID; }
	public void setBoardID(int boardID) { this.boardID = boardID; }

	public int getCommentID() { return commentID; }
	public void setCommentID(int commentID) { this.commentID = commentID; }

	public int getNum() { return num; }
	public void setNum(int num) { this.num = num; }

	public String getLogin_id() { return login_id; }
	public void setLogin_id(String login_id) { this.login_id = login_id; }

	public String getCommentdate() { return commentdate; }
	public void setCommentdate(String commentdate) { this.commentdate = commentdate; }

	public String getCommenttxt() { return commenttxt; }
	public void setCommenttxt(String commenttxt) { this.commenttxt = commenttxt; }

}
