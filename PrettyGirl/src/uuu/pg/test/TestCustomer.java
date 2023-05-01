package uuu.pg.test;

import uuu.pg.entity.Customer;
import uuu.pg.entity.VIP;

public class TestCustomer {

	public static void main(String[] args) {
		Customer c = new Customer();
		
		//test birthday
		c.setBirthday(1990, 11, 29);
		System.out.println("age: "+c.getAge());
		
		c.setBirthday("1990-11-16");//"iso 8601"字串，記得""
		System.out.println("age: "+c.getAge());
		
		//c.birthday = LocalDate.of(2022,11,2);//屬性是public才可以直接改屬性，否則都要call方法(setter)
		//System.out.println("age: "+c.getAge());
		
		c.setBirthday(2022,11,12);
		
		c.setEmail("test@");
		
		c.setId("A123434");
		
		System.out.println(c);
		
		Customer c1 = new Customer("A123456789","123456","張三豐");
		Customer c2 = new Customer("A123456789","123456","張三豐");
		System.out.println("c2==c1: "+(c2==c1));
		System.out.println(c2.equals(c1));
		System.out.println(c2.equals(null));
		
		System.out.println("c1.hashCode()==c2.hashCode()"+(c1.hashCode()==c2.hashCode()));
		
		VIP v = new VIP();
		v.setId("A123456789");
		System.out.println(v.equals(c1));
		
		VIP v2 = new VIP("A123456789", "123456", "張三");
		System.out.println(v2.equals(c1));
	}

}
