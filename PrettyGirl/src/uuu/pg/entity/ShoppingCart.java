package uuu.pg.entity;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import uuu.pg.entity.CartItem;
import uuu.pg.entity.Color;
import uuu.pg.entity.Product;
import uuu.pg.entity.Outlet;
import uuu.pg.entity.VIP;

public class ShoppingCart {
	public static final NumberFormat PRICE = new DecimalFormat("0.0#");	
	public static final NumberFormat AMOUNT = new DecimalFormat("0");
	private Customer member;
	private Map<CartItem, Integer> cart = new HashMap<>();
		
	public Customer getMember() {
		return member;
	}
	public void setMember(Customer member) {
		this.member = member;
	}
	
	//mutator(s)
		public void add(Product p, String colorName, String sizeName, int quantity) {
			if(p==null) {
				throw new IllegalArgumentException("加入購物車時，產品不得為null");
			}
			Color color = p.getColor(colorName);
			Size size = Size.valueOf(sizeName);
			CartItem item = new CartItem();
			item.setProduct(p);
			item.setColor(color);
			item.setSize(size);
			
			Integer oldQty = cart.get(item);//Integer參考型別null指派給他不會當掉
			if(oldQty==null) {
				cart.put(item,quantity);
			}else {
				cart.put(item,oldQty+quantity);//cart.put原本沒有是新增，已經有是修改
			}
		}
		
		public void update(CartItem item, int quantity) {
			if(item==null) {
				throw new IllegalArgumentException("修改購物車時，item不得為null!");
			}
			cart.put(item, quantity);
		}
		
		public Integer remove(CartItem item) {
			return cart.remove(item);
		}
		
	//accessor(s)
		public int size() {
			return cart.size();
		}
		
		
		public Set<CartItem> getCartItemSet() {
		return cart.keySet();
		}
		
		public Integer getQuantity(CartItem item) {
			return cart.get(item);
		}
		
		public double getListPrice(CartItem item) {
			Product p = item.getProduct();
			Size size = item.getSize();
			if(p instanceof Outlet) {
				return ((Outlet)p).getSzieListPrice(size); 
			}else {
				return p.getSizePrice(size);
			}
		}
		
		public String getDiscountString(CartItem item) {
			Product p = item.getProduct();
			if(p instanceof Outlet) {
				return ((Outlet)p).getDiscountString();
			}else if(!(p instanceof Outlet) && member instanceof VIP) {
				return "VIP " + ((VIP)member).getDiscountString();
			}else {
				return "";
			}
		}
		
//		public double getUnitPrice(CartItem item) {	
//			Product p = item.getProduct();
//			double price = item.getProduct().getUnitPrice();
//			if(!(p instanceof Outlet) && member instanceof VIP) {
//				price = price * (100-((VIP)member).getDiscount())/100 ;
//			}
//			return price;
//		}
		
		public double getUnitPrice(CartItem item) {
			Product p = item.getProduct();
			Size size = item.getSize();
			double price = p.getSizePrice(size);
			if(!(p instanceof Outlet) && member instanceof VIP){
					price = price * (100-((VIP)member).getDiscount())/100 ;
			}
			return price;
		}
		
		public int getTotalQuantity() {
			int sum=0;
			for(Integer qty:cart.values()) {
				if(qty!=null) {
					sum=sum+qty;
				}
			}
			return sum;
		}
		
		public double getTotalAmount() {
			double sum =0;
			for(CartItem item:cart.keySet()){
				Size size = item.getSize();
				if(item!=null) {
					sum += item.getProduct().getSizePrice(size) * cart.get(item);
				}
			}
			
			return sum;
		}
		
		public double getSubAmount(CartItem item) {
			return this.getUnitPrice(item)*this.getQuantity(item);
		}
		
		public double getVIPTotalAmount() {
			double sum=0;
			if(member instanceof VIP) {
				for(CartItem item:cart.keySet()) {
					sum = sum + this.getUnitPrice(item)* this.getQuantity(item);
				}
			}else {
				sum = getTotalAmount();
			}
			
			return sum;
		}
		
		@Override
		public String toString() {
			return "ShoppingCart [member=" + member 
					+ ", cart=" + cart 
					+ "\n共" + size() + "項" 
					+ "," + getTotalQuantity() + "件"
					+ "," + getTotalAmount() + "元"
					+ "]";
		}
	
}
