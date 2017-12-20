package com.sc.wxutil;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.http.client.ClientProtocolException;
/*
import org.apache.http.client.ClientProtocolException;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContextBuilder;
*/

public class HttpTest {

	public static void main(String[] args) {
		
		String protocol = "https";
		String ip = "120.24.54.2";
		String port = "8058";
		String communityNo = "1316879800";
		String buildNo = "001";
		String floorNo = "001";
		String roomNo = "401G";
		String acc = "6ceb05da4634c54c5480a191f714044e";
		String token = "fc3ddfd962cbea8c0dfa2565c496a9";
		
		
		EncryptUtil eu = new EncryptUtil();
		String sig = acc + token + dateFormat();
		;
		String signature;
		try {
			signature = eu.md5Digest(sig);
			String url = protocol + "://" + ip + ":" + port
					+ "?c=Qrcode&a=get&communityNo=" + communityNo + "&buildNo="
					+ buildNo + "&floorNo=" + floorNo + "&roomNo=" + roomNo
					+ "&sig=" + signature.toUpperCase();
			
//			CloseableHttpClient cclient = createSSLClientDefault();
//			
//			HttpPost hp = new HttpPost(url);
//			
//			CloseableHttpResponse response = cclient.execute(hp);
//			System.out.println(EntityUtils.toString(response.getEntity(), "UTF-8"));
//			long cuTime = System.currentTimeMillis();
//			HttpResponse httpResponse =  (HttpResponse) getNewHttpClient().execute(hp);
//			System.out.println("total time : "+(System.currentTimeMillis()-cuTime));
//			System.out.println(EntityUtils.toString(httpResponse.getEntity(), "UTF-8"));
			
			URL urlU = new URL(url);
			
			HttpsURLConnection conn = (HttpsURLConnection)urlU.openConnection();

			X509TrustManager tm = new X509TrustManager(){
				
		      public void checkClientTrusted(X509Certificate[] chain,String authType)
					 throws java.security.cert.CertificateException {
		      }

		      public void checkServerTrusted(X509Certificate[] chain,String authType)
		 			 throws java.security.cert.CertificateException {
		        if ((chain == null) || (chain.length == 0))
		          throw new IllegalArgumentException("null or zero-length certificate chain");
		        if ((authType == null) || (authType.length() == 0))
		          throw new IllegalArgumentException("null or zero-length authentication type");

		        boolean br = false;
		        Principal principal = null;
		       for (X509Certificate x509Certificate : chain) {   
		          principal = x509Certificate.getSubjectX500Principal();
		          if (principal != null) {
		            br = true;
		            return;
		          }
		        }
		        if (!(br))
		          throw new CertificateException("the server certificate is fail��");
		      }

		      public X509Certificate[] getAcceptedIssuers()
		      {
		        return new X509Certificate[0];
		      }

		    };
		    
		    TrustManager[] tm1 = {tm};
		    
		    SSLContext ctx = SSLContext.getInstance("TLS");
		    ctx.init(null, tm1, null);
		   
		    conn.setSSLSocketFactory(ctx.getSocketFactory());
		    conn.setHostnameVerifier(new HostnameVerifier() {
				
				@Override
				public boolean verify(String hostname, SSLSession session) {
					// TODO Auto-generated method stub
					return true;
				}
			});
		    
			conn.setRequestProperty("Content-Type", "application/xml;charset=utf-8");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestMethod("POST");
			conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
			
		    InputStream is = conn.getInputStream();
		    BufferedReader br = new BufferedReader(new InputStreamReader(is));
		    String ss = null;
		    String sT = null;
		    while((ss = br.readLine())!=null){
		    	sT = sT + ss;
		    }
			System.out.println("info: "+sT);
			
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (KeyManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		/*
		
		SSLContext ctx ;
		try {
			ctx = SSLContext.getInstance("SSL");
			
			X509TrustManager tm = new X509TrustManager()
		    {
		      public void checkClientTrusted(X509Certificate[] chain,String authType)
					 throws java.security.cert.CertificateException {
		      }

		      public void checkServerTrusted(X509Certificate[] chain,String authType)
		 			 throws java.security.cert.CertificateException {
		        if ((chain == null) || (chain.length == 0))
		          throw new IllegalArgumentException("null or zero-length certificate chain");
		        if ((authType == null) || (authType.length() == 0))
		          throw new IllegalArgumentException("null or zero-length authentication type");

		        boolean br = false;
		        Principal principal = null;
		       for (X509Certificate x509Certificate : chain) {   
		          principal = x509Certificate.getSubjectX500Principal();
		          if (principal != null) {
		            br = true;
		            return;
		          }
		        }
		        if (!(br))
		          throw new CertificateException("the server certificate is fail��");
		      }

		      public X509Certificate[] getAcceptedIssuers()
		      {
		        return new X509Certificate[0];
		      }

		    };
		    ctx.init(null, new TrustManager[] { tm }, new SecureRandom());
		    
		    
		    
		    CloseableHttpClient httpclient = HttpClients.createDefault();
		    
		    HttpRequest request = new Htt
		    
		    //httpclient.
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (KeyManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		   

	*/}

	public static String dateFormat() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		Date curDate = new Date(System.currentTimeMillis());
		return formatter.format(curDate);
	}
	/*
	public static CloseableHttpClient createSSLClientDefault() {

		try {
			SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(
					null, 
					new TrustStrategy() {
						// ��������
						public boolean isTrusted(X509Certificate[] chain,
						String authType) throws CertificateException {
							return true;
						}

					}
					   /*new X509TrustManager()
				    {
				      public void checkClientTrusted(X509Certificate[] chain,String authType)
							 throws java.security.cert.CertificateException {
				      }

				      public void checkServerTrusted(X509Certificate[] chain,String authType)
				 			 throws java.security.cert.CertificateException {
				        if ((chain == null) || (chain.length == 0))
				          throw new IllegalArgumentException("null or zero-length certificate chain");
				        if ((authType == null) || (authType.length() == 0))
				          throw new IllegalArgumentException("null or zero-length authentication type");

				        boolean br = false;
				        Principal principal = null;
				       for (X509Certificate x509Certificate : chain) {   
				          principal = x509Certificate.getSubjectX500Principal();
				          if (principal != null) {
				            br = true;
				            return;
				          }
				        }
				        if (!(br))
				          throw new CertificateException("the server certificate is fail��");
				      }

				      public X509Certificate[] getAcceptedIssuers()
				      {
				        return new X509Certificate[0];
				      }

				    }
					).build();

			SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
					sslContext);

			return HttpClients.custom().setSSLSocketFactory(sslsf).build();

		} catch (KeyManagementException e) {

			e.printStackTrace();

		} catch (NoSuchAlgorithmException e) {

			e.printStackTrace();

		} catch (KeyStoreException e) {

			e.printStackTrace();

		}

		return HttpClients.createDefault();

	}
	*/
	/*
	@SuppressWarnings("deprecation")
	public static HttpClient getNewHttpClient() {
		   try {
		       KeyStore trustStore = KeyStore.getInstance(KeyStore.getDefaultType());
		       trustStore.load(null, null);
		 
		       SSLSocketFactory sf = new SSLSocketFactoryEx(trustStore);
		       sf.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
		 
		       HttpParams params = new BasicHttpParams();
		       HttpProtocolParams.setVersion(params, HttpVersion.HTTP_1_1);
		       HttpProtocolParams.setContentCharset(params, HTTP.UTF_8);
		 
		       SchemeRegistry registry = new SchemeRegistry();
		       registry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
		       registry.register(new Scheme("https", sf, 443));
		 
		       ClientConnectionManager ccm = new ThreadSafeClientConnManager(params, registry);
		 
		       return new DefaultHttpClient(ccm, params);
		   } catch (Exception e) {
		       return new DefaultHttpClient();
		   }
		}
	*/
}
