package com.kh.ccms.skill.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ccms.skill.model.vo.Skill;

public interface SkillService {

	List<Map<String, String>> selectSkillList(int cPage, int numPerPage);

	int selectSkillTotalContents();

	Skill selectSkillOneView(int board_id);

	int skillInsert(Skill skill);

	int increaseSkillSee(int board_id);

	int skillUpdateEnd(Skill skill);

	int skillDelete(int board_id);

	List<Map<String, String>> selectSkillSearch(int cPage, int numPerPage, String searchSki, String searchSelect);

	int selectSkillTotalContentsSer(String searchSki);

	int selectCommentSCount(int board_id);

	Skill skillUpdateForm(int board_id);

}
