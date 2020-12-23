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
		int result = 0;
		try {
			String line = "";
			BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\buleb\\git\\WP-crolling\\WP3_2019253071\\src\\action\\user.txt"));
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
		    reader.close();
		    if(result == 0) {
		    	System.out.println("sucess");
	        BufferedWriter bw = new BufferedWriter(new FileWriter("C:\\Users\\buleb\\git\\WP-crolling\\WP3_2019253071\\src\\action\\user.txt",true));
	        PrintWriter pr = new PrintWriter(bw,true);
	        pr.write(String.format("%s %s %s %s %s %s %s\n", user.getid(),user.getpw1(),user.getname(),user.getcall(),user.getemail(),user.getage(),user.getloc()));
	        pr.flush();
	        pr.close();
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
