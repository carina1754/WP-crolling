package action;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import user.User;

public class Register {
	public int upload(User user) throws FileNotFoundException {
		int result = 0;//결과 출력 변수
		try {
			String line = "";//줄 읽기 변수
			BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\buleb\\git\\WP-crolling\\WP3_2019253071\\src\\action\\user.txt"));//파일입출력 읽기
		    while ((line = reader.readLine()) != null) { //파일 끝까지 읽기
		        String[] temp = line.split(" "); //공백기준으로 문자열 나누기
		        if(temp[0].equals(user.getid())) {//아이디가 파일에 있을 시
		        	result = 1;
		        	break;
		        }
		        if(!user.getpw1().equals(user.getpw2())){//pw1과 pw2가 다를시
		        	result = 2;
		        	break;
		        }
		        else
		        	result = 0;//나머지는 성공
		    }
		    reader.close();
		    if(result == 0) {//회원가입 성공 시
		    	System.out.println("sucess");
	        BufferedWriter bw = new BufferedWriter(new FileWriter("C:\\Users\\buleb\\git\\WP-crolling\\WP3_2019253071\\src\\action\\user.txt",true));//파일입출력 쓰기
	        PrintWriter pr = new PrintWriter(bw,true);//파일 프린터 이어쓰기
	        pr.write(String.format("%s %s %s %s %s %s %s\n", user.getid(),user.getpw1(),user.getname(),user.getcall(),user.getemail(),user.getage(),user.getloc()));//순서대로 아이디 패스워드 이름 전화번호 이메일 나이 지역 순으로 파일에 쓰기
	        pr.flush();
	        pr.close();
	        return 1;//성공 출력
		    }
		    else if(result == 1) {//중복검사
		    	return 2;
		    }
		    else if(result == 2) {//비밀번호 확인 오류
		    	return 3;
		    }
		    else
		    	return 0;//실패 출력
		}
		catch (IOException e) {
	        e.printStackTrace();
	        return 0;
	    }
	}
}
