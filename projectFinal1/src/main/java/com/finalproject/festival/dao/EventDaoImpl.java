package com.finalproject.festival.dao;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public void eventPresentCondition(String id, int eventno) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("eventno", eventno);
		
		st.insert(NAME_SPACE + ".eventPresentCondition", map);
			
	}

	@Override
	public List<String> eventPresentConditionIdList(int eventno) {
		
		return st.selectList(NAME_SPACE + ".eventPresentConditionIdList", eventno);
	}

	@Override
	public void eventCoupon(String id, int couponno) {
		
		LocalDate currentDate = LocalDate.now();
		LocalDate oneMonthLater = currentDate.plusMonths(1);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("couponno", couponno);
		map.put("couponopendate", currentDate);
		map.put("couponclosedate", oneMonthLater);
		
		st.insert(NAME_SPACE + ".eventCoupon", map);
		
	}

}
