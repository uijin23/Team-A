package org.zerock.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

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
@RequestMapping("/exam/*")
@AllArgsConstructor
public class ExamController {
	private static final Logger logger = LoggerFactory.getLogger(ExamController.class);
	private BoardService service;

	@GetMapping("/random")
	public String randomExam(@RequestParam(value="testnum", required=false, defaultValue="0")int testnum,
			@RequestParam(value="chap", required=false, defaultValue="0")int chap, 
			@RequestParam(value="quest", required=false, defaultValue="1")int quest, Model model) {
			
		if (testnum==0) {
			model.addAttribute("title", "랜덤문제출제");
			model.addAttribute("loginStatus", CommonController.isAuthenticated());
			return "exam/mainexam";
		}
		model = examQuest(testnum, quest, model);
		return movePage(chap);
	}

	@GetMapping("/note")
	public String examNote(Model model) {
		logger.info("examNote", "exam");
		model = examQuest(20220424, 1, model);
		model.addAttribute("title", "오답노트");
		model.addAttribute("loginStatus", CommonController.isAuthenticated());
		return "exam/examNote";
	}

	@GetMapping("/main")
	public String examStart(@RequestParam(value="testnum", required=false, defaultValue="0")int testnum,
		@RequestParam(value="chap", required=false, defaultValue="0")int chap, 
		@RequestParam(value="quest", required=false, defaultValue="1")int quest, Model model) {
		
		if (testnum==0) {
			model.addAttribute("loginStatus", CommonController.isAuthenticated());
			model.addAttribute("title", "기출문제");
			return "exam/mainexam";
		}
		model = examQuest(testnum, quest, model);
		return movePage(chap);
	}
	
	@GetMapping("/serach")
	public String search(@RequestParam(value="q", defaultValue="")String query, Model model) {
		LinkedList<String> searched = searchWeb(query);
		model.addAttribute("title", "검색결과");
		model.addAttribute("searchV", query);
		model.addAttribute("loginStatus", CommonController.isAuthenticated());
		model.addAttribute("searchRes", searched);
		model.addAttribute("searchResNum", convertString(searched).length);

		return "exam/search";
	}
	
	private String[] convertString(LinkedList<String> linkST) {
		String lists[] = new String[linkST.size()];
		for (int i=0; i<linkST.size(); i++) {
			lists[i] = linkST.get(i);
		}
		return lists;
	}
	
	private String convertString(String[] convStr) {
		String convString="";
		for (int i=0; i<convStr.length; i++) {
			convString += (convStr[i]+" ");
		}
		return convString;
	}
	
	private LinkedList<String> searchWeb(String search) {
		String data[][] = DBcontroller.getAllData("all");
		LinkedList<String> searchedData = new LinkedList();
		
		for (int i=0; i<data.length; i++){
			for (int j=0; j<data[i].length; j++) {
				if (data[i][j].contains(search)) {
					searchedData.add(convertString(data[i]));
					continue;
				}
			}
		}
		return new LinkedList<String>(new HashSet<String>(searchedData));
	}
	
	private String movePage(int chap) {
		switch (chap) {
		case 0:
			logger.info("chap0", "");
			return "exam/examlist";				
		case 1:
			logger.info("chap1", "chap1");
			return "exam/chapQuest";
		case 2:
			logger.info("chap2", "chap2");
			return "exam/chapQuest";
		case 3:
			logger.info("chap3", "chap3");
			return "exam/chapQuest";
		case 4:
			logger.info("chap4", "chap4");
			return "exam/chapQuest";
		case 5:
			logger.info("chap5", "chap5");
			return "exam/chapQuest";
		}
		return null;
	}
	
	private Model examQuest(int testnum, int quest, Model model) {
		String examName = String.format("exam%d", testnum);
		model.addAttribute("loginStatus", CommonController.isAuthenticated());
		model.addAttribute("testnum", testnum);
		model.addAttribute("title", DBcontroller.getQuestType(examName, quest));
		model.addAttribute("questNum", quest);
		model.addAttribute("quest", DBcontroller.getQuestion(examName, quest));
		model.addAttribute("questType", DBcontroller.getQuestType(examName, quest));
		model.addAttribute("questionImg", DBcontroller.getQuestionImg(examName, quest));
		model.addAttribute("a1", DBcontroller.getAnswer1(examName, quest));
		model.addAttribute("a2", DBcontroller.getAnswer2(examName, quest));
		model.addAttribute("a3", DBcontroller.getAnswer3(examName, quest));
		model.addAttribute("a4", DBcontroller.getAnswer4(examName, quest));
		model.addAttribute("answer", DBcontroller.getAnswer(examName, quest));
		return model;
	}
}