package com.restaurant.model;

public class Feedback {
	
	private int id;
    private String name;
    private String email;
    private String subject;
    private String message;
    private String submittedAt;
    private String status;
    
    public Feedback() {}
    
	public Feedback(int id, String name, String email, String subject, String message, String submittedAt,
			String status) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.submittedAt = submittedAt;
		this.status = status;
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


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public String getSubmittedAt() {
		return submittedAt;
	}


	public void setSubmittedAt(String submittedAt) {
		this.submittedAt = submittedAt;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
    
    

}
