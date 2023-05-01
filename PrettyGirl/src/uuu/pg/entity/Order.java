package uuu.pg.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;


public class Order {
	private int id;
	private LocalDate orderDate = LocalDate.now();
	private LocalTime orderTime = LocalTime.now();
	private double paymentFee;
	private double shippingFee;
	private String paymentNote = "";
	private String shippingNote = "";
	private String recipientName;
	private String recipientEmail;
	private String recipientPhone;
	private String shippingAddress;
	private int status;
	private Customer member;
	private PaymentType paymentType;
	private ShippingType shippingType;
	private Set<OrderItem> orderItemSet = new HashSet<>();
	private double totalAmount;//資料庫sum出來的欄位
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	public LocalTime getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(LocalTime orderTime) {
		this.orderTime = orderTime;
	}

	public double getPaymentFee() {
		return paymentFee;
	}

	public void setPaymentFee(double paymentFee) {
		this.paymentFee = paymentFee;
	}

	public double getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
	}

	public String getPaymentNote() {
		return paymentNote;
	}

	public void setPaymentNote(String paymentNote) {
		this.paymentNote = paymentNote;
	}

	public String getShippingNote() {
		return shippingNote;
	}

	public void setShippingNote(String shippingNote) {
		this.shippingNote = shippingNote;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRecipientEmail() {
		return recipientEmail;
	}

	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Customer getMember() {
		return member;
	}

	public void setMember(Customer member) {
		this.member = member;
	}

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	public ShippingType getShippingType() {
		return shippingType;
	}

	public void setShippingType(ShippingType shippingType) {
		this.shippingType = shippingType;
	}
	
	//集合類別的屬性:OrderItemSet之accessors
	public Set<OrderItem> getOrderItemSet() {
		return new HashSet<>(orderItemSet);
	}
	 
	public int size() {
		return orderItemSet.size();
	}
	
	public int getTotalQuantity() {
		int sum=0;
		if(orderItemSet==null || orderItemSet.size()==0) return sum;
		for(OrderItem orderItem:orderItemSet) {
			sum += orderItem.getQuantity();
		}
		return sum;
	}
	public double getTotalAmount() { //derived attribute
		double sum = 0;
		if(orderItemSet==null || orderItemSet.size()==0) return totalAmount;//須由DAO從資料庫欄位撈出來放進來
		for(OrderItem orderItem:orderItemSet) {
			sum += orderItem.getPrice() * orderItem.getQuantity();
		}
		return sum;
		
	}
	
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	//集合類別的屬性:OrderItemSet之mutators
	public void add(ShoppingCart cart) { //還沒有訂單，結帳時controller將session中的購物車倒進來變成訂單中的明細OrderItem使用
		if(cart!=null && cart.size()>0) {
			for(CartItem cartItem:cart.getCartItemSet()) {
				OrderItem orderItem = new OrderItem();
				orderItem.setProduct(cartItem.getProduct());
				orderItem.setColor(cartItem.getColor());
				orderItem.setSize(cartItem.getSize());
				orderItem.setPrice(cart.getUnitPrice(cartItem));
				orderItem.setQuantity(cart.getQuantity(cartItem));
				
				orderItemSet.add(orderItem);
			}
		}
	}
	
	public void add(OrderItem orderItem) {//給OrdersDAO查詢資料庫的訂單明細時使用
		orderItemSet.add(orderItem);
	}
	
	@Override
	public String toString() {
		return "Order [編號=" + id + ", 日期時間=" + orderDate + " " + orderTime + ",\n"
				+ " 付款方式=" + paymentType + ", 貨運方式=" + shippingType+ ",\n"
				+ " paymentFee=" + paymentFee + ", shippingFee=" + shippingFee + ",\n"
				+ " paymentNote=" + paymentNote + ", shippingNote=" + shippingNote + ",\n"
				+ " 收件人=" + recipientName + ", " + recipientEmail + ", " + recipientPhone + ", " + shippingAddress + ",\n"
				+ " 處理狀態=" + status
				+ ", 訂購人=" + member + ",\n"				
				+ " 明細=" + orderItemSet + ",\n"
				+ " 共" + size() + "項, " + getTotalQuantity()+ "件, 總金額=" + getTotalAmount();
	}
	
	
	
}
 
