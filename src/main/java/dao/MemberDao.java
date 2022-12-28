package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.Member;

public class MemberDao {
	// SELECT
	
	// 로그인 메서드
	public Member selectMemberByIdAndPw(Connection conn, Member member) throws Exception {
		Member returnMember = null;
		String sql = "SELECT member_id, member_name, updatedate, createdate FROM member WHERE member_id =? AND member_pw =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			// 로그인 성공 디버깅 코드
			System.out.println("로그인 성공");
			returnMember = new Member();
			returnMember.setMemberId(rs.getString("member_id"));
			returnMember.setMemberName(rs.getString("member_name"));
			returnMember.setUpdatedate(rs.getString("updatedate"));
			returnMember.setCreatedate(rs.getString("createdate"));
		}
		
		rs.close();
		stmt.close();
		
		return returnMember;
	}
	
	// 회원정보
	public Member selectMemberOne(Connection conn, Member member) throws Exception {
		Member returnMember = null;
		String sql = "SELECT member_id, member_name, member_pw, updatedate, createdate FROM member WHERE member_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnMember = new Member();
			returnMember.setMemberId(rs.getString("member_id"));
			returnMember.setMemberPw(rs.getString("member_pw"));
			returnMember.setMemberName(rs.getString("member_name"));
			returnMember.setUpdatedate(rs.getString("updatedate"));
			returnMember.setCreatedate(rs.getString("createdate"));
		}
		
		rs.close();
		stmt.close();
		
		return returnMember;
	}
	
	// INSERT
	public int insertMember (Connection conn, Member member) throws Exception {
		String sql = "INSERT into member(member_id, member_pw, member_name, updatedate, createdate) VALUES(?, ?, ?, sysdate, sysdate)";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	// UPDATE
	
	// 비밀번호 수정
	public int updateMemberPw (Connection conn, Member member, String memberPw) throws Exception {
		String sql = "UPDATE member SET member_pw = ? WHERE member_id=? AND member_pw=?";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberPw);
		stmt.setString(2, member.getMemberId());
		stmt.setString(3, member.getMemberPw());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	// 회원정보 수정
	public int updateMemberName (Connection conn, Member member, String memberName) throws Exception {
		String sql = "UPDATE member SET member_name = ? WHERE member_id=? AND member_pw=?";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberName);
		stmt.setString(2, member.getMemberId());
		stmt.setString(3, member.getMemberPw());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	// DELETE
	public int deleteMember (Connection conn, Member member) throws Exception {
		String sql = "DELETE FROM member WHERE member_id=? AND member_pw=?";
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
}