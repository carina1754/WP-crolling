package user;
public class User {
	private String id="1";//ID ����
	private String email="1";//�̸��� ����
	private String pw1="1";//ȸ������ �н����� ù��° �Է� ����
	private String pw2="1";//ȸ������ �н����� �ι�° �Է� ����
	private String pw="1";//�α��� �н����� �Է� ����
	private String call="1";//��ȭ��ȣ ����
	private String name="1";//�̸� ����
	private String age="1";//���� ����
	private String loc="1";//���� ����
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
	public String getcall() {//��ȭ��ȣ GETTER
		return call;
	}
	public void setcall(String call) {//��ȭ��ȣ SETTER
		this.call = call;
	}
	public String getname() {//�̸� GETTER
		return name;
	}
	public void setname(String name) {//�̸� SETTER
		this.name = name;
	}
	public String getage() {//���� GETTER
		return age;
	}
	public void setage(String age) {//���� SETTER
		this.age = age;
	}
	public String getloc() {//���� GETTER
		return loc;
	}
	public void setloc(String loc) {//���� SETTER
		this.loc = loc;
	}
}
