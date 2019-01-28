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

public class ChercherTest4 {
	
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
	
	@Test(timeout=1000)
	public void testValeurExistante() {
		assertEquals(true,chercher.chercher4(5, test1));
	}
	
	@Test(timeout=1000)
	public void testValeurIndice0() {
		assertEquals(true, chercher.chercher4(1, test1));
	}
	
	@Test(timeout=1000)
	public void testValeurDernierIndice() {
		assertEquals(true, chercher.chercher4(8, test1));
	}
	
	@Test(timeout=5000)
	public void testValeurMulti() {
		assertEquals(true, chercher.chercher4(2, test1));
	}
	
	@Test(timeout=1000)
	public void testValeurInconnue() {
		assertEquals(false, chercher.chercher4(15, test1));
	}
	
	@Test(timeout=1000)
	public void testTableauVide() {
		assertEquals(false, chercher.chercher4(5, test2));
	}
	
	@Test(timeout=1000)
	public void testTableauNul() {
		assertEquals(false, chercher.chercher4(5, null));
	}

}
