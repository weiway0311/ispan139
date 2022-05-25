package com.booksplattform.controller.reader;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.booksplattform.model.reader.Reader;
import com.booksplattform.repository.reader.ReaderService;

@RestController
public class TestController {
	
	@GetMapping("/hello.controller")
	public String processAction() {
		return "hola, mary";
	}
	
	@Autowired
	private ReaderService rService;
	
	// 測試CRUD ----------------------------------------------
	// 查詢 by id
	@GetMapping("/readerquerybyid.controller")
	public Reader processQuery() {
		return rService.findReaderById(1);
	}
	
	// 查詢 by email
	@GetMapping("/readerquerybyemail.controller")
	public Reader processQueryByEmail() {
		return rService.findReaderByEmail("admin@gmail.com");
	}
	
	// 查詢 All
	@GetMapping("/readerqueryall.controller")
	public List<Reader> processQueryAll() {
		return rService.findAllReader();
	}
	
	// 查詢 by Keyword
	@GetMapping("/readerquerybykeyword.controller")
	public List<Reader> processQueryByKeyword() {
		return rService.findReaderByKeyword("員");
	}
	
	// 新增
	@GetMapping("/readeradd.controller")
	public Reader processAddReader(@RequestBody Reader reader) {
		return rService.addReader(reader);
	}
	
	// 修改
	@GetMapping("/readerupdate.controller")
	public Reader processUpdateReader(@RequestBody Reader reader) {
		return rService.updateReader(reader);
	}
	
	// 刪除
	@GetMapping("/readerdelete.controller")
	public String procesDeleteReader() {
		rService.deleteReader(35);
		return "delete ok!";
	}

}
