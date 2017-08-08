package com.kekemile.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kekemile.po.Lunwen;
import com.kekemile.po.LunwenVo;

public interface LunwenService {
	/**
	 * 查询所有的论文信息
	 * 
	 * @param vo
	 * @return List<Lunwen>
	 */
	public List<Lunwen> searchAllTitle(LunwenVo vo);

	/**
	 * 查询论文的总数
	 * 
	 * @param LunwenVo vo
	 * @return int
	 */
	public int searchAllTitleCount(LunwenVo vo);

	/**
	 * 添加论文信息
	 * 
	 * @param  Lunwen lunwen
	 * @return Lunwen
	 * @author xingu
	 */
	public boolean insertTitle(Lunwen lunwen);
	
	/**
	 * 根据id查询论文信息
	 * @param id
	 * @return Lunwen
	 */
	public Lunwen searchTitleById(int id);
	
	/**
	 * 根据论文的id删除论文的信息
	 * @param int id
	 * @return boolean
	 */
	public boolean deleteLunwenById(Integer id);
	
	/**
	 * 根据论文的id修改论文的信息
	 * @param lunwen
	 * @return boolean
	 */
	public boolean updateLuwenById(Lunwen lunwen);
	
	/**
	 * 批量到入excel中文件
	 * @param name
	 * @param file
	 * @return
	 */
	public boolean batchImport(String name,MultipartFile file,HttpServletRequest request);
	
	
	/**
	 * 找出我们的论文中所有的doi信息
	 * @return
	 */
	public List<String> searchAllTitleDoi();

	/**
	 * 找出我们的论文中所有的doi信息
	 * @return
	 */
	public List<String> searchAllWorkplace();
	/**
	 * 找出我们的论文中所有的doi信息
	 * @return
	 */
	public List<String> searchAllLwname();
	
	
	
}
