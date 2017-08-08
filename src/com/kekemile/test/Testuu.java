package com.kekemile.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.kekemile.mapper.LunwenCheckMapper;
import com.kekemile.mapper.LunwenMapper;
import com.kekemile.po.Lunwen;
import com.kekemile.po.UncheckLunwenVo;


public class Testuu {
	@Autowired
	private static LunwenMapper lunwenMapper;
	
	@Autowired
	private static LunwenCheckMapper lunwenCheckMapper;
    
	@Test
	public static void main11(String[] args) {

		List<Lunwen> list = lunwenMapper.searchAllTitle(null);
		System.out.println(list);
	}
	
	
	
     @Test
     public static void TestUncheckedLunwen(){
    	 
    	UncheckLunwenVo uncheckLunwenVo = new UncheckLunwenVo();
    	 
    	List<Lunwen> list = lunwenCheckMapper.searchAUncheckedTitle(uncheckLunwenVo);
    	
    	System.out.println(list);
    	 
     }
     
     
     
}
