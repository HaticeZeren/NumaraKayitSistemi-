package KayitSistemi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.j32bit.training.bean.KisiBilgisi;
import com.j32bit.training.bean.TelefonBilgisi;

import DAO.BaseDAO;
import DAO.IPersonDao;

public class PersonDAO extends BaseDAO implements IPersonDao {
	
	 Connection conn;
	 ResultSet rs;
	 PreparedStatement psmt;
	 
	 
      public PersonDAO(String datasource) {
      super(datasource);
	    conn=null;
	    rs=null;
	    psmt=null;
       }
      
      
	@Override
	public List<KisiBilgisi> getKisiListesi() {
		
		List<KisiBilgisi> liste = new ArrayList<KisiBilgisi>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM Kisiler");
			rs = psmt.executeQuery();
			
			KisiBilgisi veri = null;
			while (rs.next()) {
				veri = new KisiBilgisi();
				veri.setID(rs.getString("idKisiler"));
				veri.setIsim(rs.getString("Isim"));
				veri.setSoyisim(rs.getString("Soyisim"));
				liste.add(veri);
			}
			rs.close();
			psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
		return liste;
	}

	@Override
	public List<TelefonBilgisi> getTelefonListesi() {
		List<TelefonBilgisi> liste = new ArrayList<TelefonBilgisi>();

		try {
			TelefonBilgisi veri = null;
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM telefonlar");
			rs = psmt.executeQuery();

			while (rs.next()) {
				veri = new TelefonBilgisi();
				veri.setID(rs.getString("kisiID"));
				veri.setTelefon(rs.getString("telefonNum"));
				liste.add(veri);
			}
			psmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally {
			closeConnection(conn);
		}
		return liste;
	}

	@Override
	public List<TelefonBilgisi> getKisiTelefonlar(String KisiID) {
		List<TelefonBilgisi> liste = new ArrayList<TelefonBilgisi>();

		try {
			TelefonBilgisi veri = null;
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM telefonlar WHERE kisiID=?");
			psmt.setString(1, KisiID);
			rs = psmt.executeQuery();

			while (rs.next()) {
				veri = new TelefonBilgisi();
				veri.setID(rs.getString("kisiID"));
				veri.setTelefon(rs.getString("telefonNum"));
				liste.add(veri);
			}
			
			rs.close();
			psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
		return liste;
	}

	@Override
	public KisiBilgisi getKisiBilgi(String id) {
		KisiBilgisi veri = null;

		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM Kisiler WHERE idKisiler=?");
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				veri = new KisiBilgisi();
				veri.setID(rs.getString("idKisiler"));
				veri.setIsim(rs.getString("Isim"));
				veri.setSoyisim(rs.getString("Soyisim"));
			}
			rs.close();
			psmt.close();

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}

		return veri;
	}

	@Override
	public TelefonBilgisi getTelefonBilgi(String TelefonNum) {

		return null;
	}

	@Override
	public void kisiKayit(String ID, String isim, String Soyisim) {
		 try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into Kisiler(idKisiler,Isim,Soyisim) values(?,?,?)");
			psmt.setString(1, ID);
			psmt.setString(2, isim);
			psmt.setString(3, Soyisim);
			psmt.executeUpdate();
			//System.out.println("psmt.executeUpdate():" + psmt.executeUpdate());
			psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				closeConnection(conn);
			}
		}

	}

	@Override
	public void kisiKayitSil(String ID) {
		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from Kisiler WHERE idKisiler=?");
			psmt.setString(1, ID);
			psmt.executeUpdate();

			/// veritabani islemleri
			psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				closeConnection(conn);
			}
		}

	}

	@Override
	public void telEkle(String ID, String Telefon) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into  telefonlar(kisiID,telefonNum) values(?,?)");
			psmt.setString(1, ID);
			psmt.setString(2, Telefon);
			psmt.executeUpdate();

			/// veritabani islemleri
			psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}

	}

	@Override
	public void telSil(String Telefon) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from telefonlar  WHERE telefonNum=?");
			psmt.setString(1, Telefon);
			psmt.executeUpdate();

			/// veritabani islemleri
			psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}

	}

	@Override
	public void kisiGuncelle(String ID, String isim, String Soyisim) {
	
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update Kisiler set Isim=?,Soyisim=? where idKisiler=?");
			psmt.setString(1, isim);
			psmt.setString(2, Soyisim);
			psmt.setString(3, ID);
			psmt.executeUpdate();

			/// veritabani islemleri
			psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}

	}

	@Override
	public void telGuncelle(String EskiTelefon, String YeniTelefon) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update telefonlar set telefonNum=? where telefonNum=?");
			psmt.setString(1, YeniTelefon);
			psmt.setString(2, EskiTelefon);
			psmt.executeUpdate();

			/// veritabani islemleri
			psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}

	}

	@Override
	public void tumTelSil(String ID) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from telefonlar  WHERE kisiID=?");
			psmt.setString(1, ID);
			psmt.executeUpdate();

			/// veritabani islemleri
			psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}

	}


	@Override
	public void yetkilendirme(String ID) {
	   try {
	    conn=getConnection();
		psmt = conn.prepareStatement("INSERT INTO tomcat_users(user_name, password) VALUES(?,?)");
		psmt.setString(1,ID);
		psmt.setString(2,ID);
		psmt.executeUpdate();
		
		psmt=conn.prepareStatement("INSERT INTO tomcat_users_roles(user_name, role_name) VALUES(?,?)");
		psmt.setString(1,ID);
		psmt.setString(2,"user");
		psmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		closeConnection(conn);
	}

	}


	@Override
	public void yetkilendirmeSil(String ID) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from tomcat_users_roles where  user_name=?");
			psmt.setString(1,ID);
			psmt.executeUpdate();
			
			psmt = conn.prepareStatement("delete from tomcat_users where user_name=?");
			psmt.setString(1,ID);
			psmt.executeUpdate();

			/// veritabani islemleri
			psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
		
	}

}
