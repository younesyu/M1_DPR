package tpC.test;

import java.util.Arrays;

import org.junit.Assert;
import org.junit.Test;

import tpC.Aes;

public class AesTest {

	@Test
	public void testSubytes() {
		Aes aes = new Aes();
		aes.State = new byte[]{(byte) 0x89,0x2e,2,3,0,1,2,3,0,1,2,3,0,1,2,3};
		
		aes.afficher_le_bloc(aes.State);
		aes.SubBytes();
		
		byte[] resultat = {0x63, 0x7c, 0x77, 0x7B,
					0x63, 0x7c, 0x77, 0x7B,
					0x63, 0x7c, 0x77, 0x7B,
					0x63, 0x7c, 0x77, 0x7B};
		
		aes.afficher_le_bloc(aes.State);
		//Assert.assertTrue(Arrays.equals(resultat, aes.State));
		
		aes.InvSubBytes();
		
		aes.afficher_le_bloc(aes.State);
	}
	
	@Test
	public void testShiftRows() {
		Aes aes = new Aes();
		aes.State = new byte[]{(byte)0xA0,(byte)0xB0,(byte)0xC0,(byte)0xD0,(byte)0xA1,(byte)0xB1,(byte)0xC1,(byte)0xD1,(byte)0xA2,(byte)0xB2,(byte)0xC2,(byte)0xD2,(byte)0xA3,(byte)0xB3,(byte)0xC3,(byte)0xD3};
		
		//aes.afficher_le_bloc(aes.State);
		aes.ShiftRows();
		
		byte[] resultat = {(byte)0xA0, (byte)0xB1, (byte)0xC2, (byte)0xD3,
				(byte)0xA1, (byte)0xB2, (byte)0xC3, (byte)0xD0,
				(byte)0xA2, (byte)0xB3, (byte)0xC0, (byte)0xD1,
				(byte)0xA3, (byte)0xB0, (byte)0xC1, (byte)0xD2};
		
		//aes.afficher_le_bloc(aes.State);
		Assert.assertTrue(Arrays.equals(resultat, aes.State));
	}
	
	@Test
	public void testMixColumns() {
		Aes aes = new Aes();
		aes.State = new byte[]{(byte)0x0E,(byte)0x09,(byte)0x0D,(byte)0x0B,(byte)0x0B,(byte)0x0E,(byte)0x09,(byte)0x0D,(byte)0x0D,(byte)0x0B,(byte)0x0E,(byte)0x09,(byte)0x09,(byte)0x0D,(byte)0x0B,(byte)0x0E};
		
		//aes.afficher_le_bloc(aes.State);
		aes.MixColumns();
		
		byte[] resultat = {(byte)0x01, (byte)0x00, (byte)0x00, (byte)0x00,
				(byte)0x00, (byte)0x01, (byte)0x00, (byte)0x00,
				(byte)0x00, (byte)0x00, (byte)0x01, (byte)0x00,
				(byte)0x00, (byte)0x00, (byte)0x00, (byte)0x01 };
		
		//aes.afficher_le_bloc(aes.State);
		Assert.assertTrue(Arrays.equals(resultat, aes.State));
	}
	
	@Test
	public void testMixAddRoundKey() {
		Aes aes = new Aes();
		aes.State = new byte[]{(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF,(byte)0xFF};
		
		//aes.afficher_le_bloc(aes.State);
		aes.AddRoundKey(1);
		
		byte[] resultat = {(byte)0x9D, (byte)0x9C, (byte)0x9C, (byte)0x9C,
				(byte)0x9D, (byte)0x9C, (byte)0x9C, (byte)0x9C,
				(byte)0x9D, (byte)0x9C, (byte)0x9C, (byte)0x9C,
				(byte)0x9D, (byte)0x9C, (byte)0x9C, (byte)0x9C };
		
		//aes.afficher_le_bloc(aes.State);
		Assert.assertTrue(Arrays.equals(resultat, aes.State));
	}

}
