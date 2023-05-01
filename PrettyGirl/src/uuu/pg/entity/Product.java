package uuu.pg.entity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import uuu.pg.entity.Color;

public class Product {

	private int id;//Pkey, required, Auto-increment
	private String name;//required
	private double unitPrice;//required,售價即定價
	private int stock;//required
	private String photoUrl;
	private String description;
	private String[] colors;
	private String type;
	private String category;
	private ProductPhotos productphotos;
	
	private Map<Size, Double> map = new TreeMap<>();
	
	//mutator(s)
	public void addSizePrice(Size size, double price) {
		map.put(size, price);
	}
	
	//accesser(s)
	public Set<Size> getSizeSet(){
		return map != null? new TreeSet<>(map.keySet()):null;
	}
	
	public double getSizePrice(Size size) {
			return map.get(size);
	}
	
//	public double getSizePrice(Size size) {
//		Double price = map.get(size);
//		if(price != null) {
//			return price;
//		}else {
//			return this.unitPrice;
//		}
//	}
	
	
	private List<Color> colorsList=new ArrayList<>();
	//mutator(s)
	public void addColor(Color color) {
		if(color!=null) {
			colorsList.add(color);
		}
	}
	//accesser(s)	
	public List<Color> getColorsList() {		
		//return Collections.unmodifiableList(colorsList);//回傳colorList之不可變更的正本
		return colorsList!=null?new ArrayList<>(colorsList):null; //回傳colorList複本
	}	

	public Color getColor(String colorName) {
		if(colorsList!=null && colorsList.size()>0) {
			for(Color color:colorsList) {
				if(color.getColorName().equals(colorName)) {
					return color; 
				}
			}
		}
		return null;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getUnitPrice() { //查詢售價,查詢定價
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	public String[] getColors() {
		return colors;
	}
	public void setColors(String[] colors) {
		this.colors = colors;
	}
	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public Product clone() {
		Product p = new Product();
		p.setId(this.id);
		p.setName(name);
		p.setUnitPrice(unitPrice);
		return p;
	}
	
	@Override
	protected void finalize() throws Throwable {		
		System.out.println("Bye");//ignored
	}
	
	@Override
	public String toString() {
		return this.getClass().getName()
				+ "\n" +" [id=" + id 
				+ "\n" +" name=" + name 
				+ "\n" +" unitPrice=" + unitPrice
				+ "\n" +" stock=" + stock 
				+ "\n" +" photoUrl="+ photoUrl 
				+ "\n" +" description="+ description 
				+ "\n" +" type="+ type 
				+ "\n" +" productPhotos="+ productphotos 
				+ "\n" +" map="+  map
				//+ "\n" +" size="+ size 
				+ "\n" +" colors=" + colorsList + "]";
	}
	
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
//		result = prime * result + ((name == null) ? 0 : name.hashCode());
//		long temp;
//		temp = Double.doubleToLongBits(unitPrice);
//		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Product))
			return false;
		Product other = (Product) obj;
		if (id != other.id)
			return false;
//		if (name == null) {
//			if (other.name != null)
//				return false;
//		} else if (!name.equals(other.name))
//			return false;
//		if (Double.doubleToLongBits(unitPrice) != Double.doubleToLongBits(other.unitPrice))
//			return false;
		return true;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public ProductPhotos getProductphotos() {
		return productphotos;
	}
	public void setProductphotos(ProductPhotos productphotos) {
		this.productphotos = productphotos;
	}
	
	
	
//	@Override
//	public int hashCode() {
//		
//		return this.id
//				+(this.name!=null?this.name.hashCode():0)
//				+new Double(this.unitPrice).hashCode();
//		
//	}
//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj) return true;
//		if(obj instanceof Product) {
//			Product p = (Product)obj;
//			if(this.id == p.id
//				&& this.name != null && this.name.equals(p.name)
//				&& this.unitPrice==(p.unitPrice)
//				) return true;
//		}
//		
//		return false;
//	}
	
	
	
	
}
