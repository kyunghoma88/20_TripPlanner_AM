package com.kh.spring.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.BoardComment;
import com.kh.spring.board.model.vo.Day;
import com.kh.spring.common.FaqSearchPaging;
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
		mv.addObject("pageBar",PageFactory.getPage(totalCount,cPage,numPerpage,"/20AM_TravelPlanner_final/board/boardList.do"));
		mv.setViewName("board/boardList");
		return mv;
	}
	
	/*
	 * @RequestMapping("/board/searchBoard.do") public ModelAndView
	 * searchBoard(@RequestParam(required = false, defaultValue = "1") int cPage,
	 * 
	 * @RequestParam(required = false, defaultValue = "6") int numPerpage,
	 * 
	 * @RequestParam String keyword, ModelAndView mv) { List<Board> list =
	 * service.searchBoard(keyword, cPage, numPerpage); int totalCount =
	 * service.searchBoardCount(keyword);
	 * 
	 * mv.addObject("list", list); mv.addObject("count", totalCount);
	 * mv.addObject("pageBar",PageFactory.getPage(totalCount,cPage,numPerpage,
	 * "/spring/board/searchBoard.do")); mv.setViewName("board/boardList"); return
	 * mv; }
	 */
	
	@RequestMapping("/board/searchBoard.do")
	public ModelAndView searchBoard(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false, defaultValue = "6") int numPerpage) {
		
		String keyword = request.getParameter("keyword");
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e){
			cPage = 1;
		}
		List<Board> list = service.searchBoard(keyword, cPage, numPerpage);
		int totalCount = service.searchBoardCount(keyword);
		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		mv.addObject("keyword", keyword);
		mv.addObject("pageBar", FaqSearchPaging.getPage(totalCount, cPage, numPerpage, "/20AM_TravelPlanner_final/board/searchBoard.do"));
		mv.setViewName("board/searchBoardList");
		return mv;
		
	}
	
	@RequestMapping("board/boardView.do")
	public ModelAndView boardView(ModelAndView mv,@RequestParam Map map,@RequestParam("id") String id,@RequestParam("no") int no, @RequestParam("loginMember") String loginMember) {
		Map<String,Object> idNo = new HashMap<String,Object>();
		idNo.put("id",loginMember);
		idNo.put("no",no);
		Board b = service.selectBoardTitle(map);
		List<Day> d = service.selectBoardView(map);
		List<BoardComment> bc = service.selectBoardComment(map);
		int date = d.get(0).getTotalDate();
		int likeCount = service.selectLikeCount(no);
		
		String likeCheck = service.selectLikeCheck(idNo);
//		int likeValue = Integer.parseInt(likeCheck);
		
		
		if(likeCheck == null) {
			service.insertLikeCheck(idNo);
			mv.addObject("lCheck",0);
		}else {
			int likeValue = Integer.parseInt(likeCheck);
			if(likeValue == 0 || likeValue == 1) {
				mv.addObject("lCheck",likeCheck);
			}
		}
		
		
	
		
		mv.addObject("date", date);
		mv.addObject("board", b);
		mv.addObject("day", d);
		mv.addObject("comment", bc);
		mv.addObject("likeCount",likeCount);
		mv.setViewName("board/boardView");
		return mv;
	}
	
	@RequestMapping("/board/boardDetail.do")
	@ResponseBody
	public List<Day> boardDetail(@RequestParam Map map) {
		List<Day> d = service.boardDetail(map);
		return d;
	}
	
	
	
	@RequestMapping("/boardLike.do")
	public ModelAndView BoardLike(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		int trSeq=Integer.parseInt(request.getParameter("trSeq"));
		System.out.println(trSeq);
		
		
		return mv;
	}
	
	@RequestMapping("board/boardCommentInsert.do")
	public ModelAndView insertBoardComment(ModelAndView mv, @RequestParam Map map, HttpServletRequest request) {
		int result = service.insertBoardComment(map);
		String no = request.getParameter("no");
		String id = request.getParameter("id");
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "등록성공";
			loc = "/board/boardView.do?no="+no+ "&id="+id;
		}else {
			msg = "등록실패";
			loc = "/board/boardView.do?no="+no+ "&id="+id;
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/boardLike0.do")
	public ModelAndView BoardLike0(ModelAndView mv,@RequestParam("id") String id,@RequestParam("no") int no ) {
		Map idNo = new HashMap();
		idNo.put("id",id);
		idNo.put("no",no);
		int likeUp = service.updateLikeUp(idNo);
		int totalLikeUp = service.updateTotalLikeUp(idNo);
		mv.addObject("likeUp",likeUp);
		mv.addObject("totalLikeUp",totalLikeUp);
		mv.setViewName("board/boardView");
		return mv;
	}
	
	@RequestMapping("/boardLike1.do")
	public ModelAndView BoardLike1(ModelAndView mv,@RequestParam("id") String id,@RequestParam("no") int no) {
		Map idNo = new HashMap();
		idNo.put("id",id);
		idNo.put("no",no);
		int likeDown = service.updateLikeDown(idNo);
		int totalLikeDown = service.updateTotalLikeDown(idNo);
		mv.addObject("likeDown",likeDown);
		mv.addObject("totalLikeDown",totalLikeDown);
		mv.setViewName("board/boardView");
		return mv;
	}
	

}
