package thenolja.tb_reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static thenolja.common.JDBCTemplate.*;

import thenolja.tb_reservation.model.vo.Reservation;

public class ReserDao {
	
	private Properties prop = new Properties();
	
	public ReserDao() {
		String fileName = ReserDao.class.getResource("/sql/Reservation/reser-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertReser(Connection conn, Reservation reser) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reser.getBicycle());
			pstmt.setInt(2, reser.getPeople());
			pstmt.setInt(3, reser.getRoomNo());
			pstmt.setString(4, reser.getCheckIn());
			pstmt.setString(5, reser.getCheckOut());
			pstmt.setString(6, reser.getPayment());
			pstmt.setInt(7, reser.getPaymentPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
