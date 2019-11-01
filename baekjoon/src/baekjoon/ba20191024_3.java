package baekjoon;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ba20191024_3 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int num1;
		int num2;
		List<Integer> list = new ArrayList<Integer>();
		
		while(true) {
			num1 = scan.nextInt();
			num2 = scan.nextInt();
			if(num1 == 0 && num2 ==0) break;
			list.add(num1 + num2);
		}
		for(int i = 0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		
		
	}
}
