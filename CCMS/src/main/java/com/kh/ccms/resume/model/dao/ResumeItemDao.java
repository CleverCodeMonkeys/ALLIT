package com.kh.ccms.resume.model.dao;

import java.util.List;

import com.kh.ccms.resume.model.vo.ResumeItem;

public interface ResumeItemDao 
{
	//Item Information
	public ResumeItem selectItem(int itemId, String querytype, String itemType);
	public List<ResumeItem> selectItemList(int resumeId, String querytype, String itemType);
	public int insertItem(ResumeItem item, String querytype, String itemType);
	public int updateItem(ResumeItem item, String querytype, String itemType);
	
	// No need to Delete Using id, because Resume id is Primary key, so if you delete Resume
	// This will be deleted by Chained [ deleteItem(int id)] 
	// So you only use itemId. 
	public int deleteItem(int itemId, String queryType, String itemType);
}
