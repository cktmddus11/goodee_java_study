package b20191107;

import java.util.*;

public class B9012 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int num = scan.nextInt();
		boolean check = false;
		
		for (int i = 0; i < num; i++) {
			Stack<Byte> stack = new Stack<Byte>();
			byte[] arr = scan.next().getBytes();

			for (byte b : arr) {
				if (b == '(') {
					stack.push(b);
				} else {
					if(!stack.empty()) {
						stack.pop();
					}else {
						check = true;
					}
				}
			}
			
			if(check) {
				System.out.println("YES");
			}else {
				System.out.println("NO");
			}
			check = false;
		}
	}
}
