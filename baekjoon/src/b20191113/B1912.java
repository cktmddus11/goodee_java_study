package b20191113;

import java.util.Scanner;

public class B1912 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int a = scan.nextInt(); // ���� 1000
		int b = scan.nextInt(); // ���� 70
		int price = scan.nextInt(); // �Ѵ� 170
		
		if (b >= price) {
			System.out.println(-1);
			return;
		}  
		int result = (a / (price - b)) + 1;
		System.out.println(result);
		
	}
}
