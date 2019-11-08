package b20191107;

import java.util.Scanner;
import java.util.Stack;

public class B10773 {

	public static void main(String[] args) {
		Stack <Integer> stack = new Stack<Integer>();
		Scanner scan = new Scanner(System.in);
		int ss = scan.nextInt();
		int num[] = new int[ss];
		for(int a = 0;a<ss;a++) {
			num[a]= scan.nextInt();
		}
		for(int i = 0;i<num.length;i++) {
			if(num[i] != 0) {
				stack.push(num[i]);	
			}else {
				stack.pop();
			}
		}
		
		int sum= 0;
		for(int j = 0;j<stack.size();j++) {
			sum = sum + stack.get(j);
		}
		System.out.println(sum);
	}

}
