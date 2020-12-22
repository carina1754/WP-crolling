package action;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import user.User;

public class Log {
	public void logupdate(User user) {
		try {
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy년MM월dd일 HH시mm분ss초");
			Date time = new Date();
			String timestr = format.format(time);
			String line = "";
			String path = Register.class.getResource("").getPath();
			BufferedWriter writer = new BufferedWriter(new FileWriter(path +"log.txt"));
	        writer.write(String.format("%s %s", user.getid(),timestr));
	        writer.newLine();
	        return;
		}
		catch (IOException e) {
	        e.printStackTrace();
	        return;
	    }
	}
}
