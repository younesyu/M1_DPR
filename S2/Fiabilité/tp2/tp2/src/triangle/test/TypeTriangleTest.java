/**
 * @authror S�bastien Gonzalez
 * @author Younes Rouabhia
 */
package triangle.test;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import triangle.src.Triangle;

public class TypeTriangleTest {

	Triangle triangleTest;

	@Before
	public void init() {
		triangleTest = new Triangle();
	}

	//entrées valides
	@Test
	public void testEquilateral() {
		int valeurAttendue = 3;
		int valeur = triangleTest.typeTriangle(12, 12, 12);
		assertEquals(valeurAttendue, valeur);
	}

	@Test
	//a==b != c
	public void testIsocele() {
		int valeurAttendue = 2;
		int valeur = triangleTest.typeTriangle(12, 12, 14);
		assertEquals(valeurAttendue, valeur);
	}
	
	@Test
	//a==c != b
	public void testIsocele2() {
		int valeurAttendue = 2;
		int valeur = triangleTest.typeTriangle(12, 14, 12);
		assertEquals(valeurAttendue, valeur);
	}

	@Test
	//b==c != a
	public void testIsocele3() {
		int valeurAttendue = 2;
		int valeur = triangleTest.typeTriangle(14, 12, 12);
		assertEquals(valeurAttendue, valeur);
	}

	@Test
	public void testScalene() {
		int valeurAttendue = 1;
		int valeur = triangleTest.typeTriangle(20, 17, 11);
		assertEquals(valeurAttendue, valeur);
	}
	
	//entrées invalides
	@Test
	//a>b+c
	public void testValeurCorrectMaisPasTriangle() {
		int valeurAttendue = -1;
		int valeur = triangleTest.typeTriangle(15, 1, 1);
		assertEquals(valeurAttendue, valeur);
	}
	
	@Test
	//b>a+c
	public void testValeurCorrectMaisPasTriangle2() {
		int valeurAttendue = -1;
		int valeur = triangleTest.typeTriangle(1, 15, 1);
		assertEquals(valeurAttendue, valeur);
	}
	
	@Test
	//c>a+b
	public void testValeurCorrectMaisPasTriangle3() {
		int valeurAttendue = -1;
		int valeur = triangleTest.typeTriangle(1, 1, 15);
		assertEquals(valeurAttendue, valeur);
	}

	@Test
	public void testValeurNulleA() {
		int valeurAttendue = -1;
		int valeur = triangleTest.typeTriangle(0, 15, 15);
		assertEquals(valeurAttendue, valeur);
	}
	
	@Test
	public void testValeurNulleB() {
		int valeurAttendue = -1;
		int valeur = triangleTest.typeTriangle(15, 0, 15);
		assertEquals(valeurAttendue, valeur);
	}
	
	@Test
	public void testValeurNulleC() {
		int valeurAttendue = -1;
		int valeur = triangleTest.typeTriangle(16, 15, 0);
		assertEquals(valeurAttendue, valeur);
	}

	@Test
	public void testTriangleValeurNegativeA() {
		int valeurAttendue = -1;
		int valeur = triangleTest.typeTriangle(-1, 18, 2);
		assertEquals(valeurAttendue, valeur);
	}
	
	@Test
	public void testTriangleValeurNegativeB() {
		int valeurAttendue = -1;
		int valeur = triangleTest.typeTriangle(2, -5, 3);
		assertEquals(valeurAttendue, valeur);
	}
	
	@Test
	public void testTriangleValeurNegativeC() {
		int valeurAttendue = -1;
		int valeur = triangleTest.typeTriangle(2, 5, -3);
		assertEquals(valeurAttendue, valeur);
	}

}
