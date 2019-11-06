package p20191105;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Solution {
    public String solution(String[] participant, String[] completion) {
    	String answer = "";
    	int a[] = new int[participant.length];
    	
    	for(int i = 0;i<participant.length;i++) {
    		for(int j = 0;j<completion.length;j++) {
    			if(participant[i].equals(completion[j])) {
    				a[i] = 1;
    			}
    		}
    	}
//    	for(int i = 0;i<a.length;i++) {
//    		System.out.print(a[i]+"   ");
//    	}
    	for(int i = 0;i<a.length;i++) {
    		if(a[i] == 0) {
    			answer += participant[i];
    			
    		}
        }
         
    	return answer; 
    }
}

public class P42576 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String str1 = scan.nextLine();
		String  str2 = scan.nextLine();
		String [] participant = 	str1.split(" ");
		String[] completion = str2.split(" ");
		Solution s = new Solution();
		System.out.println(s.solution(participant, completion));
	}
}
