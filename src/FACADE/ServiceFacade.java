package FACADE;

import java.util.List;

import com.j32bit.training.bean.KisiBilgisi;
import com.j32bit.training.bean.TelefonBilgisi;

import DAO.IPersonDao;
import KayitSistemi.PersonDAO;

public class ServiceFacade {

	private static ServiceFacade instance = null;
	private static IPersonDao personDAOImpl=null;

	private ServiceFacade() {

	}

	public static ServiceFacade getFacade() {

		if (instance == null) {
			instance = new ServiceFacade();
		}
		return instance;
	}

	public List<KisiBilgisi> getKisiListesi() {
		return personDAOImpl.getKisiListesi();
	}

	public List<TelefonBilgisi> getTelefonListesi() {

		return personDAOImpl.getTelefonListesi();
	}

	public List<TelefonBilgisi> getKisiTelefonlar(String KisiID) {

		return personDAOImpl.getKisiTelefonlar(KisiID);
	}

	public KisiBilgisi getKisiBilgisi(String id) {

		return personDAOImpl.getKisiBilgi(id);
	}

	public void kisiKayit(String ID, String isim, String Soyisim) {

		personDAOImpl.kisiKayit(ID, isim, Soyisim);
	}

	public void kisiKayitSil(String ID) {

		personDAOImpl.kisiKayitSil(ID);
	}

	public void telEkle(String ID, String Telefon) {

		personDAOImpl.telEkle(ID, Telefon);
	}

	public void telSil(String Telefon) {

		personDAOImpl.telSil(Telefon);
	}

	public void kisiGuncelle(String ID, String isim, String Soyisim) {

		personDAOImpl.kisiGuncelle(ID, isim, Soyisim);
	}

	public void telGuncelle(String EskiTelefon, String YeniTelefon) {

		personDAOImpl.telGuncelle(EskiTelefon, YeniTelefon);
	}

	public void tumTelSil(String ID) {

		personDAOImpl.tumTelSil(ID);
	}
	public void yetkilendirme(String ID){
		personDAOImpl.yetkilendirme(ID);
	}
	public void yetkilendirmeSil(String ID){
		personDAOImpl.yetkilendirmeSil(ID);
	}
	public void start(String datasource) {
		personDAOImpl= new PersonDAO(datasource);
	}

	
	
}
