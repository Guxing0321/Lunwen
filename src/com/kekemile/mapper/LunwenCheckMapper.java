package com.kekemile.mapper;

import java.util.List;

import com.kekemile.po.CheckLunwen;
import com.kekemile.po.Lunwen;
import com.kekemile.po.UncheckLunwenVo;
import com.kekemile.po.UpdateScoreVo;

/**
 * 审核论文的mapper类
 * 
 * @author guxing
 *
 */
public interface LunwenCheckMapper {
	/**
	 * 查询所有未被审核的论文信息
	 * 
	 * @return List<Lunwen>
	 */
	public List<Lunwen> searchAUncheckedTitle(UncheckLunwenVo vo);

	/**
	 * 
	 * 根据条件查询未被审核的论文的条数
	 * 
	 * @param UncheckLunwenVo
	 * @return int
	 */
	public int searchAUncheckedTitleCount(UncheckLunwenVo vo);

	/**
	 * 根据id查询论文信息
	 * 
	 * @param id
	 * @return Lunwen
	 */
	public Lunwen searchTitleById(int id);

	/**
	 * 根据论文的id审核论文的信息
	 * 
	 * @param CheckLunwen
	 * @return boolean
	 */
	public boolean checkLuwenById(CheckLunwen checkLunwen);

	/**
	 * 根据论文的id审核论文的信息
	 * 
	 * @param CheckLunwen
	 * @return boolean
	 */
	public boolean addScoreById(CheckLunwen checkLunwen);

	/**
	 * 根据论文的email来修改论文的分数信息
	 * 
	 * @param updateScoreVo
	 * @return
	 */
	public boolean updateScoreByEmail(UpdateScoreVo updateScoreVo);

}
