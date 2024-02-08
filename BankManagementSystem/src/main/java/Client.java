
public class Client {
	private int id;
	private String name;
	private String email;
	private String account;
	private float amount;
	private String phone;
	private String role = "";
	
	public Client(int id, String name, String email, String phone, String account, float amount, String role ) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.account = account;
		this.amount = amount;
		this.phone = phone;
		this.role = role;
		
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


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


	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public float getAmount() {
		return amount;
	}


	public void setAmount(float amount) {
		this.amount = amount;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	

}
