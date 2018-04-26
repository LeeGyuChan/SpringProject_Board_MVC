package com.spring.project_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project_svc.BoardServiceImpl;
import com.spring.project_vo.BoardVO;
import com.spring.project_vo.FindCriteria;
import com.spring.project_vo.PageCriteria;
import com.spring.project_vo.PagingMaker;

@RestController
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardServiceImpl boardServiceImpl;
	
	@RequestMapping(method = RequestMethod.GET, value="/All/{page}")
	public ResponseEntity<Map<String, Object>> boardListPage(@PathVariable("page") Integer page){
		
		ResponseEntity<Map<String, Object>> resEntity = null;
		
		try {
		PageCriteria pageCriteria = new PageCriteria();
		pageCriteria.setPage(page);
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setPageCriteria(pageCriteria);
		
		Map<String,Object> boardMap = new HashMap<>();
		List<BoardVO> boardLsit = boardServiceImpl.boardList(pageCriteria);
		boardMap.put("boardList", boardLsit);
		
		int listAllCount = boardServiceImpl.listAllCount();
		pagingMaker.setTotalData(listAllCount);
		boardMap.put("pagingMaker", pagingMaker);
		
		resEntity = new ResponseEntity<Map<String,Object>>(boardMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
	}
		return resEntity;
	}
	
	@RequestMapping(method = RequestMethod.GET, value="/{keyword}/{page}")
	public ResponseEntity<Map<String, Object>> findListPage(@PathVariable("keyword") String keyword, @PathVariable("page") Integer page){
		
		ResponseEntity<Map<String, Object>> resEntity = null;

		try {
		FindCriteria findCriteria = new FindCriteria();
		findCriteria.setPage(page);
		findCriteria.setKeyWord(keyword);
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setPageCriteria(findCriteria);
		
		Map<String,Object> boardMap = new HashMap<>();
		List<BoardVO> boardLsit = boardServiceImpl.boardFindList(findCriteria);
		boardMap.put("boardList", boardLsit);
		
		int listFindCount = boardServiceImpl.listFindCount(findCriteria);
		pagingMaker.setTotalData(listFindCount);
		boardMap.put("pagingMaker", pagingMaker);
		
		resEntity = new ResponseEntity<Map<String,Object>>(boardMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
	}
		return resEntity;
	}
	
	
	@RequestMapping(method =RequestMethod.DELETE, value="/delete/{board_num}/{board_pass}")
	public ResponseEntity<String> reDel(@PathVariable("board_num") int board_num, @PathVariable("board_pass") String board_pass){
		
		ResponseEntity<String> resEntity = null;
		try {
			BoardVO boardVO = boardServiceImpl.selectArticle(board_num);
			if(boardVO.getBOARD_PASS().equals(board_pass)){
				boardServiceImpl.delArticle(boardVO);
				resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}
	
}
