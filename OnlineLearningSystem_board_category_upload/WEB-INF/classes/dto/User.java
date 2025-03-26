package dto;

import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID = -427400572038577000L;
	private String id, passwd, check_passwd, name, email, role;
	private String phoneNumber, birthDate;
		
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getCheck_passwd() {
		return check_passwd;
	}

	public void setCheck_passwd(String check_passwd) {
		this.check_passwd = check_passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phone_number) {
		this.phoneNumber = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birth_date) {
		this.birthDate = birth_date;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
