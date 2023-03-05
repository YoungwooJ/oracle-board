package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Board;
import vo.Member;

public class BoardDao {
	// SELECT
	
	// 전체 게시글 갯수 구하기
	public int selectBoardCount(Connection conn, String search) throws Exception {
		int count = 0;
		PreparedStatement stmt = null;
		if(search == null || search.equals("")) {
			String sql = "SELECT COUNT(*) count"
					+ "	  FROM (SELECT rownum rnum, board_no, board_title, createdate"
					+ "			FROM (SELECT board_no, board_title, createdate"
					+ "				  FROM board ORDER BY board_no DESC))";
			stmt = conn.prepareStatement(sql);
		} else {
			String sql = "SELECT COUNT(*) count"
					+ "	  FROM (SELECT rownum rnum, board_no, board_title, createdate"
					+ "			FROM (SELECT board_no, board_title, createdate"
					+ "				  FROM board ORDER BY board_no DESC))"
					+ "	  WHERE board_title LIKE ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+search+"%");
		}
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
		}
		
		return count;
	}
	
	// 검색 추가
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow, String search) throws Exception{
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement stmt = null;
		if(search == null || search.equals("")) {
			String sql = "SELECT board_no boardNo, board_title boardTitle, createdate"
					+ "	  FROM (SELECT rownum rnum, board_no, board_title, createdate"
					+ "			FROM (SELECT board_no, board_title, createdate"
					+ "				  FROM board ORDER BY createdate DESC)"
					+ "			ORDER BY board_no DESC)"
					+ "	  WHERE rnum BETWEEN ? AND ?"; // WHERE rnum >= ? AND rnum <= ?;
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, endRow);
		} else {
			String sql = "SELECT board_no boardNo, board_title boardTitle, createdate"
					+ "	  FROM (SELECT rownum rnum, board_no, board_title, createdate"
					+ "			FROM (SELECT board_no, board_title, createdate"
					+ "				  FROM board ORDER BY createdate DESC)"
					+ "			ORDER BY board_no DESC)"
					+ "	  WHERE board_title LIKE ? AND rnum BETWEEN ? AND ?"; // WHERE rnum >= ? AND rnum <= ?;
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+search+"%");
			stmt.setInt(2, beginRow);
			stmt.setInt(3, endRow);
		}
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		stmt.close();
		rs.close();
		
		return list;
	}
	
	public Board selectBoardOne (Connection conn, int boardNo) throws SQLException {
		Board board = null;
		String sql = "SELECT board_no boardNo, board_title boardTitle, board_content boardContent, member_id memberId, updatedate, createdate"
				+ "	  FROM board"
				+ "	  WHERE board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			board = new Board();
			board.setBoardNo(rs.getInt("boardNo"));
			board.setBoardTitle(rs.getString("boardTitle"));
			board.setBoardContent(rs.getString("boardContent"));
			board.setMemberId(rs.getString("memberId"));
			board.setUpdatedate(rs.getString("updatedate"));
			board.setCreatedate(rs.getString("createdate"));
		}
		stmt.close();
		rs.close();
		
		return board;
	}
	
	// INSERT
	public int insertBoard(Connection conn, Board board, Member member) throws Exception{
		String sql = "INSERT into board ("
				+ "    board_no, board_title, board_content, member_id, updatedate, createdate"
				+ ") VALUES ("
				+ "    board_seq.nextval, ?, ?, ?, sysdate, sysdate"
				+ ")";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, member.getMemberId());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	// UPDATE
	public int updateBoard (Connection conn, Board board) throws Exception {
		String sql = "UPDATE board SET board_title = ?, board_content = ?, updatedate = sysdate WHERE board_no = ?";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setInt(3, board.getBoardNo());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	// DELETE
	public int deleteBoard (Connection conn, Board board) throws Exception {
		String sql = "DELETE FROM board WHERE board_no = ?";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, board.getBoardNo());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
}
