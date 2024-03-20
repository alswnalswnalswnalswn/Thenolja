package thenolja.admin.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import thenolja.admin.member.model.dao.MemberDao;
import thenolja.admin.member.model.vo.Member;
import thenolja.common.JDBCTemplate;

public class MemberService {

	public ArrayList<Member> selectMemberList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;	
		
	}
	
}
