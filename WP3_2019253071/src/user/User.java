package user;
public class User {
	private String id="1";//ID 변수
	private String email="1";//이메일 변수
	private String pw1="1";//회원가입 패스워드 첫번째 입력 변수
	private String pw2="1";//회원가입 패스워드 두번째 입력 변수
	private String pw="1";//로그인 패스워드 입력 변수
	private String call="1";//전화번호 변수
	private String name="1";//이름 변수
	private String age="1";//나이 변수
	private String loc="1";//지역 변수
	public String getid() {//ID GETTER
		return id;
	}
	public void setid(String id) {//ID SETTER
		this.id = id;
	}
	public String getemail() {//EMAIL GETTER
		return email;
	}
	public void setemail(String email) {//EMAIL SETTER
		this.email = email;
	}
	public String getpw() {//PW GETTER
		return pw;
	}
	public void setpw(String pw) {//PW SETTER
		this.pw = pw;
	}
	public String getpw1() {//PW1 GETTER
		return pw1;
	}
	public void setpw1(String pw1) {//PW1 SETTER
		this.pw1 = pw1;
	}
	public String getpw2() {//PW2 GETTER
		return pw2;
	}
	public void setpw2(String pw1) {//PW2 SETTER
		this.pw2 = pw1;
	}
	public String getcall() {//전화번호 GETTER
		return call;
	}
	public void setcall(String call) {//전화번호 SETTER
		this.call = call;
	}
	public String getname() {//이름 GETTER
		return name;
	}
	public void setname(String name) {//이름 SETTER
		this.name = name;
	}
	public String getage() {//나이 GETTER
		return age;
	}
	public void setage(String age) {//나이 SETTER
		this.age = age;
	}
	public String getloc() {//지역 GETTER
		return loc;
	}
	public void setloc(String loc) {//지역 SETTER
		this.loc = loc;
	}
}
