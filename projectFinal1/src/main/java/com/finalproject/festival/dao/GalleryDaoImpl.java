package com.finalproject.festival.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Gallery;

@Repository
public class GalleryDaoImpl implements GalleryDao {
	
	private final String NAME_SPACE = "com.finalproject.festival.mapper.GalleryMapper";

	@Autowired
	private SqlSessionTemplate st;
	
	@Override
	public void insertGallery(Gallery gallery) {
		
		Map<String, Object> map = new HashMap<>();
		
		String sqlimage = String.join(",", gallery.getGalleryimage());
		
		map.put("gallery", gallery);
		map.put("sqlimage", sqlimage);
		
		st.insert(NAME_SPACE + ".insertGallery", map);

	}

}
