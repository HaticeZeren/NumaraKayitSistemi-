package DAO;

import java.util.List;

import com.j32bit.training.bean.KisiBilgisi;
import com.j32bit.training.bean.TelefonBilgisi;

public interface IPersonDao {

	List<KisiBilgisi> getKisiListesi();
	List<TelefonBilgisi> getTelefonListesi();
	List<TelefonBilgisi> getKisiTelefonlar(String KisiID);
	KisiBilgisi getKisiBilgi(String id);
	TelefonBilgisi getTelefonBilgi(String TelefonNum);
	
	
	void kisiKayit(String ID,String isim,String Soyisim);
	void yetkilendirme(String ID);
    void kisiKayitSil(String ID);
    void telEkle(String ID,String Telefon);
    void tumTelSil(String ID);
    void telSil(String Telefon);
    void kisiGuncelle(String ID,String isim,String Soyisim);
    void telGuncelle(String EskiTelefon,String YeniTelefon);
	void yetkilendirmeSil(String ID);
}
