package uuu.pg.entity;

public class VIP extends Customer {
	
	private int discount=10; //10%off, 9折

	
	public VIP() {
		super();
	}
	
	
	
	public VIP(String id, String password, String name) {
		super(id, password, name);
	}

	public VIP(String id, String password, String name, int discount) {
		super(id, password, name);
		this.setDiscount(discount);
	}



	public int getDiscount() {
		return discount;
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
	public String toString() {
		return super.toString()
				+ "\n" + " discount=" + discount + "%off" 
				+ "\n" +" "+getDiscountString(); 
	}
	
	
	
	
}
