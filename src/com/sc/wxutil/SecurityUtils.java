package com.sc.wxutil;
import java.io.IOException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.crypto.Cipher;
import javax.xml.ws.Response;

public class SecurityUtils extends HttpServlet{

    private static final String ALGORITHM = "RSA";

    private static final String PUB_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBC" +
            "gKCAQEAxMmFHJs9+FRp28nlaBTwFUtOqw5jlzgbHKB65Db875/xa2Ruv5TXBlt6694t" +
            "mUFISun53e3vYBuEpgj3IDuwWcc0j8u1kv89ffIx3x2GOJCM54LqOh8dB+85xusBo2U" +
            "ojfRN0x48KeG6xDEhfw3h18nBHHRhPirXh0wgnF5FJejuvbbjMUiuXR1zyHvZ2IGT4Q" +
            "ROin9MELXUcf8ViwESZP8qJm67F8gLoppZj3sPfeYeagq5t8qmDqv/Gr7xe82eJ6mzZ" +
            "MYn7IPiK7TOCZTUD5rWDWBZHi66aDi/P6NxpSQMggjSBp4bDLeHeMMwf8jq7/4Lc3nL" +
            "3NbZXooMEnviGwIDAQAB";

    public static String RSA(String sourceStr) {
        return encrypt(sourceStr, PUB_KEY);
    }

//    public static String encryptPassWd(String passwd) {
//        return RSA("11111111" + passwd);
//    }

    private static PublicKey getPublicKeyFromX509(String algorithm,
                                                  String bysKey) throws NoSuchAlgorithmException, InvalidKeySpecException {
    	EncryptUtil eu = new EncryptUtil();
    	
    	byte[] decodedKey;
    	X509EncodedKeySpec x509 = null;
		try {
			decodedKey = eu.base64Decoder(bysKey).getBytes();
			x509 = new X509EncodedKeySpec(decodedKey);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//Base64.decode(bysKey);// Base64.DEFAULT);

        KeyFactory keyFactory = KeyFactory.getInstance(algorithm);
        return keyFactory.generatePublic(x509);
    }

    private static String encrypt(String content, String key) {
        try {
            PublicKey pubkey = getPublicKeyFromX509(ALGORITHM, key);

            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.ENCRYPT_MODE, pubkey);

            byte plaintext[] = content.getBytes("UTF-8");
            byte[] output = cipher.doFinal(plaintext);

            //String s = new String(Base64.encode(output, Base64.DEFAULT));
            EncryptUtil eu = new EncryptUtil();
            String s = eu.base64Encoder(new String(output,"UTF-8"));
            return s;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * test main func
     * @param agrs
     */
    public static void main(String[] agrs){
    	String communityNO = "1316879946";
    	String mobile = "13311111111";
    	String accSid = "98651082ab89c3f1b50f35caf794179f";
    	String accToken = "e687bc93c89b9b59611de521a70ed4";
    	String time = "1512081440";
    	SecurityUtils su = new SecurityUtils();
    	
    	String dataOrig = "communityNO="+communityNO+"&id="+accSid+"&token="+accToken+"&mobile="+mobile+"&time="+time;
    	
    	
    	//加密
    	
    	String s = SecurityUtils.RSA(dataOrig);
    	System.out.println(s);
    	
    	
    	
    	
    	//编码
    	
    	//HttpServletResponse response = new 
    	//http://www.iteye.com/problems/70191
    	
    }
    
}
