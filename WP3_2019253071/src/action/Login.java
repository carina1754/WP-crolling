package action;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import user.User;

public class Login {
	public int login(User user) {
		int result = 0;//��� ��� ����
		Log log = new Log();//�α� ��ü ����
		try {
			String line = "";//�� �б� ����
			BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\buleb\\git\\WP-crolling\\WP3_2019253071\\src\\action\\user.txt"));//���� ����� �б�
		    while ((line = reader.readLine()) != null) { //������ ��� ����������
		        String[] temp = line.split(" ");//����������� ���ڿ� ������
		        if(temp[0].equals(user.getid())) {//���̵� ��ĥ ��
		        	if(temp[1].equals(user.getpw())) {//��й�ȣ�� ��ĥ ��
		        		log.logupdate(user);//�α� ����
		        	return 1;//�α��� ����
		        	}
		        	else
			        	return 0;//�α��� ����
		        }
		        else
		        	result=0;//�α��� ����
		    }
		    reader.close();
		}
		catch (IOException e) {
	        e.printStackTrace();
	        return 0;
	    }
		return result;//�α��� ���� �� ���� RETURN
	}
}
