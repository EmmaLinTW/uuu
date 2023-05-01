package uuu.pg.entity;

public class Color {
	private String colorName;
	private String photoUrl;
	private String coloricon;
	private Size size;
	private int stock;
	
	
	
	public Size getSize() {
		return size;
	}
	public void setSize(Size size) {
		this.size = size;
	}
	public String getColoricon() {
		return coloricon;
	}
	public void setColoricon(String coloricon) {
		this.coloricon = coloricon;
	}
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	@Override
	public String toString() {
		
		return 
				"顏色:"+colorName+"\n"+"圖片: "+photoUrl+"\n"+"尺寸:"+size+"庫存:"+stock+"個"+"\n"+"小圖"+coloricon;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((colorName == null) ? 0 : colorName.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Color other = (Color) obj;
		if (colorName == null) {
			if (other.colorName != null)
				return false;
		} else if (!colorName.equals(other.colorName))
			return false;
		return true;
	}
	
	
	
}
