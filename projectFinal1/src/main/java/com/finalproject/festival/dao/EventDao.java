package com.finalproject.festival.dao;

import java.util.List;

import com.finalproject.festival.domain.Event;

public interface EventDao {
	
	public abstract void eventUpload(Event event);
	
	public abstract List<Event> event();
	
	public abstract Event eventDetail(int eventno);

}
