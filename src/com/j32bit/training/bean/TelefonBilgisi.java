package com.j32bit.training.bean;

public class TelefonBilgisi {

	private String ID;
	private String Telefon;
	
	
	public void setTelefon(String Telefon){
		this.Telefon=Telefon;
	}
	
	public String getTelefon(){
		return this.Telefon;
	}
	
	public void setID(String ID){
		this.ID=ID;
	}
	
	public String getID(){
		return this.ID;
	}
	
}
