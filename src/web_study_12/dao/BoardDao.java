package web_study_12.dao;

import java.util.List;

import web_study_12.dto.Board;

public interface BoardDao {
	List<Board> selectBoardByAll();
	
	int insertBoard(Board board);
	
	void updateReadCount(int num);
	
	Board selectBoardByNum(int num);
	
	int updateBoard(Board board);
	
	Board checkPassWord(int num, String pass);
	
	int deleteBoard(int num);
}
