package step2;

import java.util.Scanner;

public class ba11720 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int cnt = scan.nextInt();
		String num = scan.next();
		
		int arr[] = new int[cnt];
		int sum= 0;
		for(int i = 0;i<cnt;i++) {
			char ch = num.charAt(i);
			arr[i] = Integer.parseInt(ch+"");
			sum = sum + arr[i];
		}
		
		System.out.println(sum);
		
		
		
	}

}
