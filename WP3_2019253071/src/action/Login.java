package action;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import user.User;

public class Login {
	public int login(User user) {
		int result = 0;
		Log log = new Log();
		try {
			String line = "";
			String path = Register.class.getResource("").getPath();
			BufferedReader reader = new BufferedReader(new FileReader(path +"user.txt"));
		    while ((line = reader.readLine()) != null) { 
		        String[] temp = line.split(" ");
		        if(temp[0].equals(user.getid())) {
		        	if(temp[1].equals(user.getpw())) {
		        		log.logupdate(user);
		        	return 1;
		        	}
		        	else
			        	return 0;
		        }
		        else
		        	result=0;
		    }
		    reader.close();
		}
		catch (IOException e) {
	        e.printStackTrace();
	        return 0;
	    }
		return result;
	}
}
