package step2;

import java.util.Scanner;

public class ba10809 {

   public static void main(String[] args) {
      Scanner scan = new Scanner(System.in);
      int arr[] = new int[26];
      for(int i = 0;i<arr.length;i++) {
         arr[i] = -1;
      }
      
      String str = scan.next();
      str = str.toLowerCase();
      if(str.length()>100) {
          str = str.substring(0, 100);
       }
      for(int i = 0;i<str.length();i++) { 
         char b = str.charAt(i);
         if(i>0) {
            if(str.charAt(i-1)== str.charAt(i)) {
               continue;
            }
         }
         arr[b-'a'] = i;
      }
      for(int a : arr) {
         System.out.print(a+" ");
      }
   }


}