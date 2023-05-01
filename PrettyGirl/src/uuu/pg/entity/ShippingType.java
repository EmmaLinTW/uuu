package uuu.pg.entity;

public enum ShippingType {
	SHOP("門市取貨"), 
	HOME("送貨到府",50), 
	STORE("超商取貨",60);
	
	private final String description;
	private final double fee;	
	
	private ShippingType(String description) {
		this(description, 0);
	}
	
	private ShippingType(String description, double fee) {
		this.description = description;
		this.fee = fee;
	}
	
	public String getDescription() {
		return description;
	}
	public double getFee() {
		return fee;
	}

	@Override
	public String toString() {		
		return this.description + (this.fee>0?("-" + this.fee + "元"):"");
	}	
}
