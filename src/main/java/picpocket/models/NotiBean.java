package picpocket.models;

import java.time.LocalDateTime;

public class NotiBean {
	private int id;
	private String title;
	private LocalDateTime dateTime;

	public NotiBean(int id, String title, LocalDateTime dateTime) {
		super();
		this.id = id;
		this.title = title;
		this.dateTime = dateTime;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public LocalDateTime getDateTime() {
		return dateTime;
	}

	public void setDateTime(LocalDateTime dateTime) {
		this.dateTime = dateTime;
	}

}
