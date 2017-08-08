package com.kekemile.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kekemile.mapper.LunwenCheckMapper;
import com.kekemile.po.CheckLunwen;
import com.kekemile.po.Lunwen;
import com.kekemile.po.UncheckLunwenVo;
import com.kekemile.po.UpdateScoreVo;
import com.kekemile.service.UncheckedLunwenService;

@Service
public class UncheckedLunwenServiceImpl implements UncheckedLunwenService {
     @Autowired
	private LunwenCheckMapper lunwenCheckMapper;
	
	@Override
	public List<Lunwen> searchAUncheckedTitle(UncheckLunwenVo vo) {
		
		List<Lunwen>  list = lunwenCheckMapper.searchAUncheckedTitle(vo);
		return list;
	}

	@Override
	public int searchAUncheckedTitleCount(UncheckLunwenVo vo) {
		int count = lunwenCheckMapper.searchAUncheckedTitleCount(vo);
		
		return count;
	}

	@Override
	public Lunwen searchTitleById(int id) {
		Lunwen lunwen = lunwenCheckMapper.searchTitleById(id);
		return lunwen;
	}

	@Override
	public boolean checkLuwenById(CheckLunwen checkLunwen) {
	
		Boolean flag = lunwenCheckMapper.checkLuwenById(checkLunwen);
		
		return flag;
	}

	@Override
	public boolean updateScoreByEmail(UpdateScoreVo updateScoreVo) {
		// TODO Auto-generated method stub
		Boolean flag = lunwenCheckMapper.updateScoreByEmail(updateScoreVo);
		return flag;
	}

}
