package com.finalproject.festival.dao;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.GalleryBookMark;

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

	@Override
	public List<Gallery> gallery() {
		
		return st.selectList(NAME_SPACE + ".gallery");
	}

	@Override
	public List<Gallery> orderGallery(@Param("orderType") String orderType) {
		
		return st.selectList(NAME_SPACE + ".orderGallery", Collections.singletonMap("orderType", orderType));
	}

	@Override
	public int galleryheart(int galleryno, String id) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("galleryno", galleryno);
		
		st.update(NAME_SPACE + ".galleryheart", galleryno);
		
		st.insert(NAME_SPACE + ".insertGalleryBookmark", params);
		
		return st.selectOne(NAME_SPACE + ".gallerySelectUpdateCount", galleryno);
		
	}

	@Override
	public int gallerybad(int galleryno, String id) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("galleryno", galleryno);
		
		st.update(NAME_SPACE + ".gallerybad", galleryno);
		
		st.delete(NAME_SPACE + ".deleteGalleryBookmark", params);
		
		return st.selectOne(NAME_SPACE + ".gallerySelectUpdateCount", galleryno);
	}

	@Override
	public List<GalleryBookMark> galleryBookmark(String id) {
		
		return st.selectList(NAME_SPACE + ".galleryBookmark", id);
	}

}
