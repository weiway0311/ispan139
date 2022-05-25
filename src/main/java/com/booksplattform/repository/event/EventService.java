package com.booksplattform.repository.event;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booksplattform.model.event.Event;

@Service
@Transactional
public class EventService {
	
	@Autowired
	private EventRepository eRepo;
	
	// 搜尋全部
	public List<Event> searchAll(){
		return eRepo.findAll();
	}
	
	// 新增
	public Event addEvent(Event event) {
		return eRepo.save(event);
	}
	
	// 用id查詢
	public Event searchById(int eventId) {
		Optional<Event> optional = eRepo.findById(eventId);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	// 用類別查詢
	public List<Event> searchByType(String eventType) {
		return eRepo.findByEventType(eventType);
		
	}
	
	// 修改
	public Event updateEvent(Event event) {
		return eRepo.save(event);
	}
	
	// 刪除
	public void deleteEventById(int eventId) {
		eRepo.deleteById(eventId);
	}

}
