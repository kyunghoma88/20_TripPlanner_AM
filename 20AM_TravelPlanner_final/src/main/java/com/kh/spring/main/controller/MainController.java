package com.kh.spring.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;

@Controller
public class MainController {

	@Autowired
	private BoardService service;
	

	@RequestMapping("/main/main.do")
	@ResponseBody
	public List<Board> boardList(@RequestParam(required = false, defaultValue = "1") int cPage, 
								@RequestParam(required = false, defaultValue = "6") int numPerpage) {
		
		List<Board> list = service.selectBoard(cPage, numPerpage);
		int totalCount = service.selectBoardCount();
		System.out.println(list);
		return list;
		
	}
	
	@RequestMapping("information.do")
	public ModelAndView infor(ModelAndView mv) {
		mv.setViewName("information/information");
		return mv;
	}
	
	
	
}
