package com.sc.wxutil;
import java.io.IOException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.util.Date;

import javax.crypto.Cipher;

import org.apache.commons.codec.binary.Base64;

public class RSATest {
	
	private static String TRANSFORMATION = "RSA/ECB/PKCS1Padding ";
    private static String ALGORITHM = "RSA";
    
    /**  
     * 解码  
     * @param str  
     * @return string  
     */    
    public static byte[] decode(String str){    
    byte[] bt = null;    
    try {    
        sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();    
        bt = decoder.decodeBuffer( str );    
    } catch (IOException e) {    
        e.printStackTrace();    
    }    
    
        return bt;    
    }  
    
	/**
     * 用私钥解密
     *
     * @param encryptedData 经过encryptedData()加密返回的byte数据
     * @param privateKey    私钥
     */
    public static byte[] decryptData(byte[] encryptedData, PrivateKey privateKey) {
        try {
            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            cipher.init(Cipher.DECRYPT_MODE, privateKey);
            return cipher.doFinal(encryptedData);
        } catch (Exception e) {
            return null;
        }
    }
    
    public static PublicKey loadPublicKey(String publicKeyStr) throws Exception {
        try {
            byte[] buffer = decode(publicKeyStr);
            KeyFactory keyFactory = KeyFactory.getInstance(ALGORITHM);
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(buffer);
            return (RSAPublicKey) keyFactory.generatePublic(keySpec);
        } catch (NoSuchAlgorithmException e) {
            throw new Exception("无此算法");
        } catch (InvalidKeySpecException e) {
            throw new Exception("公钥非法");
        } catch (NullPointerException e) {
            throw new Exception("公钥数据为空");
        }
    }
    
    public static byte[] encryptData(byte[] data, PublicKey publicKey) {
        try {
            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            // 编码前设定编码方式及密钥
            cipher.init(Cipher.ENCRYPT_MODE, publicKey);
            // 传入编码数据并返回编码结果
            return cipher.doFinal(data);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
    /**
     * @param communityNO  communityNo
     * @param mobile  手机号码
     * @param accSid  account  sid
     * @param accToken account token
     * @param cardNo  cardNo  if cardNo is null , it will return all cards ,if not ,it will return card that key is cardNo 
     * cardNo 如果不传该参数，即dataOrig中没有cardNo这个参数，则返回该手机号下所有房卡；否则返回指定房卡。
     */
    static void encryTest(String communityNO,String areaCode,String mobile,String accSid,String accToken,String cardNo){
    	String PUB_KEY = 
    			"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqxqOJg0kqL4/xoNf0iDb" + "\r" +
				"jz/oM7ujsXOd92vQDkwO/rCP9wwZY0AvrMhcc56X4LmIbsbc1EZQ5ryMrIDbyCgt" + "\r" +
				"pgJJTQG/u/FBiwG2Yvqgx+9keVGZhBA+Oph34HFPWz4OEB+Py4QkaJPXALkjjh2Z" + "\r" +
				"f7Lgpv5gO8gRyg/o9FwCOZyEGiUmVorwPvwT3oMeNPCHxzlpGzdqV1kfqNmbS4Zk" + "\r" +
				"CiXGNhxxN0LJDnhaJJUl4bcnUjpcIxUlgSMX2CcooffIk3E1ROP051Xf/zmUWE6D" + "\r" +
				"TcGetf6ni2s2irDCgeanylyjLTgM6xaOYWqtG0yUC5lyzO46yTmE1Q47XMM2h1KJ" + "\r" +
				"swIDAQAB" + "\r";
    	
    	//时间戳
    	String time = new Date().getTime()/1000 +"";
    	String dataOrig = "no="+communityNO+"&id="+accSid+"&token="+accToken+"&areaCode="+areaCode+"&mobile="+mobile+"&time="+time; 
    	if(null != cardNo){
    		dataOrig = dataOrig + "&cardNo="+cardNo;
    	}
    	
    	//dataOrig = "communityNo=1316879946" + "&id=" + "98651082ab89c3f1b50f35caf794179f" + "&token=" + "e687bc93c89b9b59611de521a70ed4" + "&mobile=18221690497" + "&time=" + "1455521444";
    	//加密
    	byte[] data = dataOrig.getBytes();
    	
    	try {
    		//加载公钥
    		PublicKey publicKey = loadPublicKey(PUB_KEY);
    		//加密
    		byte[] cipherBytes = encryptData(data, publicKey);
    		//base64位编码
			String b64 = new String(Base64.encodeBase64(cipherBytes));
			String urlCode = java.net.URLEncoder.encode(b64,"utf-8");
			//构造url
			/*****************************************/
			/***重定向URL,将下面url在自己web系统中进行重定向即可。**/
			String redirectUrl = "http://cz.uclbrt.com/apiLogin/?data="+urlCode;
			System.out.println(redirectUrl);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    
   public static String encryTest1(String communityNO,String areaCode,String mobile,String accSid,String accToken,String cardNo){
    	String PUB_KEY = 
    			"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqxqOJg0kqL4/xoNf0iDb" + "\r" +
				"jz/oM7ujsXOd92vQDkwO/rCP9wwZY0AvrMhcc56X4LmIbsbc1EZQ5ryMrIDbyCgt" + "\r" +
				"pgJJTQG/u/FBiwG2Yvqgx+9keVGZhBA+Oph34HFPWz4OEB+Py4QkaJPXALkjjh2Z" + "\r" +
				"f7Lgpv5gO8gRyg/o9FwCOZyEGiUmVorwPvwT3oMeNPCHxzlpGzdqV1kfqNmbS4Zk" + "\r" +
				"CiXGNhxxN0LJDnhaJJUl4bcnUjpcIxUlgSMX2CcooffIk3E1ROP051Xf/zmUWE6D" + "\r" +
				"TcGetf6ni2s2irDCgeanylyjLTgM6xaOYWqtG0yUC5lyzO46yTmE1Q47XMM2h1KJ" + "\r" +
				"swIDAQAB" + "\r";
    	
    	//时间戳
    	String time = new Date().getTime()/1000 +"";
    	String dataOrig = "no="+communityNO+"&id="+accSid+"&token="+accToken+"&areaCode="+areaCode+"&mobile="+mobile+"&time="+time; 
    	if(null != cardNo){
    		dataOrig = dataOrig + "&cardNo="+cardNo;
    	}
    	
    	//dataOrig = "communityNo=1316879946" + "&id=" + "98651082ab89c3f1b50f35caf794179f" + "&token=" + "e687bc93c89b9b59611de521a70ed4" + "&mobile=18221690497" + "&time=" + "1455521444";
    	//加密
    	byte[] data = dataOrig.getBytes();
    	
    	try {
    		//加载公钥
    		PublicKey publicKey = loadPublicKey(PUB_KEY);
    		//加密
    		byte[] cipherBytes = encryptData(data, publicKey);
    		//base64位编码
			String b64 = new String(Base64.encodeBase64(cipherBytes));
			String urlCode = java.net.URLEncoder.encode(b64,"utf-8");
			//构造url
			/*****************************************/
			/***重定向URL,将下面url在自己web系统中进行重定向即可。**/
			String redirectUrl = "http://cz.uclbrt.com/apiLogin/?data="+urlCode;
			System.out.println(redirectUrl);
			return redirectUrl;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "";
    }
    
}
