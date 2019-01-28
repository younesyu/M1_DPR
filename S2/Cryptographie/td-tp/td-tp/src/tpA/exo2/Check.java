package tpA.exo2;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.xml.bind.DatatypeConverter;

public class Check {
	public static String hashVerified;
	
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
				if(line.contains("X-AUTH")) {
					hashVerified = line.split(" ")[1];
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
	public static void check(String file) {
		String corps = getCorpMail(file);
		
		String hash = null;
		try {
			MessageDigest fonctionDeHachage = MessageDigest.getInstance("MD5");
			fonctionDeHachage.update(corps.getBytes());
			byte[] digest = fonctionDeHachage.digest();
			hash = DatatypeConverter.printHexBinary(digest);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(hash);
		System.out.println(hashVerified);
		if(hash.equals(hashVerified)) {
			System.out.println("Mail ok");
		}
		else {
			System.out.println("Problème dans le mail !");
		}
	}
	
	public static void main(String[] args) {
		check("src/exo2/email1-auth.txt");
	}
}
