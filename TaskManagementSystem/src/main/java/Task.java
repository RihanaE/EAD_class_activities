
public class Task {
	
	private int id;
	private String title;
	private String desc;
	private String dueDate;
	private String priority;
	private String status;
	
	public Task(int id, String title, String desc , String dueDate, String priority, String status) {
		this.id = id;
		this.title = title;
		this.desc = desc;
		this.dueDate = dueDate;
		this.priority = priority;
		this.status = status;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	
	public void setPriority(String priority) {
		this.priority = priority;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getDesc() {
		return desc;
	}
	
	public String getDueDate() {
		return dueDate;
	}
	
	public String getPriority() {
		return priority;
	}
	
	public String getStatus() {
		return status;
	}

	

}
