package baekjoon;

import java.util.Scanner;

public class ba20191024_4 {

	public static void main(String[] args) {
		int num[] = new int[9];
		Scanner scan = new Scanner(System.in);
		
		for(int i = 0;i<num.length;i++) {
			num[i] = scan.nextInt();
		}
		int max = num[0];
		int a = 0;
		for(int i = 0;i<num.length;i++) {
			if(max < num[i]) {
				max = num[i];
				a = i+1;
			}
		}
		System.out.println(max+"\n"+a);
		
	}

}
