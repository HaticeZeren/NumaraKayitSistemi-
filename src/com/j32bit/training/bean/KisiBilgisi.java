package com.j32bit.training.bean;

public class KisiBilgisi {

	private String ID;
	private String Isim;
	private String Soyisim;
	
	public String getIsim(){
		return this.Isim;
	}
	public void setIsim(String Isim){
		 this.Isim=Isim;
	}
	
	public String getSoyisim(){
		return this.Soyisim;
	}
	
	public void setSoyisim(String Soyisim){
		this.Soyisim=Soyisim;
	}
	
	public String getID(){
		return this.ID;
	}
	
	public void setID(String ID){
		this.ID=ID;
	}
	
	
}
