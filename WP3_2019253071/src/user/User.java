package user;
public class User {
	private String id;
	private String email;
	private String pw1;
	private String pw2;
	private String pw;
	private String call;
	private String name;
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	public String getpw() {
		return pw;
	}
	public void setpw(String pw) {
		this.pw = pw;
	}
	public String getpw1() {
		return pw1;
	}
	public void setpw1(String pw) {
		this.pw1 = pw;
	}
	public String getpw2() {
		return pw2;
	}
	public void setpw2(String pw) {
		this.pw2 = pw;
	}
	public String getcall() {
		return call;
	}
	public void setcall(String call) {
		this.call = call;
	}
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
}
