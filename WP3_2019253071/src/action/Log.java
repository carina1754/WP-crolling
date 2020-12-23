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
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy년MM월dd일HH시mm분ss초");
			Date time = new Date();
			String timestr = format.format(time);
			String line = "";
			BufferedWriter bw = new BufferedWriter(new FileWriter("C:\\Users\\buleb\\git\\WP-crolling\\WP3_2019253071\\src\\action\\log.txt",true));
			PrintWriter pr = new PrintWriter(bw,true);
	        pr.write(String.format("%s %s\n", user.getid(),timestr));
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
