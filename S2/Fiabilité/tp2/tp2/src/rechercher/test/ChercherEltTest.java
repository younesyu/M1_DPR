/**
 * @authror Sébastien Gonzalez
 * @author Younes Rouabhia
 */
package rechercher.test;

import static org.junit.Assert.*;

import java.nio.file.NoSuchFileException;
import java.util.Arrays;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import rechercher.src.Recherche;

public class ChercherEltTest {

	int[] test1;
	int[] test2;
	int[] test3;
	
	@Before
	public void setUp() throws Exception {
		test1 = new int[]{1,3,4,4,6,8};
		test2 = new int[]{};
		test3 = null;
	}
	
	@Test
	public void testValeurExistante() {
		assertEquals(1, Recherche.chercherElt(3, test1));
	}
	
	@Test
	public void testValeurIndice0() {
		assertEquals(0, Recherche.chercherElt(1, test1));
	}
	
	@Test
	public void testValeurDernierIndice() {
		assertEquals(5, Recherche.chercherElt(8, test1));
	}
	
	@Test
	public void testValeurMulti() {
		assertEquals(2, Recherche.chercherElt(4, test1));
	}
	
	@Test
	public void testValeurInconnue() {
		assertEquals(-1, Recherche.chercherElt(15, test1));
	}
	
	@Test
	public void testTableauVide() {
		assertEquals(-1, Recherche.chercherElt(5, test2));
	}
	
	@Test
	public void testTableauNul() {
		assertEquals(-1, Recherche.chercherElt(5, null));
	}

}
