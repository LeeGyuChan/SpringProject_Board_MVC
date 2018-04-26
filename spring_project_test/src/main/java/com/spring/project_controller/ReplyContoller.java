package com.spring.project_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project_svc.BoardServiceImpl;
import com.spring.project_svc.ReplyServiceImpl;
import com.spring.project_vo.PageCriteria;
import com.spring.project_vo.PagingMaker;
import com.spring.project_vo.ReplyBean;

@RestController
@RequestMapping("/reply")
public class ReplyContoller {

	
	@Autowired
	private ReplyServiceImpl replyServiceImpl;
	@Autowired
	private BoardServiceImpl boardServiceImpl;

	@RequestMapping(method = RequestMethod.POST, value="")
	public ResponseEntity<String> input(@RequestBody ReplyBean replyBean){
		
	
		ResponseEntity<String> resEntity = null;
		try{
			replyServiceImpl.inputReply(replyBean);
			boardServiceImpl.boardReplyCount(boardServiceImpl.selectArticle(replyBean.getBOARD_NUM()));
			resEntity = new ResponseEntity<String>("Success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return resEntity;
	}
	
	@RequestMapping(method = RequestMethod.PUT, value="")
	public ResponseEntity<String> modify(@RequestBody ReplyBean replyBean){
		
	
		ResponseEntity<String> resEntity = null;
		try{
			replyServiceImpl.modifyReply(replyBean);
			resEntity = new ResponseEntity<String>("Success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return resEntity;
	}
	@RequestMapping(method = RequestMethod.GET, value="/selectAll/{board_num}")
	public ResponseEntity<List<ReplyBean>> list(@PathVariable("board_num") Integer board_num){
		ResponseEntity<List<ReplyBean>> resEntity = null;
		
		try{
		resEntity = new ResponseEntity<>(replyServiceImpl.replyList(board_num),HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			resEntity = new ResponseEntity<>( HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}
	
	@RequestMapping(method ={RequestMethod.PUT, RequestMethod.PATCH}, value="/{re_num}")
	public ResponseEntity<String> modify(@PathVariable("re_num") Integer re_num, @RequestBody ReplyBean replyBean){
		
		ResponseEntity<String> resEntity = null;
		
		try {
			replyBean.setRE_NUM(re_num);
			replyServiceImpl.modifyReply(replyBean);
			
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}	
		return resEntity;
	}
	
	@RequestMapping(method =RequestMethod.DELETE, value="/{re_num}")
	public ResponseEntity<String> reDel(@PathVariable("re_num") Integer re_num){
		
		ResponseEntity<String> resEntity = null;
		try {
			replyServiceImpl.delReply(re_num);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}
	
	@RequestMapping(method = RequestMethod.GET, value="/{board_num}/{page}")
	public ResponseEntity<Map<String, Object>> reListPage(
			@PathVariable("board_num") Integer board_num, @PathVariable("page") Integer page){
		
		ResponseEntity<Map<String,Object>> resEntity = null;
		
		try {
		PageCriteria pageCriteria = new PageCriteria();
		pageCriteria.setPage(page);
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setPageCriteria(pageCriteria);
		
		Map<String,Object> reMap = new HashMap<>();
		List<ReplyBean> reLsit = replyServiceImpl.replyListPage(board_num, pageCriteria);
		
		reMap.put("reList", reLsit);
		
		int reCount = replyServiceImpl.reCount(board_num);
		pagingMaker.setTotalData(reCount);
		
		reMap.put("pagingMaker", pagingMaker);
		
		resEntity = new ResponseEntity<Map<String,Object>>(reMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
	}
		return resEntity;
	}
}
