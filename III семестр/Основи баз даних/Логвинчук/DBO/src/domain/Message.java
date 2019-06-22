package domain;

import dao.annotation.*;

@Table(name = "Message")
public class Message {
	
	@Column(name = "ID", primaryKey = true)
	private int id;
	
	@Column(name = "Sender", foreignKey = true)
	private int senderId;
	
	@Column(name = "Receiver", foreignKey = true)
	private int receiverId;
	
	@Column(name = "Text")
	private String text;
	
	@CascadeReference
	private User sender;
	@CascadeReference
	private User receiver;

	public Message() {}
	
	/**
	 * @param id
	 * @param senderId
	 * @param receiverId
	 * @param text
	 * @param sender
	 * @param receiver
	 */
	public Message(int id, String text, User sender, User receiver) {
		this.id = id;
		this.senderId = sender.getId();
		this.receiverId = receiver.getId();
		this.text = text;
		this.sender = sender;
		this.receiver = receiver;
	}
	
	/**
	 * @param text
	 * @param sender
	 * @param receiver
	 */
	public Message(String text, User sender, User receiver) {
		this.text = text;
		this.sender = sender;
		this.receiver = receiver;
		this.senderId = sender.getId();
		this.receiverId = receiver.getId();
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the senderId
	 */
	public int getSenderId() {
		return senderId;
	}

	/**
	 * @param senderId the senderId to set
	 */
	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}

	/**
	 * @return the receiverId
	 */
	public int getReceiverId() {
		return receiverId;
	}

	/**
	 * @param receiverId the receiverId to set
	 */
	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}

	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}

	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}

	/**
	 * @return the sender
	 */
	public User getSender() {
		return sender;
	}

	/**
	 * @param sender the sender to set
	 */
	public void setSender(User sender) {
		this.sender = sender;
	}

	/**
	 * @return the receiver
	 */
	public User getReceiver() {
		return receiver;
	}

	/**
	 * @param receiver the receiver to set
	 */
	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	@Override
	public String toString() {
		return "Message [text=" + text + ", sender=" + senderId + ", receiver=" + receiverId + "]";
	}

}