package jsp중간고사시험정리;

public class User
{
	String userid;
	String password;
	String name;
	String email;
	String department;

	public User(String userid, String password, String name, String email, String department) {
		super();
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.department = department;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}


}
