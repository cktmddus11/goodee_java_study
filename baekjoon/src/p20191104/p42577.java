package p20191104;

import java.util.HashSet;
import java.util.Scanner;

class Solution {
	public boolean solution(String[] phone_book) {
		HashSet<String> hs = new HashSet<String>();
		for (int i = 1; i < phone_book.length; i++) {
			hs.add(phone_book[i]);
		}

		boolean answer = false;
		for (String item : hs) {
			if (item.contains(phone_book[0])) {
				return answer;
			}
		}
		answer = true;
		return answer;
	}
}

public class p42577 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String str = scan.nextLine();
		String str2[] = str.split(" ");
		Solution s = new Solution();
		System.out.println(s.solution(str2));

	}

}
