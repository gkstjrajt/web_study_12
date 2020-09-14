package web_study_12.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import web_study_12.dao.BoardDao;
import web_study_12.ds.JdbcUtil;
import web_study_12.ds.JndiDS;
import web_study_12.dto.Board;
import web_study_12.exception.CustomSQLException;

public class BoardDaoImpl implements BoardDao {
	private static final BoardDaoImpl instance = new BoardDaoImpl();
	private Connection con;
	
	private BoardDaoImpl() {}

	public static BoardDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public List<Board> selectBoardByAll() {
		String sql = "SELECT NUM, PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE FROM BOARD";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					List<Board> list = new ArrayList<Board>();
					do {
						list.add(getBoard(rs));
					} while(rs.next());
					return list;
				}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private Board getBoard(ResultSet rs) throws SQLException {
		int num = rs.getInt("NUM");
		String name = rs.getString("NAME");
		String email = rs.getString("EMAIL");
		String pass = rs.getString("PASS");
		String title = rs.getString("TITLE");
		String content = rs.getString("CONTENT");
		int readCount = rs.getInt("READCOUNT");
		Date writeDate = rs.getTimestamp("WRITEDATE");
		return new Board(num, name, email, pass, title, content, readCount, writeDate);
	}

	@Override
	public int insertBoard(Board board) {
		String sql = "INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE) VALUES(?, ?, ?, ?, ?, ?, ?)";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
					pstmt.setString(1, board.getPass());
					pstmt.setString(2, board.getName());
					pstmt.setString(3, board.getEmail());
					pstmt.setString(4, board.getTitle());
					pstmt.setString(5, board.getContent());
					pstmt.setInt(6, board.getReadCount());
					pstmt.setTimestamp(7, new Timestamp(board.getWriteDate().getTime()));
				return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public void updateReadCount(int num) {
		String sql = "UPDATE BOARD SET READCOUNT = READCOUNT + 1 WHERE NUM = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public Board selectBoardByNum(int num) {
		String sql = "SELECT NUM, PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE FROM BOARD WHERE NUM = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setInt(1, num);
				try(ResultSet rs = pstmt.executeQuery()){
					if(rs.next()) {
						return getBoard(rs);
					}
				}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int updateBoard(Board board) {
		String sql = "UPDATE BOARD SET PASS = ?, NAME = ?, EMAIL = ?, TITLE = ?, CONTENT = ?, READCOUNT = ?, WRITEDATE = ? WHERE NUM = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
					pstmt.setString(1, board.getPass());
					pstmt.setString(2, board.getName());
					pstmt.setString(3, board.getEmail());
					pstmt.setString(4, board.getTitle());
					pstmt.setString(5, board.getContent());
					pstmt.setInt(6, board.getReadCount());
					pstmt.setTimestamp(7, new Timestamp(board.getWriteDate().getTime()));
					pstmt.setInt(8, board.getNum());
				return	pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public Board checkPassWord(int num, String pass) {
		String sql = "SELECT NUM, PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE FROM BOARD WHERE NUM = ? AND PASS = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
					pstmt.setInt(1, num);
					pstmt.setString(2, pass);
				try(ResultSet rs = pstmt.executeQuery()){
					if(rs.next()) {
						return getBoard(rs);
					}
				}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int deleteBoard(int num) {
		String sql = "DELETE FROM BOARD WHERE NUM = ?";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
					pstmt.setInt(1, num);
				return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

}
