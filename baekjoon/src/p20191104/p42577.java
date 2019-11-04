package p20191104;

import java.util.Scanner;

class Solution {
    public boolean solution(String[] phone_book) {
    	boolean answer = false;
    	for(int i = 1;i<phone_book.length;i++) { 
    		if(phone_book[i].contains(phone_book[0])) {
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
