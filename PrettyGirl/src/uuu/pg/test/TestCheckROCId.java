package uuu.pg.test;

import java.util.Scanner;

public class TestCheckROCId {

	public static void main(String[] args) {
		System.out.println("請輸入身分證號:");
		Scanner scanner = new Scanner(System.in);
		String id = scanner.next();
		
//		String id = "A123456789";
		
		String firstCharSeq = "ABCDEFGHJKLMNPQRSTUVXYWZIO";
		
		if(id != null && id.matches("[A-Z][12][0-9]{8}")) {
			//將第一個字元傳為對應的數字
			char firstChar = id.charAt(0);
			int firstNum = firstCharSeq.indexOf(firstChar)+10;
			System.out.println(firstChar + "->" + firstNum);
			
			//2.依公式計算
			int sum = firstNum/10*1 + firstNum%10*9; //;
			System.out.println("sum:" + sum);
			
			for(int i=1;i<9;i++) {
				int n =  (id.charAt(i)-'0'); //block variable
				System.out.println("n: "+ n);
				sum = sum + (id.charAt(i)-'0')*(9-i);
			}
			sum = sum + (id.charAt(9)-'0')*1;
			
			//3.將結果%10為0即是正確的身分證號
			if(sum%10 == 0) {
				System.out.println("OK");
			}else {
				System.out.println("不符合規則");
			}
			
		}else {
			System.out.println("格式錯誤");
		}
		

	}

}
