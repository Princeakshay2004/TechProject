package entity;


public class User {
		
	private int id;
	private String name;
	private String email;
	private String mobile_no;
	private String password;
	private String gender;
	private String profile;
	
	// Constructor
	
	public User(int id, String name, String email, String mobile_no, String password, String gender) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.mobile_no = mobile_no;
		this.password = password;
		this.gender = gender;
		
	}

	public User(String name, String email, String mobile_no, String password, String gender) {
		super();
		this.name = name;
		this.email = email;
		this.mobile_no = mobile_no;
		this.password = password;
		this.gender = gender;
		
	}
	



	public User() {
		
	}
	
	// Gettors and settors


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
		
}
