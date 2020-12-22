package action;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import user.User;

public class Register {
	public int upload(User user) throws FileNotFoundException {
		int result = 0;
		try {
			String line = "";
			String path = Register.class.getResource("").getPath();
			BufferedReader reader = new BufferedReader(new FileReader(path +"user.txt"));
		    while ((line = reader.readLine()) != null) { 
		        String[] temp = line.split(" "); // , : ±¸ºÐÀÚ
		        if(temp[0].equals(user.getid())) {
		        	result = 1;
		        	break;
		        }
		        if(!user.getpw1().equals(user.getpw2())){
		        	result = 2;
		        	break;
		        }
		        else
		        	result = 0;
		    }
		    if(result == 0) {
		    	System.out.println("sucess");
	        BufferedWriter writer = new BufferedWriter(new FileWriter(path +"user.txt"));
	        writer.write(String.format("%s %s %s %s %s", user.getid(),user.getpw1(),user.getname(),user.getcall(),user.getemail()));
	        writer.newLine();
	        writer.close();
	        return 1;
		    }
		    else if(result == 1) {
		    	return 2;
		    }
		    else if(result == 2) {
		    	return 3;
		    }
		    else
		    	return 0;
		}
		catch (IOException e) {
	        e.printStackTrace();
	        return 0;
	    }
	}
}
