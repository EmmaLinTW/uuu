package uuu.pg.entity;

import java.util.Arrays;

public enum PaymentType {
	SHOP("門市付款", new ShippingType[]{ShippingType.SHOP}), 
	ATM("ATM轉帳", new ShippingType[]{ShippingType.HOME, ShippingType.STORE}),
	HOME("貨到付款",100, ShippingType.HOME), 
	STORE("超商付款", ShippingType.STORE),
	CARD("信用卡付款", ShippingType.HOME, ShippingType.STORE);
	
	private final String description;
	private final double fee;	
	private final ShippingType[] shippingTypeArray;
	
	private PaymentType(String description, ShippingType... shippingTypeArray) {
		this(description,0,shippingTypeArray);
	}

	private PaymentType(String description, double fee, 
			ShippingType... shippingTypeArray) {
		this.description = description;
		this.fee = fee;
		this.shippingTypeArray = shippingTypeArray;
	}
	
	public String getDescription() {
		return description;
	}
	public double getFee() {
		return fee;
	}

	public ShippingType[] getShippingTypeArray() {		
		return shippingTypeArray!=null?shippingTypeArray.clone():null;
	}
	
	public String getShippingTypeArrayString() {
		String rtn = "";
		for(int i=0;i<shippingTypeArray.length;i++) {
			ShippingType shType = shippingTypeArray[i];
			rtn += shType.name();
			if(i<shippingTypeArray.length-1) {
				rtn += ",";
			}
		}
		return rtn;
	}

	@Override
	public String toString() {		
		return this.description + (this.fee>0?("-" + this.fee + "元"):"");
	}
}
