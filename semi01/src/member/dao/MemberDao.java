package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static common.jdbc.JDBCConnectionPool.*;
import member.vo.Member;

public class MemberDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;

// 회원 전체 불러오기
	public ArrayList<Member> selectAll() {
		Connection conn = getConnection();
		ArrayList<Member> list = null;
		String sql = "select * from member";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Member>();
				do {
					Member vo = new Member();
					vo.setId(rs.getString("id"));
					vo.setNickname(rs.getString("nickname"));
					vo.setPassword(rs.getString("password"));
					vo.setPassquestion(rs.getString("passqeustion"));
					vo.setPassanswer(rs.getString("passanswer"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setAddress(rs.getString("address"));
					vo.setTel(rs.getString("tel"));
					vo.setEmail(rs.getString("email"));
					list.add(vo);
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}

		return list;
	}

// 아이디로 회원 검색 조회
	public Member selectSearch(String id) {
		Connection conn = getConnection();
		Member vo = null;
		String sql = "select * from member where id like '%" + id + "%'";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					vo = new Member();
					vo.setId(rs.getString("id"));
					vo.setNickname(rs.getString("nickname"));
					vo.setPassword(rs.getString("password"));
					vo.setPassquestion(rs.getString("passquestion"));
					vo.setPassanswer(rs.getString("passanswer"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setAddress(rs.getString("address"));
					vo.setTel(rs.getString("tel"));
					vo.setEmail(rs.getString("email"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		return vo;
	}

// 회원가입
	public int insert(Member vo) {
		Connection conn = getConnection();
		int result = 0;

		String sql = "insert into member values(?, ?, ?, ?, ?, to_char(sysdate, 'YYYY-MM-DD HH:MM:SS'), ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getNickname());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getPassquestion());
			pstmt.setString(5, vo.getPassanswer());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getEmail());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}

		return result;
	}

// 회원 정보 변경
//	public int update(String col, Member vo) {
//		Connection conn = getConnection();
//		int result = 0;
//		String sql = "update test_member set " + col + " = ?  where id = ?";
//
//		PreparedStatement pstmt = null;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			switch (col) {
//			case "name":
//				pstmt.setString(1, vo.getName());
//				break;
//			case "passwd":
//				pstmt.setString(1, vo.getPasswd());
//				break;
//			case "email":
//				pstmt.setString(1, vo.getEmail());
//				break;
//			}
//			pstmt.setString(2, vo.getId());
//
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//			close(conn);
//		}
//
//		return result;
//	}
//
//	// delete()
//	public int delete(Connection conn, String col, String str) {
//		int result = 0;
//
//		return result;
//	}
//

// 로그인
	public Member login(String id) {
		Connection conn = getConnection();
		Member vo = null;

		String sql = "select * from member where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					vo = new Member();
					vo.setId(rs.getString("id"));
					vo.setNickname(rs.getString("nickname"));
					vo.setPassword(rs.getString("password"));
					vo.setPassquestion(rs.getString("passquestion"));
					vo.setPassanswer(rs.getString("passanswer"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setAddress(rs.getString("address"));
					vo.setTel(rs.getString("tel"));
					vo.setEmail(rs.getString("email"));
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return vo;
	}

}
