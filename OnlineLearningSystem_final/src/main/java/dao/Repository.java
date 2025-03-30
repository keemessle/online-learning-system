package dao;

import java.util.ArrayList;

import dto.User;

public class Repository {
	private ArrayList<User> userList = new ArrayList<>();
	private static Repository instance = new Repository();
	
	public Repository() {
		User user1 = new User();
		user1.setId("user1");
		user1.setPasswd("user1");
		user1.setName("user1");
		user1.setEmail("user1@gmail.com");
		user1.setPhoneNumber("01012345678");
		user1.setBirthDate("20000101");
		user1.setRole("teacher");
		
		User user2 = new User();
		user2.setId("user2");
		user2.setPasswd("user2");
		user2.setName("user2");
		user2.setEmail("user2@gmail.com");
		user2.setPhoneNumber("01023456789");
		user2.setBirthDate("20010101");
		user2.setRole("student");
		
		userList.add(user1);
		userList.add(user2);
	}
	
	public ArrayList<User> getAllUsers(){
		return userList;
	}
	
	public static Repository getInstance() {
		return instance;
	}
	
	public void addUser(User user) {
		userList.add(user);
	}
	
	public User getUserById(String id) {
		User userById = null;
		
		for(int i = 0; i < userList.size(); i++) {
			User user = userList.get(i);
			
			if(user != null && user.getId().equals(id)) {
				userById = user;
				break;
			}
		}
		return userById;
	}
}
