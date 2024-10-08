public class stringCompression {
    public static void main(String[] args) {
        System.out.println(Compressed("a2b1a3"));
    }

    static String Compressed(String S){
        int n = S.length();
        // array to store frequencies 
        int[] frequency = new int[26];

        // for loop to add character frequency values to the array
        for (int i = 0; i < n; i++) {
            char ch = S.charAt(i); // char value
            i++; // updating to get its frequency Value
            int freq = Character.getNumericValue(S.charAt(i));
            
            frequency[ch - 'a']+=freq;
        }    
        StringBuilder compressed = new StringBuilder();
        for(int i =0; i<26; i++){
            if(frequency[i]>0){
                compressed.append((char)(i + 'a')).append(frequency[i]);
            }
        }
        
        return compressed.toString();
    }
}
