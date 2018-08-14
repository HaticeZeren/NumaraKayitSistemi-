package KayitSistemi;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.j32bit.training.bean.KisiBilgisi;
import com.j32bit.training.bean.TelefonBilgisi;

import FACADE.ServiceFacade;

public class DatabaseFunction extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
		if(request.getParameter("action")!=null) {
		if(request.getParameter("action").equals("Add")){
			//int KisiID=Integer.parseInt();
			String isim=request.getParameter("firstName");
			String soyisim=request.getParameter("lastName");
			String telefon=request.getParameter("telephone");
			//if(SingletonIslemler.getIslemler().addPerson(KisiID, isim, soyisim,telefon)) System.out.println("Kisi Eklendi");
			//else System.out.println("Kisi Eklenemedi");
		   if(ServiceFacade.getFacade().getKisiBilgisi(request.getParameter("id"))==null){
			    ServiceFacade.getFacade().kisiKayit(request.getParameter("id"), isim, soyisim);
			    if(!telefon.isEmpty()) ServiceFacade.getFacade().telEkle(request.getParameter("id"), telefon);
		       ServiceFacade.getFacade().yetkilendirme(request.getParameter("id"));
		   }
		   
			
		}

		else if(request.getParameter("action").equals("Delete")){
			//int KisiID=Integer.parseInt(request.getParameter("id"));
			 // SingletonIslemler.getIslemler().deletePerson(KisiID);
			ServiceFacade.getFacade().tumTelSil(request.getParameter("id"));
			ServiceFacade.getFacade().kisiKayitSil(request.getParameter("id"));
			ServiceFacade.getFacade().yetkilendirmeSil(request.getParameter("id"));

		}

		else if(request.getParameter("action").equals("TelEkle")){
			//int KisiID=Integer.parseInt(request.getParameter("id"));
		   // SingletonIslemler.getIslemler().addTelephone(KisiID, request.getParameter("telefon"));
       ServiceFacade.getFacade().telEkle(request.getParameter("id"), request.getParameter("telefon"));
		}

		else if(request.getParameter("action").equals("TelDelete")){
			//SingletonIslemler.getIslemler().delTelephone(request.getParameter("telefonNum"));
		  ServiceFacade.getFacade().telSil(request.getParameter("telefonNum"));
		}

		else if(request.getParameter("action").equals("KisiGuncelle")){
			//int KisiID=Integer.parseInt(request.getParameter("id"));
			ServiceFacade.getFacade().kisiGuncelle(request.getParameter("id"), request.getParameter("isim"), request.getParameter("soyisim"));
			//SingletonIslemler.getIslemler().updatePerson(KisiID, request.getParameter("isim"),request.getParameter("soyisim"));
		}

		else if(request.getParameter("action").equals("TelGuncelle")){
			//SingletonIslemler.getIslemler().updateTel(request.getParameter("yenitel"), request.getParameter("eskitel"));
           ServiceFacade.getFacade().telGuncelle(request.getParameter("eskitel"), request.getParameter("yenitel"));
		}
		}else System.out.print("action:"+request.getParameter("action"));

	}

	}

