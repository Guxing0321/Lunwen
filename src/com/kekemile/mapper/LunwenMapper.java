package com.kekemile.mapper;

import java.util.List;

import com.kekemile.po.Lunwen;
import com.kekemile.po.LunwenVo;

/**
 * @author xingu
 *
 */
public interface LunwenMapper {
   /**
    * 查询所有的论文信息
    * @return
    */
public List<Lunwen> searchAllTitle(LunwenVo vo);
 
 /**
  * 查询论文的总数
  * @return int
  * @author xingu
  */
public int searchAllTitleCount(LunwenVo vo);

/**
 * 根据邮箱查看我们的已经通过审核的论文
 * @param LunwenVo vo
 * @return 
 */
public int SearchCheckTitleCount(LunwenVo vo);
   
   /**
    * 添加论文信息
    * @return boolean
    * @author xingu
    * 
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