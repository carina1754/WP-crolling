package action;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import user.User;

public class Log {
	public void logupdate(User user) {
		try {
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy년MM월dd일HH시mm분ss초");//날짜 INPUT 변수
			Date time = new Date();//날짜 변수
			String timestr = format.format(time);//FORMAT형식으로 날짜를 정리하주는 변수
			BufferedWriter bw = new BufferedWriter(new FileWriter("C:\\Users\\buleb\\git\\WP-crolling\\WP3_2019253071\\src\\action\\log.txt",true));//파일 입출력 쓰기
			PrintWriter pr = new PrintWriter(bw,true);//파일 프린터 이어쓰기
	        pr.write(String.format("%s %s\n", user.getid(),timestr));//아이디와 시간 입력
	        pr.flush();
	        pr.close();
	        return;
		}
		catch (IOException e) {
	        e.printStackTrace();
	        return;
	    }
	}
}
