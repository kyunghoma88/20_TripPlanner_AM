package com.kh.spring.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;
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
	public ModelAndView boardView(ModelAndView mv, int no) {
		Map<String, String> b = service.selectBoardView(no);
		mv.addObject("board", b);
		System.out.println(b);
		mv.setViewName("board/boardView");
		return mv;
	}

}
