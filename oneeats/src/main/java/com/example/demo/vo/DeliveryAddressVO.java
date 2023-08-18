package com.example.demo.vo;

import org.springframework.stereotype.Component;

@Component("deliveryAddressVO")
public class DeliveryAddressVO {
	private String reciever_name;
	private String reciever_phone;
	private String zipCode;
	private String address;
	private String address_detail;
	public String getReciever_name() {
		return reciever_name;
	}
	public void setReciever_name(String reciever_name) {
		this.reciever_name = reciever_name;
	}
	public String getReciever_phone() {
		return reciever_phone;
	}
	public void setReciever_phone(String reciever_phone) {
		this.reciever_phone = reciever_phone;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	@Override
	public String toString() {
		return "DeliveryAddressVO [reciever_name=" + reciever_name + ", reciever_phone=" + reciever_phone + ", zipCode="
				+ zipCode + ", address=" + address + ", address_detail=" + address_detail + "]";
	}
	
	
}
