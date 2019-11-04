package step2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ba1152 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String str = null;
		int cnt = 0;
		str = br.readLine();

		String[] str2 = str.split(" ");
		for (int i = 0; i < str2.length; i++) {
			if (str2[i].isEmpty()) {
				cnt++;
			}
		}
		System.out.println(str2.length - cnt);

	}
}
