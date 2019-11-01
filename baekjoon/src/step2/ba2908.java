package step2;

import java.util.Scanner;

public class ba2908 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String num1 = scan.next();
		String num2 = scan.nextLine();
		
		char[] b1 = num1.toCharArray();
		char[] b2 = num2.toCharArray();
		
		num1 = "";
		num2 = "";
		
		for(int i = b1.length-1;i>=0;i--) {
			num1 += b1[i];
		}
		for(int i = b2.length-1;i>=0;i--) {
			num2 += b2[i];
		}
		int re1 = Integer.parseInt(num1.trim());
		int re2 = Integer.parseInt(num2.trim());
		
		System.out.println(re1 > re2?re1:re2);
	
	}
}
