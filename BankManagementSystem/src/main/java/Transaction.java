import java.util.Date;

public class Transaction {
	private int id;
	private String sender;
	private String reciever;
	private String senderAccount;
	private String recieverAccount;
	private float amount;
	private Date date;
	private int userId;
	
	
	public Transaction(int id, String sender, String reciever, String senderAccount, String recieverAccount, float amount, Date date, int userId) {
		this.id = id;
		this.sender = sender;
		this.reciever = reciever;
		this.senderAccount = senderAccount;
		this.recieverAccount = recieverAccount;
		this.amount = amount;
		this.date = date;
		this.userId = userId;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReciever() {
		return reciever;
	}
	public void setReciever(String reciever) {
		this.reciever = reciever;
	}
	public String getSenderAccount() {
		return senderAccount;
	}
	public void setSenderAccount(String senderAccount) {
		this.senderAccount = senderAccount;
	}
	public String getRecieverAccount() {
		return recieverAccount;
	}
	public void setRecieverAccount(String recieverAccount) {
		this.recieverAccount = recieverAccount;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

}
