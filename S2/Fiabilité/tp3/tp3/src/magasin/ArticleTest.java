package magasin;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

public class ArticleTest {

	Article article;
	Article article1Copie;
	Article article2;
	Article article3;
	Article article4;
	@Before
	public void init() {
		article = new Article("Chaussure", 25, 2);
		article1Copie = new Article("Chaussure", 25, 2);
		article2 = new Article("Chaussette", 30, 3);
		article3 = new Article("Chaussure", 10, 2);
		article4 = new Article("Chaussure", 25, 4);
		
	}
	
	@Test(expected=AssertionError.class)
	public void testErreurConstructeurPrix() {
		@SuppressWarnings("unused")
		Article articleErreur = new Article("Chaussure", -5, 2);
	}
	
	@Test(expected=AssertionError.class)
	public void testErreurConstructeurNom() {
		@SuppressWarnings("unused")
		Article articleErreur = new Article("", 10, 2);
	}
	
	@Test(expected=AssertionError.class)
	public void testErreurConstructeurNumero() {
		@SuppressWarnings("unused")
		Article articleErreur = new Article("Chaussure", 10, -2);
	}
	
	@Test
	public void testGetNom() {
		assertEquals("Chaussure", article.getNom());
	}
	
	@Test
	public void testGetPrix() {
		assertEquals(25, article.getPrix(), 0.01);
	}
	
	@Test
	public void testGetNumero() {
		assertEquals(2, article.getNumero(), 0.01);
	}
	
	@Test
	public void testIsEqual() {
		assertEquals(true, article.isEqual(article1Copie));
	}
	
	@Test
	public void testIsNotEqual() {
		assertEquals(false, article.isEqual(article2));
	}
	
	@Test
	//meme nom mais pas même prix
	public void testIsEqual2() {
		assertEquals(false, article.isEqual(article3));
	}
	
	@Test
	//meme nom même prix mais pas même numéro
	public void testIsEqual3() {
		assertEquals(false, article.isEqual(article4));
	}
	
	@Test
	//prix inférieur
	public void testSmallerThan() {
		assertEquals(true, article.smallerThan(article2));
	}
	
	@Test
	//prix identique mais numéro inférieur
	public void testSmallerThan2() {
		assertEquals(true, article.smallerThan(article4));
	}
	
	@Test
	//prix supérieur
	public void testNotSmallerThan() {
		assertEquals(false, article2.smallerThan(article));
	}
	
	@Test
	//prix identique mais numéro supérieur
	public void testNotSmallerThan2() {
		assertEquals(false, article4.smallerThan(article));
	}

}
