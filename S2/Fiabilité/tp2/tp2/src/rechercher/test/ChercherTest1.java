/**
 * @authror Sébastien Gonzalez
 * @author Younes Rouabhia
 */
package rechercher.test;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import rechercher.src.Chercher;
import rechercher.src.Recherche;

public class ChercherTest1 {
	
	Chercher chercher;
	int[] test1;
	int[] test2;
	int[] test3;
	
	@Before
	public void setUp() throws Exception {
		chercher = new Chercher();
		test1 = new int[]{1,2,2,5,8};
		test2 = new int[]{};
		test3 = null;
	}
	
	@Test
	public void testValeurExistante() {
		assertEquals(true,chercher.chercher1(1, test1));
	}
	
	@Test
	public void testValeurIndice0() {
		assertEquals(true, chercher.chercher1(5, test1));
	}
	
	@Test
	public void testValeurDernierIndice() {
		assertEquals(true, chercher.chercher1(8, test1));
	}
	
	@Test
	public void testValeurMulti() {
		assertEquals(true, chercher.chercher1(5, test1));
	}
	
	@Test
	public void testValeurInconnue() {
		assertEquals(false, chercher.chercher1(15, test1));
	}
	
	@Test
	public void testTableauVide() {
		assertEquals(false, chercher.chercher1(5, test2));
	}
	
	@Test
	public void testTableauNul() {
		assertEquals(false, chercher.chercher1(5, null));
	}

}
