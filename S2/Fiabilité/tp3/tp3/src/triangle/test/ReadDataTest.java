/**
 * @authror Sébastien Gonzalez
 * @author Younes Rouabhia
 */
package triangle.test;

import java.io.FileNotFoundException;
import java.nio.file.NoSuchFileException;
import java.util.Arrays;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import triangle.src.Triangle;

public class ReadDataTest {

	Triangle triangleTest;

	@Before
	public void init() {
		triangleTest = new Triangle();
	}

	@Test
	public void testFichierValide() throws NoSuchFileException {
		double[] tabAttendu = { 12, 12, 12 };
		double[] tab = triangleTest.readData("src/triangle/test/FichierTriangle/Valide.txt");

		Assert.assertTrue(Arrays.equals(tab, tabAttendu));
	}

	@Test
	public void testFichierVide() throws NoSuchFileException {
		double[] tabAttendu = { -1, -1, -1 };
		double[] tab = triangleTest.readData("src/triangle/test/FichierTriangle/Vide.txt");
		System.out.println(tab[0]);
		Assert.assertTrue(Arrays.equals(tab, tabAttendu));
	}

	@Test
	public void testFichierMauvaisNombreDeLigne() throws NoSuchFileException {
		double[] tabAttendu = { -1, -1, -1 };
		double[] tab = triangleTest.readData(("src/triangle/test/FichierTriangle/MauvaisNombreDeLigne.txt"));
		Assert.assertTrue(Arrays.equals(tab, tabAttendu));
	}
	
	@Test
	public void testFichierMauvaisNombreDeChiffre() throws NoSuchFileException {
		double[] tabAttendu = { -1, -1, -1 };
		double[] tab = triangleTest.readData(("src/triangle/test/FichierTriangle/MauvaisNombreDeChiffre.txt"));
		Assert.assertTrue(Arrays.equals(tab, tabAttendu));
	}

	@Test
	public void testFichierMauvaisFormatDeLigne() throws NoSuchFileException{
		double[] tabAttendu = { -1, -1, -1 };
		double[] tab = triangleTest.readData("src/triangle/test/FichierTriangle/LigneIncorrect.txt");
		Assert.assertTrue(Arrays.equals(tab, tabAttendu));
	}

	@Test(expected = NoSuchFileException.class)
	public void testFichierInexistant() throws NoSuchFileException {
		double[] tab = triangleTest.readData("src/triangle/test/FichierTriangle/ceFichierExistePas.txt");
	}

	@Test
	public void testFichierBinaire() throws NoSuchFileException {
		double[] tabAttendu = { -1, -1, -1 };
		double[] tab = triangleTest.readData("src/triangle/test/FichierTriangle/binaire");
		Assert.assertTrue(Arrays.equals(tab, tabAttendu));
	}


}
