package step2;

import java.util.Scanner;

public class ba2562 {
	public static void main(String[] args) {		
		int arr[] = new int[9];
		int max = 0;
		int idx = 0;
		Scanner scan= new Scanner(System.in);
		for(int i = 0;i<arr.length;i++) {
			arr[i] = scan.nextInt();
			if(arr[i] < 100) {
				if(max < arr[i]) {
					max = arr[i];
					idx = i+1;
				}
			}
		}
		System.out.printf("%d\n%d", max, idx);
		
		
		

	}

}
