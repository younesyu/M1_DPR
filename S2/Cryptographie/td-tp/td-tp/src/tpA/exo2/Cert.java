package tpA.exo2;

// -*- coding: utf-8 -*-
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.xml.bind.DatatypeConverter;

public class Cert {

	public static String getCorpMail(String file) {
		String corps = "";
		boolean isCorps = false;
		Path source = Paths.get(file);

		// Ouverture en lecture :
		try (BufferedReader reader = Files.newBufferedReader(source, StandardCharsets.UTF_8)) {
			String line;
			// Read through file one line at time. Print line # and line
			while ((line = reader.readLine()) != null) {
				if (isCorps)
					corps += line + "\r\n";
				if (line.equals("")) {
					isCorps = true;
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// reader.close();
		}

		return corps;
	}

	public static String calculHash(String corpsMail, String secret) {
		String hash = null;
		try {
			String c = corpsMail + secret + "\r\n";
			MessageDigest fonctionDeHachage = MessageDigest.getInstance("MD5");
			fonctionDeHachage.update(c.getBytes());
			byte[] digest = fonctionDeHachage.digest();
			hash = DatatypeConverter.printHexBinary(digest);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return hash;
	}

	public static String incertHash(String file, String hash) {
		Path source = Paths.get(file);

		String mailHash = "";
		// Ouverture en lecture :
		try (BufferedReader reader = Files.newBufferedReader(source, StandardCharsets.UTF_8)) {
			String line;
			// Read through file one line at time. Print line # and line
			while ((line = reader.readLine()) != null) {
				if (line.equals("")) {
					mailHash += "X-AUTH: " + hash + "\r\n";
				}
				mailHash += line + "\r\n";
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// reader.close();
		}

		return mailHash;
	}
	
	private static void writeMailHash(String file, String mail) {
		Path source = Paths.get(file);
		try ( BufferedWriter writer = Files.newBufferedWriter(source, StandardCharsets.UTF_8) )  {
			writer.write(mail);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public static void cert(String file) {
		String corps = getCorpMail(file);
		System.out.println("Corps : \n\n" + corps);

		String hash = calculHash(corps, "c5dcb78732e1f3966647655229729843");
		System.out.println("Hash : " + hash + "\n");
		
		String mailHash = incertHash(file, hash);
		System.out.println("Mail hash : \n" + mailHash);
		
		writeMailHash("src/exo2/email1-auth.txt", mailHash);
		System.out.println("Fichier mail auth crée");

	}

	public static void main(String[] args) {

		cert("src/exo2/email1.txt");
	}
}

/*
 * $ $ cat butokuden.jpg | md5 aeef572459c1bec5f94b8d62d5d134b5 $ javac
 * Resume.java $ java Resume Le résumé MD5 du fichier "butokuden.jpg" vaut:
 * 0xaeef572459c1bec5f94b8d62d5d134b5 $
 */
