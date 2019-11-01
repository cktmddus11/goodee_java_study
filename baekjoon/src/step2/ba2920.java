package step2;

import java.util.Scanner;

public class ba2920 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int arr[] = new int[8]; // 음계 설정 오름차순
		int re[] = new int[8]; // 입력할 음계
		String result = "";
		for(int i = 0;i<arr.length;i++) {
			arr[i] = i+1;
		}
		
		for(int i = 0;i<arr.length;i++) {
			re[i] = scan.nextInt();
		}
		
		
			if(re[0]==1) {
				for(int i = 0;i<arr.length;i++) {
					if(arr[i] != re[i]) break;
					if(i==7) result = "ascending";
				}
				
			}else if(re[0] == 8) {
				for(int i = 7;i>=0;i--) {
					if(arr[i] != re[i]) break;
					if(i==0) result ="descending";
				}
				
			}else {
				result = "mixed";
			}
			
			System.out.println(result);
		

	}

}
