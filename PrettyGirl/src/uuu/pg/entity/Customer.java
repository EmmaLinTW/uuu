package uuu.pg.entity;

import java.time.LocalDate;
import java.time.Period;

import uuu.pg.entity.PGDataInvalidException;

public class Customer {

	public final static char MALE='M';
	public final static char FEMALE='F';
	public final static int PWD_MIN_LENGTH = 6;
	public final static int PWD_MAX_LENGTH = 20;
	
	private String id;//Pkey,required,ROC身分證號
	private String password;//required,必須是6~20字元
	private String email;//uniqKey,required
	private char gender;//required,M:male, F:female
	private String name;//required
	private LocalDate birthday;//required,JDK8
	private String phone;//非必要,optional
	private String address;//optional
	private boolean married;//optional
	
	public Customer() {
		
	}
	
	public Customer(String id, String password, String name) {
		
		this.setId(id);
		this.setPassword(password);
		this.setName(name);
	}
	
	public String getId() {
		return id;
	}
	
	private static final String ROC_ID_SEQ = "ABCDEFGHJKLMNPQRSTUVXYWZIO";
	private static final String ROC_ID_FORMAT = "[A-Z][12][0-9]{8}";
	public boolean checkId(String id) {
		String firstCharSeq = ROC_ID_SEQ;
		if(id != null && id.matches(ROC_ID_FORMAT)) {
			//將第一個字元傳為對應的數字
			char firstChar = id.charAt(0);
			int firstNum = firstCharSeq.indexOf(firstChar)+10;
			//System.out.println(firstChar + "->" + firstNum);
			
			//2.依公式計算
			int sum = firstNum/10*1 + firstNum%10*9; //;
			//System.out.println("sum:" + sum);
			
			for(int i=1;i<9;i++) {
				//int n =  (id.charAt(i)-'0'); //block variable
				//System.out.println("n: "+ n);
				sum = sum + (id.charAt(i)-'0')*(9-i);
			}
			sum = sum + (id.charAt(9)-'0')*1;
			
			//3.將結果%10為0即是正確的身分證號
			if(sum%10 == 0) {
				//System.out.println("OK");
				return true;
			}
			
		}
			System.err.println("身分證號格式不正確");
			return false;
	}
	
	public void setId(String id) {
		if(checkId(id)) {
		this.id = id;
		}else {
			System.err.println("身分證號不正確");
		}
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		if(password != null && password.length()>=PWD_MIN_LENGTH 
				&& password.length()<=PWD_MAX_LENGTH) {
			this.password = password;
		}else {
			System.err.println("密碼長度必須為6~20個字元的密碼");
			throw new PGDataInvalidException("長度必須為6~20個字元的密碼");
		}
	}
	
	public String getEmail() {
		return email;
	}
	
	private static final String EMAIL_FORMAT ="^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
	public void setEmail(String email) {
		if(email != null && email.matches(EMAIL_FORMAT)) {
		this.email = email;
		}else {
			System.err.println("必須輸入格式正確的Email");
			throw new PGDataInvalidException("必須輸入格式正確的Email");
		}
	}
	
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		if(gender == MALE || gender == FEMALE) {
		this.gender = gender;
		}else {
			System.err.println("性別資料不正確");
			throw new PGDataInvalidException("性別資料不正確");
		}
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		if(name != null && (name=name.trim()).length()>0) {
		this.name = name;
		}else {
			System.err.println("姓名為必要欄位");
			throw new PGDataInvalidException("必須輸入姓名");
		}
	}
	
	public LocalDate getBirthday() {
		return birthday;
	}
	public void setBirthday(LocalDate birthday) {
		if(birthday != null && birthday.isBefore(LocalDate.now()) ) {
		this.birthday = birthday;
		}else {
			System.err.println("客戶生日日期必須小於今天");
			throw new PGDataInvalidException("客戶生日日期必須小於今天");
		}
	}
	public void setBirthday(int year,int month, int day) {
		LocalDate date = LocalDate.of(year,month,day);//將3個整數轉換為LocalDate物件 
		this.setBirthday(date);
//		if(date.isBefore(LocalDate.now())) {
//		this.setBirthday(date);
//		}else {
//			System.out.println("客戶生日日期必須小於今天");
//		}
	}
	public void setBirthday(String dateStr) {
		LocalDate date = LocalDate.parse(dateStr);////將符合iso8601的日期字串轉換為LocalDate物件
		this.setBirthday(date);
//		if(date.isBefore(LocalDate.now())) {
//		this.setBirthday(date);
//		}else {
//			System.out.println("客戶生日日期必須小於今天");
//		}
	}
	
	public int getAge() {
		if(this.getBirthday() != null) {
		Period period = Period.between(this.getBirthday(), LocalDate.now());
		return period.getYears();
		}else {
			return 0;
		}
		
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isMarried() {
		return married;
	}
	public void setMarried(boolean married) {
		this.married = married;
	}

	@Override
	public String toString() {
		return this.getClass().getName()
				+ "\n" +"[ id=" + id 
				+ "\n" +" password=" + password 
				+ "\n" +" email=" + email 
				+ "\n" +" gender=" + gender 
				+ "\n" +" name=" + name 
				+ "\n" +" birthday=" + birthday 
				+ "\n" +" phone=" + phone 
				+ "\n" +" address=" + address 
				+ "\n" +" married=" + (married?"已婚":"未婚")
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Customer))
			return false;
		Customer other = (Customer) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	
	
	
//	@Override
//	public boolean equals(Object obj) {
//		if(this==obj) return true;
//		
//		boolean answer = false;
//		if(obj instanceof Customer) {
//			Customer anotherCustomer = (Customer)obj;
//			answer = this.id != null && this.id.equals(anotherCustomer.id);
//		}
//		
//		return answer;
//	}
//
//	@Override
//	public int hashCode() {
//		
//		
//		return id!= null?id.hashCode():0;
//	}

	
	
	
	
	
	
	
}
