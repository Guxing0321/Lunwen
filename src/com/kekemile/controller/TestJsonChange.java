package com.kekemile.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kekemile.po.Lunwen;
import com.kekemile.service.LunwenService;

/**
 * 测试页面自动不全的方法
 * 
 * @author Guxing
 *
 */
@Controller
@RequestMapping("/Json")
public class TestJsonChange {
	
	@Autowired
	private LunwenService lunwenService;
	
	
	@RequestMapping("/testJsonChange")
	public String TestJsonChange(){
		
		return "TestJsonChange";
		
	}
	
	
	@RequestMapping("/jsonChange")
	@ResponseBody
	public List findJson(@Param("query") String query) {

		List list = new ArrayList<>();

		list.add("南京信息工程大学");
		list.add("东南大学成贤学院");
		list.add("南京航空航天大学");
		list.add("北京农业大学");
		list.add("哈尔滨工业大学");

		return list;
	}
	
	@RequestMapping("/DoijsonChange")
	@ResponseBody
	public List<String> DoijsonChange(@Param("query") String query) {

		List<String> lunwenList = lunwenService.searchAllTitleDoi();

		return lunwenList;
	}
	
	
	@RequestMapping("/lwNamejsonChange")
	@ResponseBody
	public List<String> lwNamejsonChange(@Param("query") String query) {

		List<String> lwNameList = lunwenService.searchAllLwname();
		
		return lwNameList;
	}
	
	@RequestMapping("/workplaceJsonChange")
	@ResponseBody
	public List<String> workplaceJsonChange(@Param("query") String query) {

		List<String> workPlaceList = lunwenService.searchAllWorkplace();
		
		return workPlaceList;
	}
	

}
