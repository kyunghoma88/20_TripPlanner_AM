package com.kh.spring.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.Day;
import com.kh.spring.common.PageFactory;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@RequestMapping("/board/boardList.do")
	public ModelAndView boardList(@RequestParam(required = false, defaultValue = "1") int cPage, 
								@RequestParam(required = false, defaultValue = "6") int numPerpage,
								ModelAndView mv) {

		List<Board> list = service.selectBoard(cPage,numPerpage);
		int totalCount = service.selectBoardCount();

		mv.addObject("list",list);
		mv.addObject("count",totalCount);
		mv.addObject("pageBar",PageFactory.getPage(totalCount,cPage,numPerpage,"/spring/board/boardList.do"));
		mv.setViewName("board/boardList");
		return mv;

	}

	@RequestMapping("board/boardView.do")
	public ModelAndView boardView(ModelAndView mv,@RequestParam Map map) {
		Board b = service.selectBoardTitle(map);
		List<Day> d = service.selectBoardView(map);
		int date = d.get(0).getTotalDate();
		mv.addObject("date", date);
		mv.addObject("board", b);
		mv.addObject("day", d);
		System.out.println("day : " + d);
		mv.setViewName("board/boardView");
		return mv;
	}
	
	@RequestMapping("/board/boardDetail.do")
	@ResponseBody
	public List<Day> boardDetail(@RequestParam Map map) {
		List<Day> d = service.boardDetail(map);
		System.out.println(d);
		return d;
	}

}
