package Poll;
import java.sql.*;
import java.text.*;
import java.util.*;
import java.util.Date;

import Poll.DBconnection;

public class PollDBbean {

	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;

	public PollDBbean() {	
		try {
			conn = DBconnection.getConnection();
		} catch(Exception e){
			e.printStackTrace();
			System.out.println("드라이버 로딩 및 connection 오류");
		}
	} //드라이버 연결
	
	public int insertPoll(PollBean poll) {
		int result = 0;
		sql = "insert into tblpoll values (?, ?, ?, ?, ?, ?, ?, ?, date_format(NOW(), '%Y%m%d'), ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, poll.getQuestion());
			pstmt.setString(3, poll.getAnswer1());
			pstmt.setString(4, poll.getAnswer2());
			pstmt.setString(5, poll.getAnswer3());
			pstmt.setString(6, poll.getAnswer4());
			pstmt.setString(7, poll.getSdate());
			pstmt.setString(8, poll.getEdate());
			pstmt.setInt(9, poll.getType());
			pstmt.setInt(10, isActive(poll.getSdate(), poll.getEdate()));
			pstmt.executeUpdate();
			result = 1; //왜 여기서 리턴 값이 있어야 할까 입력부분인데
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("투표 정보 입력 오류");
		}
		return result;
	}
	
	public String addZero(String insert) {
		if(insert.length() == 1) return "0" + insert;
		return insert;
	}
	
	public int isActive(String start, String end) {
		int active = 0;
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHSSmm");
		Date now = new Date();
		Date sdate = null;
		Date edate = null;
		
		try {
			sdate = format.parse(start + "000000");
			edate = format.parse(end + "235959");
			
			int i = now.compareTo(sdate);
			int j = now.compareTo(edate);
			if ((i >= 0) && (j <= 0)) active = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}

		return active;
	}
	
	 public Vector<PollBean> selectAll(){
		 sql = "select num, question, active from tblpoll";
		 Vector<PollBean> pollList = new Vector<PollBean>();
		 try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					PollBean poll = new PollBean();
					poll.setNum(rs.getInt("num"));
					poll.setQuestion(rs.getString("question"));
					poll.setActive(rs.getInt("active"));
					
					pollList.addElement(poll);
				}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("투표 정보 검색 오류");
		}
		 return pollList;
	 }
}
