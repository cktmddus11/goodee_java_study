package p20191104;

import java.util.Scanner;

class Solution2 {
	  public boolean solution(String s) {
	      boolean answer = true;
	      
	      if(s.length() == 4 || s.length() ==6) {
	    	  for(int i = 0;i<s.length();i++) {
	    		  char ch = s.charAt(i);
	    		  if(ch < 48 || ch > 58) {  // 숫자가 아니면
	    			  answer = false;
	    			  return answer;
	    		  }
	    	  }
	      }else {
	    	  answer = false;
	      }

	      return answer;
	  }
}

public class P12918 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String str = scan.next();
		Solution2 s = new Solution2();
		System.out.println(s.solution(str));
	}
}
