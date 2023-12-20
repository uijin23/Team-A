package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.*;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RestController
@RequestMapping("/exam/*")
public class AnswerController {
	private static final Logger logger = LoggerFactory.getLogger(AnswerController.class);
	private static String[] userAnswers = new String[100];
	
	@ResponseBody
	@GetMapping("/answer")
	public String test(@RequestParam(value="testnum", required=false, defaultValue="0")int testnum,
			@RequestParam(value="chap", required=false, defaultValue="1")int chap, 
			@RequestParam(value="quest", required=false, defaultValue="1")int quest, 
			@RequestParam(value="questN")int questN) {
		logger.info("questN: "+questN);
		userAnswers[quest] = String.valueOf(questN);
		if (DBcontroller.getAnswer(String.format("exam%d", testnum), quest).equals(String.valueOf(questN))) {return "Correct Answer";}
		return "Wrong Answer";
	}
	
	@GetMapping("/finexam")
	public String finExam() {	
		return "test 페이지";
	}
}