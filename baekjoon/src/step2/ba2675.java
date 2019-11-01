package step2;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class ba2675 {
	public static void main(String[] args) {
	Scanner scan = new Scanner(System.in);
	Map<Integer, String> map = new HashMap<Integer, String>();
	int cnt = scan.nextInt();
	for(int i = 0;i<cnt;i++) {
		int key1 = scan.nextInt();
		String value = scan.nextLine();
		map.put(key1, value.trim());	
	}
	StringBuffer result = new StringBuffer();
	for(Integer key : map.keySet()) {
		String str = map.get(key);
		for(int j = 0;j< str.length();j++) {
			for(int i = 0;i<key;i++) {
				result.append(str.charAt(j));
			}
		}
		System.out.println(result);
		result.setLength(0);
	}
	
	
	
	}
}
