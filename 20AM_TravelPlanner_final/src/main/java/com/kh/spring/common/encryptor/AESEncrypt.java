package com.kh.spring.common.encryptor;

	import java.io.File;
	import java.io.FileInputStream;
	import java.io.FileOutputStream;
	import java.io.IOException;
	import java.io.ObjectInputStream;
	import java.io.ObjectOutputStream;
	import java.io.UnsupportedEncodingException;
	import java.security.NoSuchAlgorithmException;
	import java.security.SecureRandom;
	import java.util.Base64;

	import javax.crypto.Cipher;
	import javax.crypto.KeyGenerator;
	import javax.crypto.SecretKey;


	public class AESEncrypt {
		//AES방식으로 양방향 암호화하는 객체
		//생성과 동시에 암호화키를 생성 또는 있는 키를 가져오기
		//암호화처리 메소드작성
		//복호화처리(해독) 메소드작성
		
		//키값을 저장하는 객체가 있음
		//SecretKey객체로 생성한 key값을 저장
		// *암호화관련 패키지 javax.crypto패키지에 만들어져 있음
		
		private static SecretKey key;
		private String path;
		
		public AESEncrypt(String path) {
			//생성자, 객체가 생성될때 key값을 초기화하자
			this.path=path;
			File f=new File(path+"/secret.bs");
			System.out.println("파일있니?" +f.exists());
			//파일이 있으면?
			if(f.exists()) {
				//있는 파일 불러오기
				try(ObjectInputStream ois=new ObjectInputStream(new FileInputStream(f));){
					key=(SecretKey)ois.readObject();
				}catch(ClassNotFoundException e) {
					e.printStackTrace();
				}catch(IOException e) {
					e.printStackTrace();
				}
			}else {
				//없으면 생성
				try {
					generateKey();
				}catch(NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
			}
					
					
		}
		
		
		
		
		//key를 생성하는 매소드
		private void generateKey() throws NoSuchAlgorithmException {
			SecureRandom sr=new SecureRandom();//암호화 키를 위한 솔트값
			KeyGenerator keyGen;//key를생성해서 저장하는 객체
			
			keyGen=KeyGenerator.getInstance("AES");//AES방식의 key 값을 생성 설정
			//생성된 알고리즘으로 key값 초기화 시키기
			keyGen.init(128,sr);//키값을 초기화 설정
			key=keyGen.generateKey();//key값 생성
						
			//생성된 key값은 파일로 저장하여 관리함.
			//파일의 경로는 
			File f=new File(path+"/secret.bs");
			try(ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(f));){
				oos.writeObject(key);
			}catch(IOException e) {
				e.printStackTrace();
			}
			
		}
		
		//암호화 메소드 만들기
		//필요한곳에서 사용할 수 있게 static으로 작성
		public static String encrypt(String str) {
			//Cipher객체를 이용하여 암호화를 진행
			byte[] enStr=null;
			try {
				Cipher cipher=Cipher.getInstance("AES");//cipher설정 암호화 방식 지정
				cipher.init(Cipher.ENCRYPT_MODE, key);//cipher설정 암호화 key값 지정
				enStr=cipher.doFinal(str.getBytes());//암호화처리
			}catch (Exception e) {
				e.printStackTrace();
				//NoSuchAlgorithmException, NoSuchPaddingExcpetion,
				//IlligalBlockSizeExcpetion, BadPaddingException,
				//InvalidKeyException
				return str;
			}
			//암호화된 비트를 base64인코더를 이용하여 문자열 처리
			return enStr!=null?Base64.getEncoder().encodeToString(enStr):str;
		}
		
		//복호화 매소드만들기
		public static String decrypt(String str) throws UnsupportedEncodingException{
			byte[] decrptStr=null;
			try {
				Cipher cipher=Cipher.getInstance("AES");
				cipher.init(Cipher.DECRYPT_MODE, key);
				//Base64를 이용하여 문자열로 인코딩을 하였기때문에 원본값을 가져오려면
				//Base64디코더를 이용하여 원본 byte[]값으로 만들어줌
				byte[] decodeStr=Base64.getDecoder().decode(str.getBytes());
				decrptStr=cipher.doFinal(decodeStr);
			}catch(Exception e) {
				e.printStackTrace();
				return str;
			}
			return new String(decrptStr,"UTF-8");
			
		}
		
		
	}

