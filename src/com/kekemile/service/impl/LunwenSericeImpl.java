package com.kekemile.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kekemile.mapper.LunwenMapper;
import com.kekemile.po.Lunwen;
import com.kekemile.po.LunwenVo;
import com.kekemile.service.LunwenService;
import com.kekemile.util.excel.ReadExcel;

@Service
public class LunwenSericeImpl implements LunwenService {
	@Autowired
	private LunwenMapper lunwenMapper;

	@Override
	public List<Lunwen> searchAllTitle(LunwenVo vo) {
		List<Lunwen> list = lunwenMapper.searchAllTitle(vo);
		return list;
	}

	@Override
	public int searchAllTitleCount(LunwenVo vo) {

		int count = lunwenMapper.searchAllTitleCount(vo);
		return count;

	}

	@Override
	public boolean insertTitle(Lunwen lunwen) {
		Boolean flag = lunwenMapper.insertTitle(lunwen);

		return flag;
	}

	public Lunwen searchTitleById(int id) {
		Lunwen lunwen = lunwenMapper.searchTitleById(id);
		return lunwen;
	}

	@Override
	public boolean deleteLunwenById(Integer id) {

		// 根据论文的id删除论文的信息
		Boolean flag = lunwenMapper.deleteLunwenById(id);

		return flag;
	}

	@Override
	public boolean updateLuwenById(Lunwen lunwen) {
		Boolean flag = lunwenMapper.updateLuwenById(lunwen);
		return flag;
	}

	// 批量导入excel文件的数据的方法
	@Override
	public boolean batchImport(String name, MultipartFile file, HttpServletRequest request) {
		boolean b = false;
		// 创建处理EXCEL
		ReadExcel readExcel = new ReadExcel();
		// 解析excel，获取客户信息集合。
		List<Lunwen> lunwenList = readExcel.getExcelInfo(name, file, request);

		if (lunwenList != null) {
			b = true;
		}
		// 迭代添加论文信息（注：实际上这里也可以直接将customerList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
		for (Lunwen lw : lunwenList) {
			lunwenMapper.insertTitle(lw);
		}
		return b;
	}

	/*
	 * 查出所有的doi信息
	 * 
	 */
	@Override
	public List<String> searchAllTitleDoi() {
		List<String> list = lunwenMapper.searchAllTitleDoi();
		return list;
	}

	/*
	 * 查出所有的workplace 信息
	 * 
	 */
	@Override
	public List<String> searchAllWorkplace() {
		// TODO Auto-generated method stub
		List<String> list = lunwenMapper.searchAllWorkplace();
		return list;
	}

	/*
	 * 
	 * 查出所有的lwName信息
	 * 
	 */
	@Override
	public List<String> searchAllLwname() {
		// TODO Auto-generated method stub
		List<String> list = lunwenMapper.searchAllLwname();
		return list;
	}

}
