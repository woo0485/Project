package com.finalproject.festival.dao;

import java.time.LocalDate;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Event;

@Repository
public class EventDaoImpl implements EventDao {

	private final String NAME_SPACE = "com.finalproject.festival.mapper.EventMapper";

	@Autowired
	private SqlSessionTemplate st;
	
	@Override
	public void eventUpload(Event event) {
		
		LocalDate currentDate = LocalDate.now();
		
		event.setEventopendate(currentDate);
		
		st.insert(NAME_SPACE + ".eventUpload", event);
		
	}

	@Override
	public List<Event> event() {

		return st.selectList(NAME_SPACE + ".event");
		
	}

	@Override
	public Event eventDetail(int eventno) {
		
		return st.selectOne(NAME_SPACE + ".eventDetail", eventno);
	}

}
