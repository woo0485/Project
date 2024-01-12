package com.finalproject.festival.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.finalproject.typeHandler.LocalDateSerializer;

public class Event {
	
	private int eventno;
	private String eventtitle;
	private String eventcontent;
	private String eventimage;
	@JsonSerialize(using = LocalDateSerializer.class)
	private LocalDate eventopendate;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	@JsonSerialize(using = LocalDateSerializer.class)
	private LocalDate eventclosedate;
	
	public int getEventno() {
		return eventno;
	}
	public void setEventno(int eventno) {
		this.eventno = eventno;
	}
	public String getEventtitle() {
		return eventtitle;
	}
	public void setEventtitle(String eventtitle) {
		this.eventtitle = eventtitle;
	}
	public String getEventcontent() {
		return eventcontent;
	}
	public void setEventcontent(String eventcontent) {
		this.eventcontent = eventcontent;
	}
	public String getEventimage() {
		return eventimage;
	}
	public void setEventimage(String eventimage) {
		this.eventimage = eventimage;
	}
	public LocalDate getEventopendate() {
		return eventopendate;
	}
	public void setEventopendate(LocalDate eventopendate) {
		this.eventopendate = eventopendate;
	}
	public LocalDate getEventclosedate() {
		return eventclosedate;
	}
	public void setEventclosedate(LocalDate eventclosedate) {
		this.eventclosedate = eventclosedate;
	}
	
	
	

}
