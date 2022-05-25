package com.booksplattform.repository.event;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.booksplattform.model.event.Event;

public interface EventRepository extends JpaRepository<Event, Integer> {
	
	@Query(value = "from Event where eventType like concat('%', ?1 , '%')")
	public List<Event> findByEventType(String eventType);
}
