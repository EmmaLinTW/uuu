package uuu.pg.entity;

public class Outlet extends Product {
	private int discount;

	public int getDiscount() {
		return discount; //n% off
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getDiscountString() {
		 int discount = 100-this.discount;
		
		if(discount%10==0) {
			discount = discount/10;
		}
		
		return discount+"折";
		
	}
	
	
	
	@Override
	public double getUnitPrice() { //查詢售價
		return super.getUnitPrice() * (100-discount)/100;
	}
	
	
	

	@Override
	public double getSizePrice(Size size) {
		return super.getSizePrice(size)* (100-discount)/100;
	}

	/*
	/**
	 * @return
	 * @deprecated 請改用UnitPrice()
	 
	@Deprecated
	public double getUnitprice(){
		return getUnitPrice();
	}
	*/
	public double getListPrice() { //查詢定價
		return super.getUnitPrice();
	}
	public double getSzieListPrice(Size size) { //查詢定價
		return super.getSizePrice(size);
	}

	@Override
	public String toString() {
		return super.toString() 
				+ "\n"+ " discount=" + discount +"%off"
				+ "\n"+" "+ getDiscountString() 
				+ "\n"+" getUnitPrice()售價="+ getUnitPrice();
	}
	
	
	
}
