package com.ecommerce.helper;

public class Helper {

    public static String get10Words(String desc) {
        String[] split = desc.split(" ");

        if (split.length > 10) {
            String result = "";
            for (int i = 0; i < 10; i++) {
                result +=split[i]+" ";            
            }
            return (result+"...");
        } else {
            return desc+"...";
        }
        

    }
}
