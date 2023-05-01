package uuu.pg.test;

import java.util.Scanner;

import uuu.pg.entity.Customer;

public class TestCustomerCheckId {

	public static void main(String[] args) {
		System.out.println("請輸入身分證號:");
		Scanner scanner = new Scanner(System.in);
		String id = scanner.next();
		
		System.out.println(id);
		
		Customer c = new Customer();
		
		System.out.println(c.checkId(id));
		

	}

}
