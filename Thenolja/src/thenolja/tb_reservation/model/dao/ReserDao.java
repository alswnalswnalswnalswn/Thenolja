package thenolja.tb_reservation.model.dao;

import static thenolja.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import thenolja.tb_coupon.model.vo.Coupon;
import thenolja.tb_reservation.model.vo.Reservation;

public class ReserDao {
	
	private Properties prop = new Properties();
	
	public ReserDao() {
		String fileName = ReserDao.class.getResource("/sql/tb_reservation/reser-mapper.xml").getPath();
		
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
			pstmt.setString(1, reser.getName());
			pstmt.setString(2, reser.getPhone());
			pstmt.setString(3, reser.getBicycle());
			pstmt.setString(4, reser.getPayment());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Coupon> selectCoupon(Connection conn) {
		
		ArrayList<Coupon> list = new ArrayList();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Coupon c = new Coupon();
				c.setCouponNo(rset.getInt("COUPON_NO"));
				c.setCouponContent(rset.getString("COUPON_CONTENT"));
				c.setCouponDate(rset.getDate("COUPON_DATE"));
				c.setCouponYN(rset.getString("COUPON_YN"));
				c.setCouponCode(rset.getString("COUPON_CODE"));
				
				list.add(c);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
