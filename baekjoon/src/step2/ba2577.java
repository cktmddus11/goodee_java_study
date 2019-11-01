package step2;

import java.util.Scanner;

public class ba2577 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int arr[] = new int[3];
		int cnt[] = new int[10]; // 0 ~ 9 가 있으면 증감할 cnt변수 
		int result = 1;
		for(int i = 0;i<3;i++) {
			arr[i] = scan.nextInt();
			result *= arr[i];
		}
		
		char[] arr2 = new char[(result+"").length()];
		for(int i = 0;i<arr2.length;i++) {
			arr2[i] = (result+"").charAt(i);
			for(char j = '0';j<='9';j++) {
				if(arr2[i] == j) cnt[j-'0']++; 
			}
		}
		
		for(int a : cnt) {
			System.out.println(a);
		}
		

	}

}
