package web_study_12.dao.impl;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import web_study_12.dao.BoardDao;
import web_study_12.ds.JdbcUtil;
import web_study_12.dto.Board;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class BoardDaoImplTest {
	private static BoardDaoImpl dao;
	private static Connection con;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		con = JdbcUtil.getConnection();
		dao = BoardDaoImpl.getInstance();
		dao.setCon(con);
	}
	
	@Test
	public void test08SelectBoardByAll() {
		System.out.println("testSelectBoardByAll");
		List<Board> list = dao.selectBoardByAll();
		list.stream().forEach(System.out::println);
	}

//	@Test
	public void test01InsertBoard() {
		System.out.println("test01InsertBoard");
		Board board = new Board("아이아이", "dkdl@test.co.kr", "1234", "first", "뭐야", 0, new Date());
		int res = dao.insertBoard(board);
		Assert.assertEquals(1, res);
		System.out.println(board);
	}

	@Test
	public void test03UpdateReadCount() {
		System.out.println("test03UpdateReadCount");
		dao.updateReadCount(5);
	}

	@Test
	public void test06SelectBoardByNum() {
		System.out.println("test06SelectBoardByNum");
		Board board = dao.selectBoardByNum(5);
		Assert.assertNotNull(board);
		System.out.println(board);
	}

	@Test
	public void test02UpdateBoard() {
		System.out.println("test02UpdateBoard");
		Board board = dao.selectBoardByNum(5);
		board.setPass("4321");
		board.setName("유이아");
//		board.setEmail(email);
		board.setTitle("첫방문4");
		board.setContent("이게무슨일이야");
//		board.setReadCount(readCount);
//		board.setWriteDate(writeDate);
		board.setNum(5);
		int res = dao.updateBoard(board);
		Assert.assertEquals(1, res);
		System.out.println(board);
	}

	@Test
	public void test04CheckPassWord() {
		System.out.println("test04CheckPassWord");
		Board board = dao.checkPassWord(5, "4321");
		System.out.println(board);
	}

	@Test
	public void test07DeleteBoard() {
		fail("Not yet implemented");
	}

}
