package com.booksplattform.model.event;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="event")
@Component
public class Event implements java.io.Serializable{
	@Id @Column(name="EVENTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int eventId;
	
	@Column(name="EVENTNAME")
	private String eventName;
	
	@Column(name="EVENTTYPE")
	private String eventType;
	
	@Column(name="EVENTDATE")
	private String eventDate;
	
	@Column(name="EVENTPLACE")
	private String eventPlace;

	@Column(name="EVENTNUMBER")
	private int eventNumber;
	
	@Column(name="EVENTBIO")
	private String eventBio;
	
	@Lob
	@Column(name = "PHOTO")
	private byte[] photo;

	
	public Event() {
	}
	
	public Event(int eventId, String eventName, String eventType, String eventDate,String eventPlace, int eventNumber, String eventBio) {
		super();
		this.eventId = eventId;
		this.eventName = eventName;
		this.eventType = eventType;
		this.eventDate = eventDate;
		this.eventPlace = eventPlace;
		this.eventNumber = eventNumber;
		this.eventBio = eventBio;
		
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventType() {
		return eventType;
	}

	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	
	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventPlace() {
		return eventPlace;
	}

	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}
	
	public int getEventNumber() {
		return eventNumber;
	}

	public void setEventNumber(int eventNumber) {
		this.eventNumber = eventNumber;
	}

	public String getEventBio() {
		return eventBio;
	}

	public void setEventBio(String eventBio) {
		this.eventBio = eventBio;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	
	


}
