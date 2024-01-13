package com.finalproject.festival.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.EventDao;
import com.finalproject.festival.domain.Event;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDao ed;

	@Override
	public void eventUpload(Event event) {
		
		ed.eventUpload(event);
		
	}

	@Override
	public List<Event> event() {
		
		return ed.event();
	}

	@Override
	public Event eventDetail(int eventno) {
		
		return ed.eventDetail(eventno);
	}

}
