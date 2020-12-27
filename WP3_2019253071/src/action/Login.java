package action;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import user.User;

public class Login {
	public int login(User user) {
		int result = 0;//결과 출력 변수
		Log log = new Log();//로그 객체 생성
		try {
			String line = "";//줄 읽기 변수
			BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\buleb\\git\\WP-crolling\\WP3_2019253071\\src\\action\\user.txt"));//파일 입출력 읽기
		    while ((line = reader.readLine()) != null) { //파일을 모두 읽을때까지
		        String[] temp = line.split(" ");//공백기준으로 문자열 나누기
		        if(temp[0].equals(user.getid())) {//아이디가 곂칠 시
		        	if(temp[1].equals(user.getpw())) {//비밀번호가 곂칠 시
		        		log.logupdate(user);//로그 전송
		        	return 1;//로그인 성공
		        	}
		        	else
			        	return 0;//로그인 실패
		        }
		        else
		        	result=0;//로그인 실패
		    }
		    reader.close();
		}
		catch (IOException e) {
	        e.printStackTrace();
	        return 0;
	    }
		return result;//로그인 실패 및 성공 RETURN
	}
}
