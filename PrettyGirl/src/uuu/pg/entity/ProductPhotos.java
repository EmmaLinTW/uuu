package uuu.pg.entity;

public class ProductPhotos {
	private int product_id;
	private String photo1;
	private String photo2;
	private String photo3;
	private String photo4;
	private String photo5;
	private String photo6;
	
	
	public String getPhoto(int i) {
		switch(i) {
		default:return photo1;
		case 2:return photo2;
		case 3:return photo3;
		case 4:return photo4;
		case 5:return photo5;
		case 6:return photo6;
		}
		
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public String getPhoto2() {
		return photo2;
	}
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	public String getPhoto3() {
		return photo3;
	}
	public void setPhoto3(String photo3) {
		this.photo3 = photo3;
	}
	public String getPhoto4() {
		return photo4;
	}
	public void setPhoto4(String photo4) {
		this.photo4 = photo4;
	}
	public String getPhoto5() {
		return photo5;
	}
	public void setPhoto5(String photo5) {
		this.photo5 = photo5;
	}
	public String getPhoto6() {
		return photo6;
	}
	public void setPhoto6(String photo6) {
		this.photo6 = photo6;
	}
	@Override
	public String toString() {
		return "ProductPhotos [product_id=" + product_id + ", photo1=" + photo1 + ", photo2=" + photo2 + ", photo3="
				+ photo3 + ", photo4=" + photo4 + ", photo5=" + photo5 + ", photo6=" + photo6 + "]";
	}

	
	
	
	
	
}
