package com.eazydeals.entities;

public class Message {
	private String message;
	private String messageType;
	private String cssClass;

	public Message() {
	}

	public Message(String message, String messageType, String cssClass) {
		this.message = message;
		this.messageType = messageType;
		this.cssClass = cssClass;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
}
